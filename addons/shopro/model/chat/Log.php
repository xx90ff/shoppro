<?php

namespace addons\shopro\model\chat;

use think\Model;
use addons\shopro\library\chat\Online;
/**
 * 消息记录表
 */
class Log extends Model
{

    // 表名,不含前缀
    protected $name = 'shopro_chat_log';
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    // 追加属性
    protected $append = [
    ];


    public function scopeUser($query) {
        $query->where('sender_identify', 'user');
    }


    public function scopeCustomerService($query)
    {
        $query->where('sender_identify', 'customer_service');
    }


    /**
     * 全部拼接 cdnurl
     *
     * @param string $value
     * @param array $data
     * @return string
     */
    public function getMessageAttr($value, $data)
    {
        if ($data['message_type'] == 'image') {
            $message = cdnurl($value, Online::getDomain());
        } else if (in_array($data['message_type'], ['order', 'goods'])){
            $messageArr = json_decode($value, true);
            $messageArr['image'] = cdnurl($messageArr['image'], Online::getDomain());

            $message = json_encode($messageArr);
        } else if ($data['message_type'] == 'text') {
            // 全文匹配图片拼接 cdnurl
            $url = cdnurl('/uploads', Online::getDomain());
            $message = str_replace("<img src=\"/uploads", "<img style=\"width: 100%;!important\" src=\"" . $url, $value);
        } else {
            $message = $value;
        }

        return $message;
    }


    // 多对多关联发消息人身份
    public function identify()
    {
        return $this->morphTo(['sender_identify', 'sender_id'], [
            'user' => \addons\shopro\model\chat\User::class,
            'customer_service' => \addons\shopro\model\chat\CustomerService::class,
        ]);
    }
}
