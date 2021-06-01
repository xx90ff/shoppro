<?php

namespace addons\shopro\controller;

use addons\shopro\model\Share as ShareModel;

class Share extends Base
{

    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];


    /**
     * 获取分享记录
     *
     * @return void
     */
    public function index()
    {
        $params = $this->request->get();

        $shares = ShareModel::getList($params);
        return $this->success('获取成功', $shares);
    }


    public function add()
    {
        $params = $this->request->post();
        $params['platform'] = $this->request->header('platform');
        $shareLog = ShareModel::add($params);
        if ($shareLog) {
            \think\Hook::listen('share_after', $shareLog);
            $this->success('添加分享记录', $shareLog);
        }
    }
}