<?php

namespace addons\shopro\controller\commission;

use addons\shopro\model\commission\Reward as CommissionReward;
use addons\shopro\library\commission\Agent as AgentLibrary;
use addons\shopro\library\commission\Config as ConfigLibrary;

class Reward extends Commission
{

    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];


    /**
     * Undocumented function
     */
    public function index()
    {
        $params = $this->request->get();

        $rewards = CommissionReward::getList($params);

        $this->success('获取成功', $rewards);
    }


    /**
     * 分销订单
     */
    public function order()
    {
        $params = $this->request->get();

        $orders = CommissionReward::getOrders($params);

        $this->success('获取成功', $orders);
    }
}
