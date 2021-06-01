<?php

namespace addons\shopro\controller\commission;

use addons\shopro\model\commission\Agent as AgentModel;
use addons\shopro\model\commission\Level;
use addons\shopro\model\commission\Reward;
use addons\shopro\model\User;
use addons\shopro\library\commission\Agent as AgentLibrary;
use addons\shopro\library\commission\Config as ConfigLibrary;

class Agent extends Commission
{

    protected $noNeedLogin = [];
    protected $noNeedRight = ['*'];

    /**
     * 分销商详情
     */
    public function info()
    {
        $user = $this->auth->getUserinfo();
        $agent = new AgentLibrary($user['id']);
        $agentInfo = $agent->getAgentInfo();
        // 是否显示申请信息入口
        $agentInfo['agent_form'] = $this->config->getAgentForm()  == 0 ? false : true;
        $agentInfo['upgrade_display'] = $this->config->isUpgradeDisplay();
        // 未满足成为分销商条件
        // if($agentInfo['status'] == null) {
            $agentInfo['become_agent'] = $this->config->getBecomeAgentEvent();
        // }
        if ($agent->isAgentAvaliable()) {
            $agentInfo['data']['agent_level'] = $agent->getAgentLevelInfo();
            // 待入账佣金
            $agentInfo['data']['delay_money'] = $agent->getAgentDelayMoney();
        }

        $this->success('获取成功', $agentInfo);
    }



    /**
     * 我的团队
     *
     * @return void
     */
    public function team()
    {
        $params = $this->request->get();
        extract($params);
        $this->auth->setAllowFields(['id', 'username', 'nickname', 'mobile', 'avatar', 'score', 'money', 'parent_user_id']);
        $user = $this->auth->getUserinfo();

        if (isset($id)) {
            // 查询 id 是否是当前用户的下级
            $childUser = User::where('parent_user_id', $user['id'])->where('id', $id)->count();
            if (!$childUser) {
                $this->error('用户不存在');
            }
        } else {
            $id = $user['id'];
        }

        $fields = 'id,nickname,avatar,parent_user_id,child_user_count_1,createtime';
        $teams = User::where('parent_user_id', $id)->with(['agent' => function ($query) {
                $query->avaliable()->with(['level' => function ($query) {
                    $query->field('level,name,image');
                }]);
            }])
            ->field($fields)
            ->order('createtime', 'asc')
            ->paginate($per_page ?? 10);

        $parentUser = null;
        if ($user['parent_user_id']) {
            $parentUser = User::where('id', $user['parent_user_id'])->field('id,nickname,avatar')->find();
        }

        $this->success('我的团队', [
            'teams' => $teams,
            'parent_user' => $parentUser
        ]);
    }



    /**
     * 分销商申请表单
     */
    public function agentForm()
    {
        $applyInfo = [];
        $applyStatus = false;  // 提交状态
        $config = new ConfigLibrary();
        $agentForm = $config->getAgentForm();
        if (!$agentForm) {
            $this->error('系统未开启分销商自助申请');
        }
        $backgroundImage = cdnurl($agentForm['background_image'], true);
        // 系统开启完善资料
        $user = $this->auth->getUserinfo();
        $agent = new AgentLibrary($user['id']);
        $agentInfo = $agent->getAgentInfo();
        switch ($agentInfo['status']) {
            case AgentLibrary::AGENT_STATUS_NEEDINFO:  // 分销商资料未完善 需提交 表单为系统默认表单
                $applyStatus = true;
                break;
            case AgentLibrary::AGENT_STATUS_NORMAL:   // 分销商状态正常 可选状态
                $infoStatus = $agent->agent->info_status;
                if ($infoStatus === AgentLibrary::INFO_STATUS_NONE) {   // 补全信息
                    $applyStatus = true;
                } else if ($infoStatus === AgentLibrary::INFO_STATUS_COMPLETED) {   // 查看我的信息
                    $userApplyInfo = json_decode($agentInfo['data']['apply_info'], true);
                    $applyStatus = false;
                } else if($infoStatus === AgentLibrary::INFO_STATUS_REJECT){    // 修改信息
                    $userApplyInfo = json_decode($agentInfo['data']['apply_info'], true);
                    $applyStatus = true;
                }
                break;
                //  用户资料被驳回 需要做信息合并 重新提交
            case AgentLibrary::AGENT_STATUS_REJECT:
                $userApplyInfo = json_decode($agentInfo['data']['apply_info'], true);
                $applyStatus = true;
                break;
        }

        if (!$applyStatus) {
            $this->error('您暂时不能申请');
        }
        // 合并已有表单信息
        if (isset($userApplyInfo)) {
            $userApplyInfoName = array_column($userApplyInfo, 'name');
            foreach ($agentForm['content'] as &$form) {
                if (in_array($form['name'], $userApplyInfoName) && $userApplyInfo[array_search($form['name'], $userApplyInfoName)]['type'] === $form['type']) {
                    $form = $userApplyInfo[array_search($form['name'], $userApplyInfoName)];
                }
                if ($form['type'] === 'image' && isset($form['value'])) {
                    $form['value'] = cdnurl($form['value'], true);
                }
            }
        }
        $applyInfo = $agentForm['content'];

        $data = [
            'apply_protocol' =>  $config->getApplyProtocol(),
            'apply_status' => $applyStatus,
            'apply_info' => $applyInfo,
            'background_image' => $backgroundImage
        ];

        $this->success('申请表单', $data);
    }

    /**
     * 提交表单申请
     * 
     */
    public function applyForm()
    {
        $user = $this->auth->getUserinfo();
        $config = new ConfigLibrary();
        $agentForm = $config->getAgentForm();
        if (!$agentForm) {
            $this->error('系统未开启分销商自助申请');
        }
        $agent = new AgentLibrary($user['id']);

        // 添加分销商
        \think\Db::transaction(function () use ($agent, $agentForm) {
            $agentInfo = $agent->getAgentInfo();

            switch ($agentInfo['status']) {
                case AgentLibrary::AGENT_STATUS_NEEDINFO:  // 分销商资料未完善 需提交 表单为系统默认表单
                    $applyStatus = true;
                    break;
                case AgentLibrary::AGENT_STATUS_NORMAL:   // 分销商状态正常 可选状态
                    $infoStatus = $agent->agent->info_status;
                    if ($infoStatus === AgentLibrary::INFO_STATUS_NONE) {   // 补全信息
                        $applyStatus = true;
                    } else if($infoStatus === AgentLibrary::INFO_STATUS_REJECT){    // 修改信息
                        $applyStatus = true;
                    }
                    break;
                    //  用户资料被驳回 需要做信息合并 重新提交
                case AgentLibrary::AGENT_STATUS_REJECT:
                    $applyStatus = true;
                    break;
            }
            if (!$applyStatus) {
                $this->error('您暂时不能申请');
            }
            $post = $this->request->post();
            $userApplyInfo = $post['data'];
            $userApplyInfoName = array_column($userApplyInfo, 'name');
            foreach ($agentForm['content'] as &$form) {
                if (in_array($form['name'], $userApplyInfoName) && $userApplyInfo[array_search($form['name'], $userApplyInfoName)]['type'] === $form['type']) {
                    $form = $userApplyInfo[array_search($form['name'], $userApplyInfoName)];
                } else {
                    $this->error('请正确填写您的信息');
                }
            }
        
            $applyInfo = $agentForm['content'];

            if ($agentInfo['status'] == AgentLibrary::AGENT_STATUS_NEEDINFO) {
                $agent->becomeAgent(json_encode($applyInfo, JSON_UNESCAPED_UNICODE));
            }
            if ($agentInfo['status'] == AgentLibrary::AGENT_STATUS_REJECT) {
                $agent->agent->apply_info = json_encode($applyInfo, JSON_UNESCAPED_UNICODE);
            }
            $agent->agent->apply_num += 1;
            $agent->agent->info_status  = 1;
            $agent->agent->save();
        });
        
        $this->success('提交成功', null);
    }

    public function ranking()
    {
        $params = $this->request->get();
        $agents = AgentModel::getRanking($params);

        $this->success('分销商排行', $agents);
    }

    public function level()
    {
        if($this->config->isUpgradeDisplay()) {
            $data['level'] = Level::order('level asc')->select();
            $data['commission_level'] = $this->config->getCommissionLevel();
            $this->success('升级进度', $data);
        }else {
            $this->error('未开启升级显示');
        }
    }
}
