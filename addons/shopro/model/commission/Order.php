<?php

namespace addons\shopro\model\commission;

use think\Model;

class Order extends Model
{
    // 表名
    protected $name = 'shopro_commission_order';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';
    protected $deleteTime = false;


    public function user()
    {
        return $this->belongsTo(\addons\shopro\model\User::class, 'buyer_id')->field('id,avatar,nickname');
    }


    public function orderItem()
    {
        return $this->belongsTo(\addons\shopro\model\OrderItem::class, 'order_item_id')->field('id,user_id,order_id,goods_id,goods_title, goods_sku_text,goods_image,goods_original_price,goods_price,goods_num');
    }
}
