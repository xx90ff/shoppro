<?php

namespace app\admin\controller\shopro\store;

use app\common\controller\Backend;
use think\Db;
use think\exception\PDOException;
use think\exception\ValidateException;
use Exception;


/**
 * 门店统计
 *
 * @icon fa fa-circle-o
 */
class Dashboard extends Backend
{
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();

        $this->model = new \app\admin\model\shopro\order\Order;
    }

    /**
     * 查看
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $params = $this->request->request();
            $datetimerange = $params['datetimerange'] ? explode(' - ', $params['datetimerange']) : [];
            $startTime = strtotime($datetimerange[0]);
            $endTime = strtotime($datetimerange[1]);
            $where = [
                'createtime' => ['between', [$startTime, $endTime]]
            ];
            $store_id = isset($params['store_id']) ? $params['store_id'] : 0;

            $list = $this->buildSearch()
                ->with(['item' => function ($query) use ($store_id) {
                    if ($store_id) {
                        $query->where('store_id', $store_id);
                    } else {
                        $query->where('store_id', '<>', 0);
                    }
                }])
                ->where($where)
                ->order('id')
                ->select();

            $data['order_list'] = $list;

            $this->success('数据中心', null, $data);
        }

        return $this->view->fetch();
    }



    public function buildSearch() 
    {
        $params = $this->request->request();
        $store_id = isset($params['store_id']) ? $params['store_id'] : 0;

        $name = $this->model->getQuery()->getTable();
        $tableName = $name . '.';

        $orders = $this->model->withTrashed();
        
        $orders = $orders->whereExists(function ($query) use ($store_id, $tableName) {
            $itemTableName = (new \app\admin\model\shopro\order\OrderItem())->getQuery()->getTable();

            $query = $query->table($itemTableName)->where($itemTableName . '.order_id=' . $tableName . 'id');

            if ($store_id) {
                $query = $query->where('store_id', $store_id);
            } else {
                $query = $query->where('store_id', '<>', 0);
            }

            return $query;
        }); 

        return $orders;
    }
}
