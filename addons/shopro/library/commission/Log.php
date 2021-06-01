<?php

namespace addons\shopro\library\commission;

use addons\shopro\model\commission\Log as LogModel;
use addons\shopro\model\commission\Agent as AgentModel;



/**
 * 分销商动态通知
 */
class Log
{
    /**
     * 添加分销动态
     * @param int         $agentId       分销商用户ID
     * @param string      $eventName     事件标识: agent=分销商,level=等级变动,order=分销业绩,team=团队,reward=佣金,share=绑定关系
     * @param string      $operType      操作人类型: user=用户,admin=管理员,system=系统自动
     * @param string      $ext           扩展字段
     * @param object      $event         事件对象
     * @param object      $oper          操作人
     * @param string      $remark        备注，传值则为自定义备注
     */
    public static function add($agentId, $eventName, $operType, $ext = [], $event = null, $oper = null, $remark = '')
    {
        if(isset($event['id'])) {
            $eventId = $event['id'];
        } else {
            $eventId = 0;
        }
        
        if ($remark === '') {
            switch ($eventName) {
                case 'agent':
                    if ($event) $eventId = $event['user_id'];
                    switch ($ext['field']) {
                        case 'status':
                            switch ($ext['data']) {
                                case 'pending':
                                    $remark = "您的资料已提交,等待管理员审核";
                                    break;
                                case 'forbidden':
                                    $remark = "您的账户已被禁用";
                                    break;
                                case 'normal':
                                    $remark = "恭喜您成为分销商";
                                    break;
                                case 'freeze':
                                    $remark = "您的账户已被冻结";
                                    break;
                            }
                            break;
                        case 'level': // 变更等级
                            $eventName = 'level';
                            $eventId = $ext['data']['level'];
                            $remark = "您的等级已变更为{$ext['data']['name']}";
                            break;
                        case 'parent_agent_id': // 更改推荐人
                            if (!$ext['data']) {
                                $remark = "您的推荐人已变更为平台直推";
                            } else {
                                $remark = "绑定用户{$ext['data']['nickname']}为您的推荐人";
                            }
                            break;
                        case 'upgrade_lock':
                            if ($ext['data']) {
                                $remark = '已关闭自动升级';
                            } else {
                                $remark = '已允许自动升级';
                            }
                            break;
                        case 'apply_info':
                            $remark = '更新分销商资料';
                            break;
                        case 'info_status':
                            switch ($ext['data']) {
                                case -1:
                                    $remark = '您的资料已被驳回,请重新修改';
                                    break;
                                case 0:
                                    $remark = '您的资料还未完善,请及时上传您的资料';
                                    break;
                                case 1:
                                    $remark = '恭喜您的资料审核已通过';
                                    break;
                            }
                            break;
                    }
                    break;
                case 'order':
                    if($ext['action'] == 'payed') {
                        $goodsName = $ext['order_item']['goods_title'];
                        if (mb_strlen($goodsName) > 9) {
                            $goodsName = mb_substr($goodsName, 0, 5) . '...' . mb_substr($goodsName, -3);
                        }
                        if ($event['self_buy'] == 1) {
                            $remark = "您购买了{$goodsName},为您新增业绩{$event['amount']}元,+1分销订单";
                        } else {
                            $remark = "用户{$oper['nickname']}购买了{$goodsName},为您新增业绩{$event['amount']}元,+1分销订单";
                        } 
                    }elseif($ext['action'] == 'refund') {
                        if($operType == 'admin') {
                            $remark = "扣除业绩{$event['amount']}元,-1分销订单";
                        }elseif($operType == 'user') {
                            $remark = "用户{$oper['nickname']}已退款,已扣除业绩{$event['amount']}元,-1分销订单";
                        }
                    }
                  
                    break;
                case 'level':
                    if ($event) $eventId = $event['level'];
                    $remark = "您的等级已变更为{$event['name']}";
                    break;
                case 'team':
                    $remark = "您的直推用户{$oper['nickname']}已成为分销商";
                    break;
                case 'rewardIncome':    // 奖金记录 入账
                    if ($operType == 'admin') {
                        $remark = "您有{$event['commission']}元佣金已入账";
                    } else {
                        switch ($ext['action']) {
                            case 'payed':
                                $actionStr = '支付成功';
                                break;
                            case 'confirm':
                                $actionStr = '已确认收货';
                                break;
                            case 'finish':
                                $actionStr = '已完成订单';
                                break;
                        }
                        $remark = "用户{$oper['nickname']}{$actionStr},您有{$event['commission']}元佣金已入账";
                    }
                    $eventName = 'reward';
                    break;
                case 'rewardDeduct':    // 奖金记录 扣除
                    if ($operType == 'admin') {
                        $remark = "您有{$event['commission']}元佣金已扣除";
                    } else {
                        $remark = "用户{$oper['nickname']}已退款,您有{$event['commission']}元佣金已扣除";
                    }
                    $eventName = 'reward';
                    break;
                case 'share':
                    $remark = "您已成为用户{$oper['nickname']}的推荐人";
                    break;
            }
        }

        if ($remark !== '') {
            $logData = [
                'agent_id' => $agentId,
                'event' => $eventName,
                'event_id' => $eventId,
                'remark' => $remark,
                'oper_type' => $operType,
                'oper_id' => !empty($oper) ? $oper['id'] : 0,
                'createtime' => time()
            ];
            LogModel::create($logData);
        }

        // self::noticeParentAgent($agentId, $eventName, $operType, $ext = [], $event = null, $oper = null);
    }

    // 检查是否通知上级
    private static function noticeParentAgent($agentId)
    {
        $parentAgentId = AgentModel::get($agentId)->parent_agent_id;
        if ($parentAgentId) {
            return $parentAgentId;
        }
        return false;
    }
}
