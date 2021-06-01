<?php

namespace addons\shopro\model\commission;

use think\Model;

class Level extends Model
{
    // 表名
    protected $name = 'shopro_commission_agent_level';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 追加属性
    protected $append = [
    ];

    public function getCommissionRulesAttr($value, $data)
    {
        return json_decode($value, true);
    }

    public function getUpgradeRulesAttr($value, $data)
    {
        return json_decode($value, true);
    }

    public function getImageAttr($value, $data)
    {
        if (!empty($value)) return cdnurl($value, true);
    }
}
