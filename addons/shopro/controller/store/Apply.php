<?php

namespace addons\shopro\controller\store;

use addons\shopro\exception\Exception;
use addons\shopro\controller\Base as ShoproBase;

/**
 * 不继承门店的 base
 */
class Apply extends ShoproBase
{

    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];


    public function info() {
        $config = new \addons\shopro\model\Config;

        $storeConfig = json_decode($config->where(['name' => 'store'])->cache(3600)->value('value'), true);

        $this->success('门店申请', [
            'apply' => \addons\shopro\model\store\Apply::info(),
            'config' => $storeConfig
        ]);
    }


    public function apply() {
        $params = $this->request->post();

        // 表单验证
        $this->shoproValidate($params, get_class(), 'apply');

        $order = \addons\shopro\model\store\Apply::apply($params);

        $this->success('门店申请提交成功', $order);
    }

}
