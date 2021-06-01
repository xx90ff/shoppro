<?php

namespace addons\shopro\listener\order;

use addons\shopro\exception\Exception;
use addons\shopro\model\OrderItem;
use addons\shopro\model\Config;
use addons\shopro\model\Order;

/**
 * 订单确认收货
 */
class Confirm
{
    // 订单确认收货后
    public function orderConfirmAfter(&$params)
    {
        $order = $params['order'];
        $order = Order::where('id', $order['id'])->find();

        // 更新收货时间
        $order->ext = json_encode($order->setExt($order, ['confirm_time' => time()]));      // 收货时间
        $order->save();

        // 添加自动好评队列
        $config = Config::where('name', 'order')->cache(300)->find();        // 读取配置自动缓存 5 分钟
        $config = isset($config) ? json_decode($config['value'], true) : [];
        $close_days = (isset($config['order_auto_comment']) && $config['order_auto_comment'] > 0)
            ? $config['order_auto_comment'] : 7;       // 单位天 

        \think\Queue::later(($close_days * 86400), '\addons\shopro\job\OrderAutoOper@autoComment', $params, 'shopro');

        return $order;
    }
}
