define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 检测是否安装 redis
            this.checkRedis();
            var activityIndex = new Vue({
                el: "#activity-index",
                data() {
                    return {
                        tipCloseFlag: true,
                        activityType: 'all',
                        activityName: '全部',
                        activityOptions: [{
                            value: 'all',
                            label: '全部'
                        }, {
                            value: 'seckill',
                            label: '秒杀活动'
                        }, {
                            value: 'groupon',
                            label: '拼团活动'
                        }],
                        statusOptins: {
                            '全部': 'all',
                            '未开始': 'nostart',
                            '进行中': 'ing',
                            '已结束': 'ended'
                        },
                        statusName: '全部',
                        statusType: 'all',
                        activityData: [],
                        

                        currentPage: 1,//分页
                        totalPage: 0,
                        offset: 0,
                        limit: 10,
                        editId: ''
                    }
                },
                mounted() {
                    this.getActivityData()
                },
                methods: {
                    tipClose() {
                        this.tipCloseFlag = false
                    },
                    selectChange(val) {
                        this.activityType = val;
                        this.activityName = this.filterActivityType(val);
                        this.offset=0;
                        this.getActivityData();
                    },
                    radioChange(val) {
                        this.statusType = this.statusOptins[val];
                        this.offset=0;
                        this.getActivityData()
                    },
                    getActivityData() {
                        var that = this;
                        that.objClear(that.activityForm)
                        Fast.api.ajax({
                            url: 'shopro/activity/activity/index',
                            loading: true,
                            type: 'GET',
                            data: {
                                sort: 'id',
                                order: 'desc',
                                offset: that.offset,
                                limit: that.limit,
                                type: that.activityType,
                                status: that.statusType,
                            }
                        }, function (ret, res) {
                            that.activityData = res.data.rows;
                            that.totalPage=res.data.total
                            return false;
                        })
                    },
                    handleClick(row, handleType) {
                        let that = this;
                        switch (handleType) {
                            case 'add':
                                Fast.api.open(`shopro/activity/activity/add`,'新建活动',{
                                    callback(){
                                        that.getActivityData()
                                    }
                                })
                                break;
                            case 'edit':
                                Fast.api.open(`shopro/activity/activity/edit?ids=${row.id}`,'编辑活动',{
                                    callback(){
                                        that.getActivityData()
                                    }
                                })
                                break;
                            case 'view':
                                Fast.api.open(`shopro/activity/activity/edit?ids=${row.id}&type=view`,'查看活动',{
                                    callback(){
                                        that.getActivityData()
                                    }
                                })
                                break;
                            case 'delete':
                                Fast.api.ajax({
                                    url: `shopro/activity/activity/del/ids/${row.id}`,
                                    loading: true,
                                    type: 'POST',
                                    data: {}
                                }, function (ret, res) {
                                    that.getActivityData()
                                })
                                break;
                        }
                    },
                    objClear(obj) {
                        for (key in obj) {
                            if (key == 'rules') {
                                for (j in obj[key]) {
                                    obj[key][j] = ''
                                }
                            }else if (key == 'dateTime' || key == 'goods_list') {
                                obj[key] = []
                            }else if (key == 'is_alone' || key == 'is_fictitious' || key == 'team_card') {
                                obj[key] = 0
                            }else if (key == 'type') {
                                obj[key] = 'seckill'
                            }else {
                                obj[key] = ''
                            }
                        }
                    },
                    filterActivityType(type) {
                        switch (type) {
                            case 'seckill':
                                return '秒杀活动';
                                break;
                            case 'groupon':
                                return '拼团活动';
                                break;
                            case 'all':
                                return '全部';
                                break;
                        }
                    },
                    handleSizeChange(val) {
                        this.offset = 0
                        this.limit = val
                        this.getActivityData()
                    },
                    handleCurrentChange(val) {
                        this.offset = (val - 1) * this.limit
                        this.getActivityData()
                    },
                    goRecycle(){
                        parent.Fast.api.open("shopro/activity/activity/recyclebin", "查看历史活动");
                    }
                },
            })
        },
        recyclebin: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    'dragsort_url': ''
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: 'shopro/activity/activity/recyclebin' + location.search,
                pk: 'id',
                sortName: 'id',
                commonSearch:false,
                columns: [
                    [
                        { checkbox: true },
                        { field: 'id', title: __('Id') },
                        { field: 'title', title: __('Title'), align: 'left' },
                        {
                            field: 'deletetime',
                            title: __('Deletetime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.detailInit('add')
        },
        sku: function () {
            var vueSku = new Vue({
                el: "#skuPrce",
                data() {
                    return {
                        skuList: Config.skuList,
                        skuPrice: Config.skuPrice,
                        actSkuPrice: Config.actSkuPrice,
                        is_edit: false
                    }
                },
                mounted() {
                    let seleSkuPrice = decodeURI(window.location.search.substring(1).split('&')[2].split('=')[1])
                    this.is_edit = decodeURI(window.location.search.substring(1).split('&')[4].split('=')[1]) == 'view' ? true : false
                    if (seleSkuPrice) {
                        JSON.parse(seleSkuPrice).forEach(i => {
                            this.actSkuPrice.forEach(e => {
                                if (i.sku_price_id == e.sku_price_id) {
                                    e.price = i.price
                                    e.status = i.status
                                    e.stock = i.stock
                                }
                            })
                        })
                    }

                },
                methods: {
                    goJoin(i) {
                        let status = this.actSkuPrice[i].status === 'up' ? 'down' : 'up';
                        this.$set(this.actSkuPrice[i], 'status', status)
                    },
                },

            })
            $(document).on("click", "#activitySub", function () {
                Layer.confirm('确认提交吗', {
                    btn: ['确认', '取消']
                }, function () {
                    let isSubmit = true
                    isSubmit = !(vueSku.$data.actSkuPrice.every(function (item, index, array) {
                        return item.status == 'down';
                    }))
                    vueSku.$data.actSkuPrice.forEach(i => {
                        if (i.status == 'up' && !i.stock) {
                            isSubmit = false
                        }
                        if (i.status == 'up' && !i.price) {
                            isSubmit = false
                        }
                    })
                    if (isSubmit) {
                        Fast.api.close(JSON.stringify(vueSku.$data.actSkuPrice));
                        return true;
                    } else {
                        layer.msg('请把信息填写完整');
                    }
                    return true;
                }, function () {
                    Layer.closeAll();
                    return false;
                });
            })
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.detailInit('edit')
        },
        detailInit:function (type) {
            var activityDetail = new Vue({
                el: "#activityDetail",
                data() {
                    return {
                        optType:new URLSearchParams(location.search).get('type')?new URLSearchParams(location.search).get('type'):type,
                        activityForm: {
                            title: '',
                            type: 'seckill',
                            dateTime: [],
                            starttime: '',
                            endtime: '',
                            // description: '',
                            richtext_id: '',
                            richtext_title:'',
                            goods_list: [],
                            goods_ids: '',
                            rules: {
                                limit_buy: '',
                                order_auto_close: '',
                                activity_auto_close: '',
                                team_num: '',
                                is_alone: 0,
                                is_fictitious: 0,
                                fictitious_num: '',
                                valid_time: '',
                                team_card: 0
                            },
                            limit_buy: '',
                            order_auto_close: '',
                            activity_auto_close: '',
                            team_num: '',
                            is_alone: 0,
                            is_fictitious: 0,
                            fictitious_num: '',
                            valid_time: '',
                            team_card: 0
                        },
                        rules: {
                            title: [{ required: true, message: '请输入活动名称', trigger: 'blur' }],
                            type: [{ required: true, message: '请选择活动类型', trigger: 'blur' }],
                            dateTime: [{ required: true, message: '请选择活动时间', trigger: 'blur' }],
                            limit_buy: [{required: true,  message: '请输入限购件数', trigger: 'blur' }],
                            team_num: [{required: true,  message: '请输入每人限购件数', trigger: 'blur' }],
                            goods_list: [{ required: true, message: '请输入选择商品', trigger: 'blur' }],
                        },
                        level1Delete: {
                            limit_buy: '',
                            order_auto_close: '',
                            activity_auto_close: '',
                            team_num: '',
                            is_alone: 0,
                            is_fictitious: 0,
                            fictitious_num: '',
                            valid_time: '',
                            dateTime: '',
                            team_card: 0
                        },
                        seckillDelete: {
                            team_num: '',
                            is_alone: 0,
                            is_fictitious: 0,
                            fictitious_num: '',
                            valid_time: '',
                            team_card: 0
                        },
                        disabledFlag: false,
                        formSubFlag: false,
                    }
                },
                mounted() {
                    if(this.optType!='add'){
                        this.reqDetail();
                        if(this.optType!='edit'){
                            this.disabledFlag=true
                        }
                    }
                },
                methods: {
                    changeDateTime(e) {
                        let _this = this
                        _this.$nextTick(() => {
                            _this.$set(_this.activityForm, "dateTime", [e[0], e[1]]);
                            _this.$forceUpdate();
                        });
                    },
                    chooseMethod() {
                        let that = this;
                        parent.Fast.api.open("shopro/richtext/select", "选择活动说明", {
                            callback: function (data) {
                                that.activityForm.richtext_id = data.data.id;
                                that.activityForm.richtext_title = data.data.title
                            }
                        });
                    },
                    chooseGoods(type) {
                        var that = this;
                        // var type = $(this).data("type") ? $(this).data("type") : null
                        var multiple = true;
                        that.activityForm.goods_list = that.activityForm.goods_list ? that.activityForm.goods_list : [];
                        let idsArr=[]
                        if(that.activityForm.goods_list.length>0){
                            that.activityForm.goods_list.forEach(i=>{
                                idsArr.push(i.id)
                            })
                        }
                        let ids=idsArr.join(',')
                        parent.Fast.api.open("shopro/goods/goods/select?multiple=" + multiple + "&type=" + type+"&ids="+ids, "选择商品", {
                            callback: function (data) {
                                let goodsList=[]
                                if (Array.isArray(data.data)) {
                                    data.data.forEach(e => {
                                        let obj = {
                                            actSkuPrice: "",
                                            dispatch_type_text: e.dispatch_type_text,
                                            id: e.id,
                                            image: e.image,
                                            opt: 0,
                                            status_text: e.status_text,
                                            title: e.title,
                                            type_text: e.type_text,
                                        }
                                        goodsList.push(obj)
                                    })
                                } else {
                                    let obj = {
                                        actSkuPrice: "",
                                        dispatch_type_text: data.data.dispatch_type_text,
                                        id: data.data.id,
                                        image: data.data.image,
                                        opt: 0,
                                        status_text: data.data.status_text,
                                        title: data.data.title,
                                        type_text: data.data.type_text,
                                    }
                                    goodsList.push(obj)
                                }
                            that.activityForm.goods_list = goodsList;
                            }
                        });
                        return false;
                    },
                    chooseActivityPrice(id, idx, actSkuPrice) {
                        var that = this;
                        var multiple = $(this).data("multiple") ? $(this).data("multiple") : false;
                        let type = that.optType == 'view' ? that.optType : ''
                        parent.Fast.api.open("shopro/activity/activity/sku?id=" + id + "&multiple=" + multiple + "&actSkuPrice=" + actSkuPrice + "&activity_id=" + that.editId + "&type=" + type, "设置活动商品", {
                            callback: function (data) {
                                that.$set(that.activityForm.goods_list[idx], "opt", 1)
                                that.$set(that.activityForm.goods_list[idx], "actSkuPrice", data)
                            }
                        });
                        return false;
                    },
                    selectDelete(i) {
                        this.activityForm.goods_list.splice(i, 1)
                    },
                    submitForm(activityForm) {
                        let that = this;
                        that.disabledFlag = false
                        that.$refs[activityForm].validate((valid) => {
                            if (valid) {
                                let subForm = JSON.parse(JSON.stringify(that.activityForm))
                                let rules_bak=that.activityForm.rules
                                let ids = []
                                if (subForm.goods_list.length == 0) {
                                    alert('请选择参加活动的商品')
                                    return false
                                }
                                subForm.goods_list.forEach(i => {
                                    ids.push(i.id)
                                })
                                subForm.goods_ids = ids.join(',')
                                // subForm.description = that.textareaToStr(subForm.description);
                                subForm.dateTime.forEach(i => {
                                    moment(i).valueOf()
                                });
                                subForm.starttime = subForm.dateTime[0];
                                subForm.endtime = subForm.dateTime[1];

                                delete subForm.dateTime
                                for (key in rules_bak) {
                                    subForm.rules[key] = subForm[key]
                                }
                                //删除多余字段
                                for (key in that.level1Delete) {
                                    delete subForm[key]
                                }
                                if (subForm.type == "seckill") {
                                    for (key in that.seckillDelete) {
                                        delete subForm.rules[key]
                                    }
                                }
                                switch (that.optType) {
                                    case 'add':
                                        let addDate = JSON.parse(JSON.stringify(subForm))
                                        Fast.api.ajax({
                                            url: 'shopro/activity/activity/add',
                                            loading: true,
                                            type: 'POST',
                                            data: addDate
                                        }, function (ret, res) {
                                            if(res.code==1){
                                                Fast.api.close()
                                            }
                                        })
                                        break;
                                    case 'edit':
                                        let editData = JSON.parse(JSON.stringify(subForm))
                                        Fast.api.ajax({
                                            url: `shopro/activity/activity/edit/ids/${Config.activity.id}`,
                                            loading: true,
                                            type: 'POST',
                                            data: editData
                                        }, function (ret, res) {
                                            if(res.code==1){
                                                Fast.api.close()
                                            }
                                        })
                                        break;
                                }
                            } else {
                                console.log('error submit!!');
                                return false;
                            }
                        });
                    },
                    objClear(obj) {
                        for (key in obj) {
                            if (key == 'rules') {
                                for (j in obj[key]) {
                                    obj[key][j] = ''
                                }
                            }else if (key == 'dateTime' || key == 'goods_list') {
                                obj[key] = []
                            }else if (key == 'is_alone' || key == 'is_fictitious' || key == 'team_card') {
                                obj[key] = 0
                            }else if (key == 'type') {
                                obj[key] = 'seckill'
                            }else {
                                obj[key] = ''
                            }
                        }
                    },
                    reqDetail() {
                        let that = this;
                        Fast.api.ajax({
                            url: `shopro/activity/activity/detail`,
                            loading: true,
                            type: 'GET',
                            data: {
                                ids: Config.activity.id
                            }
                        }, function (ret, res) {
                            let arr = res.data;
                            for (key in that.activityForm) {
                                if (arr[key]) {
                                    if (key == 'rules') {
                                        for (kk in that.activityForm[key]) {
                                            that.activityForm[key][kk] = arr.rule_arr[kk]
                                        }
                                    } else {
                                        that.activityForm[key] = arr[key]
                                    }
                                } else {
                                    that.activityForm[key] = arr.rule_arr[key] ? arr.rule_arr[key] : ''
                                }
                            };
                            that.activityForm.dateTime = [];
                            that.activityForm.dateTime.push(moment(that.activityForm.starttime * 1000).format("YYYY-MM-DD HH:mm:ss"));
                            that.activityForm.dateTime.push(moment(that.activityForm.endtime * 1000).format("YYYY-MM-DD HH:mm:ss"));
                            return false;
                        })
                    },
                },
                watch: {
                    activityForm: {
                        handler: function (newVal) {
                            if (newVal.type == 'seckill') {
                                if (newVal.title != '' && newVal.dateTime.length !=0 && newVal.limit_buy != "" && newVal.goods_list.length !=0 && newVal.type != '') {
                                    this.formSubFlag = true
                                } else {
                                    this.formSubFlag = false
                                }
                            } else {
                                if (newVal.title != '' && newVal.dateTime.length !=0 && newVal.limit_buy != "" && newVal.team_num != "" && newVal.goods_list.length !=0 && newVal.type != '') {
                                    this.formSubFlag = true
                                } else {
                                    this.formSubFlag = false
                                }
                            }
                        },
                        deep: true
                    }
                }
            })
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        },
        select: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'shopro/activity/activity/index?page_type=select&type=' + Backend.api.query('type'),
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        { checkbox: true },
                        { field: 'id', title: __('Id') },
                        { field: 'title', title: __('Title') },
                        { field: 'goods_ids', title: __('Goods_ids') },
                        { field: 'type', title: __('Type') },
                        // { field: 'description', title: __('Description') },
                        { field: 'starttime', title: __('Starttime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime },
                        { field: 'endtime', title: __('Endtime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime },
                        { field: 'createtime', title: __('Createtime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime },
                        { field: 'updatetime', title: __('Updatetime'), operate: 'RANGE', addclass: 'datetimerange', formatter: Table.api.formatter.datetime },
                        {
                            field: 'operate', title: __('Operate'), events: {
                                'click .btn-chooseone': function (e, value, row, index) {
                                    var multiple = Backend.api.query('multiple');
                                    multiple = multiple == 'true' ? true : false;
                                    Fast.api.close({ data: row, multiple: multiple });
                                },
                            }, formatter: function () {
                                return '<a href="javascript:;" class="btn btn-danger btn-chooseone btn-xs"><i class="fa fa-check"></i> ' + __('Choose') + '</a>';
                            }
                        }
                    ]
                ]
            });

            // 选中多个
            $(document).on("click", ".btn-choose-multi", function () {
                var couponsArr = new Array();
                $.each(table.bootstrapTable("getAllSelections"), function (i, j) {
                    couponsArr.push(j.id);
                });
                var multiple = Backend.api.query('multiple');
                multiple = multiple == 'true' ? true : false;
                let row = {}
                row.ids = couponsArr.join(",")
                Fast.api.close({ data: row, multiple: multiple });
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
            require(['upload'], function (Upload) {
                Upload.api.plupload($("#toolbar .plupload"), function () {
                    $(".btn-refresh").trigger("click");
                });
            });

        },
        checkRedis: function () {
            if (!Config.hasRedis) {
                Layer.confirm('检测到系统未配置 Redis，添加的活动将不能得到有效控制，确定要继续吗？', {
                    btn: ['确认', '取消']
                }, function () {
                    Layer.closeAll();
                    return true;
                }, function () {
                    Layer.closeAll();
                    if (window.parent) {
                        window.parent.Layer.closeAll();
                    }
                    return false;
                });
            }
        }
    };
    return Controller;
});