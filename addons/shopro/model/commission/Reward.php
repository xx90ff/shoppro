<?php

namespace addons\shopro\model\commission;

use think\Model;
use addons\shopro\library\commission\Agent as AgentLibrary;
use addons\shopro\model\User;

class Reward extends Model
{
    // 表名
    protected $name = 'shopro_commission_reward';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    // 追加属性
    protected $append = [
        'status_name'
    ];

    const REWARD_WAITING = 0;
    const REWARD_BACK = -1;
    const REWARD_ENTRY = 1;


    /**
     * 获取佣金明细
     *
     * @return array
     */
    public static function getList($params)
    {
        $user = User::info();
        extract($params);

        // 获取佣金记录
        $rewards = self::buildSearch($params)->with(['buyer'])->order('id', 'desc')->paginate($per_page ?? 10);

        // 获取查询条件的总佣金
        $total_money = self::buildSearch($params)->sum('commission');

        return [
            'rewards' => $rewards,
            'total_money' => $total_money
        ];
    }


    /**
     * 构建查询条件
     */
    private static function buildSearch($params) {
        $user = User::info();
        extract($params);
        
        $date = isset($date) ? explode('-', $date) : [];
        $start = $date[0] ? strtotime($date[0]) : strtotime(date('Y-m') . '-01');
        $end = $date[1] ? (strtotime($date[1]) + 86399) : strtotime(date('Y-m-d') + 86399);

        $rewards = self::where('agent_id', $user->id);

        $type = $type ?? 'all';
        if ($type != 'all' && in_array($type, ['waiting', 'back', 'entry'])) {
            $rewards = $rewards->{$type}();
        }

        $rewards = $rewards->whereBetween('createtime', [$start, $end]);

        return $rewards;
    }


    /**
     * 获取分销订单列表
     *
     * @return array
     */
    public static function getOrders($params)
    {
        $user = User::info();
        extract($params);

        $type = $type ?? 'all';
        $orders = self::where('agent_id', $user->id);

        if ($type != 'all' && in_array($type, ['waiting', 'back', 'entry'])) {
            $orders = $orders->{$type}();
        }

        $orders = $orders->group('order_id')->with(['order.item_slim.agent_reward', 'buyer' => function($query) {
            $query->withField('id,avatar,nickname');
        }])->order('id', 'desc')->paginate($per_page ?? 10);
        $orders = $orders->toArray();

        $ordersData = $orders['data'];
        $newData = [];
        foreach ($ordersData as $key => $data) {
            $item = [];
            foreach($data['order']['item_slim'] as $k => $it) {
                if ($it['agent_reward']) {
                    $item[] = $it;
                }
            }
            $data['order']['item_slim'] = $item;
            $data['order']['buyer'] = $data['buyer'];
            $newData[] = $data['order'];
        }

        $orders['data'] = $newData;
        return $orders;
    }


    public function getStatusNameAttr($value, $data) {
        $status_name = '';
        
        switch($data['status']) {
            case self::REWARD_BACK :
                $status_name = '已退回';
                break;
            case self::REWARD_WAITING :
                $status_name = '待入账';
                break;
            case self::REWARD_ENTRY :
                $status_name = '已入账';
                break;
        }

        return $status_name;
    }


    /**
     * 待入账
     */
    public function scopeWaiting($query) {
        return $query->where('status', self::REWARD_WAITING);
    }
    /**
     * 已退回
     */
    public function scopeBack($query) {
        return $query->where('status', self::REWARD_BACK);
    }

    /**
     * 已入账
     */
    public function scopeEntry($query) {
        return $query->where('status', self::REWARD_ENTRY);
    }
   


    public function buyer()
    {
        return $this->belongsTo(\addons\shopro\model\User::class, 'buyer_id');
    }


    public function order()
    {
        // 要把 下单人信息移除
        return $this->belongsTo(\addons\shopro\model\Order::class, 'order_id')
                ->field('id,type,order_sn,user_id,activity_type,goods_amount,dispatch_amount,status,total_amount,score_amount,total_fee,discount_fee,pay_fee,score_fee,goods_original_amount,pay_type,paytime,ext,createtime');
    }

    public function orderItem()
    {
        return $this->belongsTo(\addons\shopro\model\OrderItem::class, 'order_item_id')->field('id,user_id,order_id,goods_id,goods_title, goods_sku_text,goods_image,goods_original_price,goods_price,goods_num');
    }
}
