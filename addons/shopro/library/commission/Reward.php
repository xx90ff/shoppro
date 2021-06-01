<?php

namespace addons\shopro\library\commission;

use addons\shopro\model\commission\Level as LevelModel;
use addons\shopro\model\commission\Order as OrderModel;
use addons\shopro\model\commission\Reward as RewardModel;
use addons\shopro\model\User as UserModel;


/**
 * 结算奖金
 */
class Reward
{
    /**
     * 执行奖金计划,直接派发佣金
     * 
     * @param string    $event                     分佣的事件
     * @param mixed     $commissionOrder|$commissionOrderId           分销订单 
     * @param array     $oper                      操作人
     */
    public function runCommisisonRewardByOrder($event, $commissionOrder, $oper)
    {
        if (is_numeric($commissionOrder)) {
            $commissionOrder = OrderModel::get($commissionOrder);
        }

        // 未找到分销订单
        if (!$commissionOrder) {
            return false;
        }

        // 已经操作过了
        if ($commissionOrder['commission_reward_status'] !== 0) {
            return false;
        }

        $commissionEvent = $commissionOrder['commission_event'];

        // 不满足分佣事件
        if ($commissionEvent !== $event && $event !== 'admin') {
            return false;
        }

        // 防止重复添加佣金
        $commissionRewards = RewardModel::all([
            'commission_order_id' => $commissionOrder['id'],
            'status' => 0,
        ]);

        // 更新分销订单结算状态
        $commissionOrder->commission_reward_status = 1;
        $commissionOrder->commission_time = time();
        $commissionOrder->save();

        if ($event == 'admin') {
            $operType = 'admin';
        } else {
            $operType = 'user';
        }
        // 添加分销商收益、余额添加钱包、更新分销佣金结算状态、提醒分销商到账
        if ($commissionRewards) {
            foreach ($commissionRewards as $reward) {
                $agent = new Agent($reward->agent_id);
                if ($agent && $agent->isAgentAvaliable()) {
                    $agent->agent->setInc('total_income', $reward->commission);
                    UserModel::moneyAdd($reward->agent_id, $reward->commission, 'commission_income', $reward->id, $reward);
                    $reward->status = 1;
                    $reward->save();
                    Log::add($agent->user->id, 'rewardIncome', $operType, ['action' => $event], $reward, $oper);
                }
            }
            return true;
        }
        return false;
    }

    /**
     * 执行奖金计划,直接派发佣金 只能系统后台调用
     * 
     * @param string    $event                     分佣的事件
     * @param mixed     $commisisonReward|$commisisonRewardId           奖金记录 
     * @param array     $oper                      操作人
     */
    public function runCommisisonRewardById($event, $commissionReward, $oper)
    {
        // 不满足分佣事件
        if ($event !== 'admin') {
            return false;
        }

        if (is_numeric($commissionReward)) {
            $commissionReward = RewardModel::get($commissionReward);
        }

        // 未找到奖金记录
        if (!$commissionReward) {
            return false;
        }

        if ($commissionReward->status == 0) {
            $rewardAgent = new Agent($commissionReward->agent_id);
            $rewardAgent->agent->setInc('total_income', $commissionReward->commission);
            UserModel::moneyAdd($commissionReward->agent_id, $commissionReward->commission, 'commission_income', $commissionReward->id, $commissionReward);
            $commissionReward->status = 1;
            $commissionReward->save();
            Log::add($rewardAgent->user->id, 'rewardIncome', 'admin', [], $commissionReward, $oper);
            return true;
        }
        return false;
    }


    /**
     * 扣除分销订单所有奖金
     * 
     * @param string   $event                     分佣的事件
     * @param mixed    $commissionOrder|$commissionOrderId           分销订单 
     * @param array     $oper                      操作人
     * @param array     $deleteOrder               扣除分销商的订单业绩  默认扣除
     * @param array     $deleteReward              扣除分销订单奖金     默认扣除
     */
    public function backCommisisonRewardByOrder($event, $commissionOrder, $oper, $deleteOrder = 1, $deleteReward = 1)
    {
        if ($event == 'refund') {
            $config = new Config();
            $deleteOrder = $config->getRefundCommissionOrder() ? 1 : 0;
            $deleteReward = $config->getRefundCommissionReward() ? 1 : 0;
        }

        if (!$deleteOrder && !$deleteReward) {
            return false;
        }

        if (is_numeric($commissionOrder)) {
            $commissionOrder = OrderModel::get($commissionOrder);
        }

        // 未找到分销订单
        if (!$commissionOrder) {
            return false;
        }

        if ($event == 'admin') {
            $operType = 'admin';
        } else {
            $operType = 'user';
        }

        // 扣除分销商的订单业绩
        if ($commissionOrder->commission_order_status == 1 && $deleteOrder == 1) {
            $commissionOrder->commission_order_status = -1;
            $commissionOrder->save();
            $orderAgent = new Agent($commissionOrder->agent_id);
            if ($orderAgent->agent->order_money < $commissionOrder->amount) {
                $orderAgent->agent->order_money = 0;
                $orderAgent->agent->save();
            } else {
                $orderAgent->agent->setDec('order_money', $commissionOrder->amount);
            }
            if ($orderAgent->agent->order_count < 1) {
                $orderAgent->agent->order_count = 0;
                $orderAgent->agent->save();
            } else {
                $orderAgent->agent->setDec('order_count', 1);
            }
            $orderAgent->asyncAgentUpgrade($orderAgent->agent->user_id);
            Log::add($commissionOrder['agent_id'], 'order', $operType, ['action' => 'refund'], $commissionOrder, $oper);
        }


        if ($commissionOrder->commission_reward_status == 1 && $deleteReward == 1) {
            $commissionOrder->commission_reward_status = -1;
            $commissionOrder->save();
            // 防止重复扣除佣金
            $commissionRewards = RewardModel::all([
                'commission_order_id' => $commissionOrder->id,
                'status' => 1,
            ]);

            if ($commissionRewards) {

                foreach ($commissionRewards as $reward) {
                    $rewardAgent = new Agent($reward->agent_id);
                    if ($rewardAgent->agent->total_income < $reward->commission) {
                        $rewardAgent->agent->total_income = 0;
                        $rewardAgent->agent->save();
                    } else {
                        $rewardAgent->agent->setDec('total_income', $reward->commission);
                    }
                    UserModel::moneyReduce($reward->agent_id, $reward->commission, 'commission_income', $reward->id, $reward);
                    $reward->status = -1;
                    $reward->save();
                }
                Log::add($rewardAgent->user->id, 'rewardDeduct', $operType, [], $reward, $oper);
                return true;
            }
        }

        return false;
    }

    /**
     * 将奖金直接扣除  只能系统后台调用
     * 
     * @param string    $event                     分佣的事件
     * @param mixed     $commisisonReward|$commisisonRewardId           奖金记录 
     * @param array     $oper                      操作人
     */
    public function backCommisisonRewardById($event, $commissionReward, $oper)
    {
        // 不满足分佣事件
        if ($event !== 'admin') {
            return false;
        }

        if (is_numeric($commissionReward)) {
            $commissionReward = RewardModel::get($commissionReward);
        }

        // 未找到奖金记录
        if (!$commissionReward) {
            return false;
        }

        if ($commissionReward->status == 1) {
            $rewardAgent = new Agent($commissionReward->agent_id);
            if ($rewardAgent->agent->total_income < $commissionReward->commission) {
                $rewardAgent->agent->total_income = 0;
                $rewardAgent->agent->save();
            } else {
                $rewardAgent->agent->setDec('total_income', $commissionReward->commission);
            }
            UserModel::moneyReduce($commissionReward->agent_id, $commissionReward->commission, 'commission_back', $commissionReward->id, $commissionReward);
            $commissionReward->status = -1;
            $commissionReward->save();
            Log::add($rewardAgent->user->id, 'rewardDeduct', 'admin', [], $commissionReward, $oper);
            return true;
        }
        return false;
    }
}
