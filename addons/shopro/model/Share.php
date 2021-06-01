<?php

namespace addons\shopro\model;

use think\Model;
use addons\shopro\exception\Exception;

/**
 * 购物车模型
 */
class Share extends Model
{

    // 表名,不含前缀
    protected $name = 'shopro_share';
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = 'int';
    // 定义时间戳字段名
    protected $createTime = 'createtime';
    protected $updateTime = false;
    protected $deleteTime = false;

    protected $hidden = [];

    // 追加属性
    protected $append = [
    ];


    public static function add($params)
    {
        $user = User::info();
        // 不能分享给自己
        if($user->id == $params['share_id']) {
            return false;
        }

        // 新用户不能分享给老用户 按需打开
        // if($user->id > $params['share_id']) {
        //     return false;
        // }

        $shareUser = User::get($params['share_id']);
        if(empty($shareUser)) {
            return false;
        }
        if (!empty($params['url'])) {
            $type = explode('-', $params['url']);
        }else{
            $type = ['index', 0];
        }

        // 一小时之内不添加同样的记录
        $again = self::where([
            'user_id' => $user->id,
            'share_id' => $params['share_id'],
            'type' => $type[0],
            'type_id' => $type[1],
            'platform' => $params['platform'],
        ])->where('createtime', '>', (time() - 3600))->count();

        if ($again) {
            return false;
        }

        $share = self::create([
            'user_id' => $user->id,
            'share_id' => $params['share_id'],
            'type' => $type[0],
            'type_id' => $type[1],
            'platform' => $params['platform'],
            'createtime' => time(),
        ]);
        return $share;
    }


    /**
     * 分享记录
     */
    public static function getList($params) {
        $user = User::info();
        extract($params);
        $type = $type ?? 'all';

        $shares = self::with(['user' => function($query) {
            $query->withField('id,nickname,avatar');
        }])->where('share_id', $user->id);

        if ($type != 'all' && in_array($type, ['index', 'goods', 'groupon'])) {
            $shares = $shares->{$type}();
        }

        $shares = $shares->order('id', 'desc')->paginate($per_page ?? 10);
        $shares = $shares->toArray();

        // 取出来商品和拼团信息，专门进行查询
        $sharesData = $shares['data'];
        $goodsIds = [];
        $grouponIds = [];
        foreach ($sharesData as $key => $data) {
            if ($data['type'] == 'goods') {
                $goodsIds[] = $data['type_id'];
            } else if ($data['type'] == 'groupon') {
                $grouponIds[] = $data['type_id'];
            }
        }

        // 查询关联的商品
        $goodsFields = 'id,title,subtitle,image,price,dispatch_type';
        if ($goodsIds) {
            $goods = Goods::where('id', 'in', $goodsIds)->field($goodsFields)->select();
            $goods = array_column(collection($goods)->toArray(), null, 'id');
        }
        // 查询关联的拼团
        if ($grouponIds) {
            $groupons = ActivityGroupon::where('id', 'in', $grouponIds)->with(['goods' => function ($query) use ($goodsFields) {
                $query->withField($goodsFields);
            }])->select();
            $groupons = array_column(collection($groupons)->toArray(), null, 'id');
        }

        // 组合数据
        foreach ($sharesData as $key => &$share) {
            if ($share['type'] == 'goods') {
                $share['type_data'] = $goods[$share['type_id']] ?? null;
            } else if ($share['type'] == 'groupon') {
                $share['type_data'] = $groupons[$share['type_id']] ?? null;
            } else {
                $share['type_data'] = null;
            }

            // 提示信息
            $share['msg'] = '通过您分享的' . (self::getPlatformMsg($share['platform'])) . '访问了' . self::getLookMsg($share, $user);
        }

        $shares['data'] = $sharesData;
        return $shares;
    }


    /**
     * 拼接平台信息
     */
    private static function getPlatformMsg($platform) {
        if (in_array($platform, ['H5', 'App'])) {
            $msg = $platform . '链接';
        } else if ($platform == 'wxOfficialAccount') {
            $msg = '公众号链接';
        } else if ($platform == 'wxMiniProgram') {
            $msg = '小程序卡片';
        } else {
            $msg = '链接';
        }

        return $msg;
    }


    /**
     * 拼接查看内容
     */
    private static function getLookMsg($data, $user) {
        $msg = '商城';
        if ($data['type'] == 'groupon') {
            if ($data['type_data'] && $data['type_data']['user_id'] == $user->id) {
                $msg = '您发起的拼团';
            } else {
                $msg = '您参与的拼团';
            }
        } else if ($data['type'] == 'goods') {
            $msg = $data['type_data'] ? '商品“' . $data['type_data']['title'] . "”" : '商城';
        }
        return $msg;
    }


    public function scopeIndex($query) {
        return $query->where('type', 'index');
    }

    public function scopeGoods($query) {
        return $query->where('type', 'goods');
    }

    public function scopeGroupon($query) {
        return $query->where('type', 'groupon');
    }


    public function user() {
        return $this->belongsTo(\addons\shopro\model\User::class, 'user_id')->field('id,nickname,avatar');
    }

    /**
     * 查最近的分销商分享记录
     * 
     * @return object
     */
    public static function checkLatestShareLogByAgent($userId)
    {
        return self::where([
            'user_id' => $userId,
        ])->whereExists(function ($query) {
            $agent_table_name = (new \addons\shopro\model\commission\Agent())->getQuery()->getTable();
            return $query->table($agent_table_name)->where('share_id=' . $agent_table_name . '.user_id')->where('status', 'in', ['normal', 'freeze']);
        })->order('id desc')->find();
    }
}
