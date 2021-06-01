<?php

namespace app\admin\controller\shopro\commission;

use app\common\controller\Backend;
use think\Db;
use think\exception\PDOException;
use think\exception\ValidateException;
use Exception;


/**
 * 分销配置
 *
 * @icon fa fa-circle-o
 */
class Config extends Backend
{

    /**
     * Express模型对象
     * @var \app\admin\model\shopro\commission\Config
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = new \app\admin\model\shopro\commission\Config;
    }


    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
   /**
     * 查看
     */
    public function index()
    {
        if($this->request->isAjax()) {
            $data = [];
            if (checkEnv('commission', false)) {
                $data = $this->model->column('name, value');
            }
            
            $this->success('分销设置', null, $data);
        }

        $this->assignconfig('is_upgrade', checkEnv('commission', false) ? false : true);
        
        return $this->view->fetch();
    }

    public function save()
    {
        if ($this->request->isPost()) {
            checkEnv('commission');

            $params = $this->request->post();
            foreach($params as $k => $p) {
                Db::name('shopro_commission_config')->where('name', $k)->update([
                    'value' => $p
                ]);
            }
            $this->success('更新成功');

        }
    }

}
