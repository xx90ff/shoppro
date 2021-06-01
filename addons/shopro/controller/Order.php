<?php

namespace addons\shopro\controller;


class Order extends Base
{

    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];


    public function index()
    {
        $params = $this->request->get();

        $this->success('订单列表', \addons\shopro\model\Order::getList($params));
    }



    public function detail()
    {
        $params = $this->request->get();
        $this->success('订单详情', \addons\shopro\model\Order::detail($params));
    }


    public function itemDetail()
    {
        $params = $this->request->get();
        $this->success('订单商品', \addons\shopro\model\Order::itemDetail($params));
    }


    //
    public function statusNum () {
        $this->success('订单数量', \addons\shopro\model\Order::statusNum());
    }


    // 取消订单
    public function cancel()
    {
        $params = $this->request->post();

        // 表单验证
        $this->shoproValidate($params, get_class(), 'cancel');

        $this->success('取消成功', \addons\shopro\model\Order::operCancel($params));
    }

    // 删除订单
    public function delete()
    {
        $params = $this->request->post();

        // 表单验证
        $this->shoproValidate($params, get_class(), 'delete');

        $this->success('删除成功', \addons\shopro\model\Order::operDelete($params));
    }

    // 确认收货
    public function confirm()
    {
        $params = $this->request->post();

        // 表单验证
        $this->shoproValidate($params, get_class(), 'confirm');

        $this->success('收货成功', \addons\shopro\model\Order::operConfirm($params));
    }


    // 申请售后 （已废弃）
    // public function aftersale()
    // {
    //     $params = $this->request->post();

    //     // 表单验证
    //     $this->shoproValidate($params, get_class(), 'aftersale');

    //     $this->success('申请成功', \addons\shopro\model\Order::operAftersale($params));
    // }


    // 申请退款 (已废弃)
    // public function refund()
    // {
    //     $params = $this->request->post();

    //     // 表单验证
    //     $this->shoproValidate($params, get_class(), 'refund');

    //     $this->success('申请成功', \addons\shopro\model\Order::operRefund($params));
    // }


    public function comment () 
    {
        $params = $this->request->post();

        // 表单验证
        $this->shoproValidate($params, get_class(), 'comment');

        $this->success('评价成功', \addons\shopro\model\Order::operComment($params));
    }


    public function pre()
    {
        $params = $this->request->post();

        // 表单验证
        $this->shoproValidate($params, get_class(), 'pre');

        $result = \addons\shopro\model\Order::pre($params);

        $this->success('计算成功', $result);
    }


    public function createOrder() 
    {
        $params = $this->request->post();

        // 表单验证
        $this->shoproValidate($params, get_class(), 'createOrder');

        $order = \addons\shopro\model\Order::createOrder($params);

        $this->success('订单添加成功', $order);
    }


    // 获取可用优惠券列表
    public function coupons () {
        $params = $this->request->post();

        // 表单验证
        $this->shoproValidate($params, get_class(), 'coupons');

        $coupons = \addons\shopro\model\Order::coupons($params);

        $this->success('获取成功', $coupons);
    }
    
}
