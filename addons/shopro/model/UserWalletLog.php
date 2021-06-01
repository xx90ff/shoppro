<?php

namespace addons\shopro\model;

use think\Model;
use addons\shopro\exception\Exception;
use think\Db;
use app\admin\library\Auth as AdminAuth;

/**
 * 钱包
 */
class UserWalletLog extends Model
{

    // 表名,不含前缀
    protected $name = 'shopro_user_wallet_log';
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = false;

    protected $hidden = ['deletetime'];


    // 追加属性
    protected $append = [
        'type_name',
        'wallet_type_name'
    ];

    public static $typeAll = [
        // money
        'wallet_pay' => ['code' => 'wallet_pay', 'name' => '余额付款'],
        'recharge' => ['code' => 'recharge', 'name' => '用户充值'],
        'admin_recharge' => ['code' => 'admin_recharge', 'name' => '后台充值'],
        'admin_deduct' => ['code' => 'admin_deduct', 'name' => '后台扣除'],
        'cash' => ['code' => 'cash', 'name' => '提现'],
        'cash_error' => ['code' => 'cash_error', 'name' => '提现驳回'],
        'wallet_refund' => ['code' => 'wallet_refund', 'name' => '余额退款'],
        'commission_income' => ['code' => 'commission_income', 'name' => '佣金收益'],
        'commission_back' => ['code' => 'commission_back', 'name' => '佣金扣除'],

        // score
        'sign' => ['code' => 'sign', 'name' => '签到'],
        'score_pay' => ['code' => 'score_pay', 'name' => '积分付款'],
        'score_back_order' => ['code' => 'score_back_order', 'name' => '取消订单退回'],
    ];


    public static $walletTypeAll = [
        'money' => '余额',
        'score' => '积分'
    ];

    public function scopeMoney($query)
    {
        return $query->where('wallet_type', 'money');
    }

    public function scopeScore($query)
    {
        return $query->where('wallet_type', 'score');
    }

    public function scopeAdd($query)
    {
        return $query->where('wallet', '>', 0);
    }

    public function scopeReduce($query)
    {
        return $query->where('wallet', '<', 0);
    }


    public static function doAdd($user, $wallet, $type, $item_id, $wallet_type, $is_add = 0, $ext = [])
    {
        // $self = new self();

        // $self->user_id = $user->id;
        // $self->wallet = $wallet;
        // $self->type = $type;                     // 这个字段受到  model type 影响
        // $self->item_id = $item_id;
        // $self->wallet_type = $wallet_type;
        // $self->is_add = $is_add;
        // $self->ext = json_encode($ext);
        // $self->save();

        // 自动获取操作人
        if (strpos(request()->url(), 'store.store') !== false) {
            // 门店
            $oper = Store::info();
            $oper_type = 'store';
            $oper_id = $oper ? $oper['id'] : 0;
        } else if (strpos(request()->url(), 'addons') !== false) {
            // 用户
            $oper = User::info();
            $oper_type = 'user';
            $oper_id = $oper ? $oper->id : $user['id'];
        } else {
            $adminAuth = AdminAuth::instance();     // 没有登录返回的还是这个类实例
            $oper = null;
            if ($adminAuth){
                $oper = $adminAuth->getUserInfo();
            }
            if ($oper) {
                $oper_type = 'admin';
                $oper_id = $oper['id'];
            } else {
                $oper_type = 'system';
                $oper_id = 0;
            }
        }

        $self = self::create([
            "user_id" => $user->id,
            "wallet" => $is_add ? $wallet : -$wallet,       // 符号直接存到记录里面
            "type" => $type,
            "item_id" => $item_id,
            "wallet_type" => $wallet_type,
            // "is_add" => $is_add,
            "ext" => json_encode($ext),
            "oper_type" => $oper_type,
            "oper_id" => $oper_id
        ]);

        // 钱包变动通知
        $user->notify(
            new \addons\shopro\notifications\Wallet([
                'walletLog' => $self,
                'event' => $wallet_type == 'money' ? 'wallet_change' : 'score_change'
            ])
        );

        return $self;
    }


    public static function getList($wallet_type, $status = 'all')
    {
        $user = User::info();

        $walletLogs = self::{$wallet_type}();

        if ($status != 'all') {
            $walletLogs = $walletLogs->{$status}();
        }

        $walletLogs = $walletLogs->where(['user_id' => $user->id])
            ->order('id', 'DESC')->paginate(10);
        foreach ($walletLogs as $w) {
            $w->avatar = $user->avatar;

            switch ($w['type']) {
                case 'wallet_pay':
                    $item = OrderItem::where('order_id', $w->item_id)->order('id', 'asc')->find();
                    $w->avatar = $item['goods_image'] ?? '';
                    $w->title = $item['goods_title'] ?? '';
                    break;
                case 'wallet_refund':
                    $ext = json_decode($w->ext, true);
                    $item_id = $ext['item_id'] ?? 0;
                    if ($item_id) {
                        $item = OrderItem::get($item_id);
                    } else {
                        $item = OrderItem::where('order_id', $w->item_id)->order('id', 'asc')->find();
                    }
                    
                    $w->avatar = $item['goods_image'] ?? '';
                    $w->title = $item['goods_title'] ?? '';
                    break;
                case 'cash':
                case 'cash_error':
                    $userWalletApply = UserWalletApply::get($w->item_id);
                    $apply = ($userWalletApply && $userWalletApply['bank_info']) ? (is_array($userWalletApply['bank_info']) ? $userWalletApply['bank_info'] : json_decode($userWalletApply['bank_info'], true)) : [];
                    $w->avatar = $user->avatar;
                    $w->title = $apply['bank_name'] ?? '';
                    break;
            }
        }
        return $walletLogs;
    }



    public static function getTypeName($type)
    {
        return isset(self::$typeAll[$type]) ? self::$typeAll[$type]['name'] : '';
    }


    public function getTypeNameAttr($value, $data)
    {
        return self::getTypeName($data['type']);
    }


    public function getWalletTypeNameAttr($value, $data)
    {
        return self::$walletTypeAll[$data['wallet_type']] ?? '';
    }


    public function getWalletAttr($value, $data)
    {
        return $data['wallet_type'] == 'score' ? intval($value) : $value;
    }
}
