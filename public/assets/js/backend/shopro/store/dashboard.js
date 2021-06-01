requirejs.config({
	paths: {
		g2: "/assets/addons/shopro/libs/antv"
	}
})
define(['jquery', 'bootstrap', 'backend', 'table', 'form', 'g2'], function ($, undefined, Backend, Table, Form, G2) {

	var Controller = {
		index: function () {
			function debounce(handle, delay) {
                let time = null;
                return function () {
                    let self = this,
                        arg = arguments;
                    clearTimeout(time);
                    time = setTimeout(function () {
                        handle.apply(self, arg);
                    }, delay)
                }
            }
			var dashboardIndex = new Vue({
				el: "#dashboardIndex",
				data() {
					return {
						orderList: [],
						chartsData: [],
						dataList: [{
								id: 'payed',
								title: '支付订单',
								num: 0,
								checked: true,
								color: 'rgba(157, 96, 255, 1)',
								back: 'rgba(157, 96, 255, 0.1)',
								unit: '单'
							}, {
								id: 'paymoney',
								title: '支付金额',
								num: 0,
								checked: true,
								color: 'rgba(0,198,198,1)',
								back: 'rgba(0,198,198,0.1)',
								unit: '元'
							}, {
								id: 'nosend',
								title: '待备货订单',
								num: 0,
								checked: false,
								color: 'rgba(246,95,34,1)',
								back: 'rgba(246,95,34,0.1)',
								unit: '笔'
							}, {
								id: 'noget',
								title: '待配送/待核销',
								num: 0,
								checked: false,
								color: 'rgba(101,180,1,1)',
								back: 'rgba(101,180,1,0.1)',
								unit: '笔'
							},
							{
								id: 'orderpersonnum',
								title: '下单人数',
								num: 0,
								checked: false,
								color: 'rgba(231,19,184,1)',
								back: 'rgba(231,19,184,0.1)',
								unit: '人'
							}, {
								id: 'allordernum',
								title: '总订单量(含未付款)',
								num: 0,
								checked: false,
								color: 'rgba(50,108,222,1)',
								back: 'rgba(50,108,222,0.1)',
								unit: '笔'
							}, {
								id: 'aftersale',
								title: '维权订单',
								num: 0,
								checked: false,
								color: 'rgba(231,172,37,1)',
								back: 'rgba(231,172,37,0.1)',
								unit: '笔'
							}, {
								id: 'refund',
								title: '退款订单',
								num: 0,
								checked: false,
								color: 'rgba(237,41,104,1)',
								back: 'rgba(237,41,104,0.1)',
								unit: '笔'
							}
						],
						selectInputs: [],
						dropdownList: [{
							date: 'yesterday',
							name: '昨日'
						}, {
							date: 'today',
							name: '今日'
						}, {
							date: 'week',
							name: '近一周'
						}, {
							date: 'month',
							name: '近一月'
						}, {
							date: 'year',
							name: '近一年'
						}],
						dropdownName: '今日',
						dropdownDate: 'today',
						searchTime: [new Date(), new Date()],
						//支付单数/总单数
						tranPeople: 0,
						tranPeoplescale: 0,
						//支付比例					
						allOrderPayNum: 0,
						transcale: 0,
						allAjax: false,
						storeSelected: '0',
						searchWhree:'',
						storeSelectList: []
					}
				},
				mounted() {
					//请求数据
					this.getstoreOptions();
					this.changeTime();
				},
				methods: {
					getstoreOptions() {
						let that = this;
                        Fast.api.ajax({
                            url: 'shopro/store/store/all',
                            loading: false,
                            type: 'GET',
                            data: {
                                search: that.searchWhree,
                            }
                        }, function (ret, res) {
                            that.storeSelectList = res.data;
                            that.storeSelectList.unshift({
                                id:'0',
                                name:'全部门店'
                            })
                            return false;
                        })
                    },
                    sdebounceFilter: debounce(function () {
                        this.getstoreOptions()
					}, 1000),
					dataFilter(val) {
						this.searchWhree = val;
						this.sdebounceFilter()
                    },
					//折线
					charts() {
						$("#antvContainer").empty()
						const chart = new G2.Chart({
							container: 'antvContainer',
							autoFit: true,
							height: 332,
							animate: true,
						});
						chart.data(this.chartsData);
						var dataBoxNum = 0
						this.selectInputs.forEach(e => {
							if (e.checked) {
								dataBoxNum++
							}
						})
						if (dataBoxNum == 1) {
							let title
							this.selectInputs.forEach(i => {
								if (i.checked) {
									title = i.title
								}
							})
							chart.scale({
								date: {
									alias: ' ',
								},
								y2: {
									alias: title,
									min: 0,
									sync: true,
									nice: true,
								},
							});
							chart
								.line()
								.position('date*y2')
								.color(this.selectInputs[0].color).size(10).shape('smooth');
						} else if (dataBoxNum == 2) {
							chart.scale({
								date: {
									alias: ' ',
								},
								y2: {
									alias: this.selectInputs[1].title,
									sync: true,
									nice: true,
									min: 0
								},
								y1: {
									alias: this.selectInputs[0].title,
									sync: true,
									nice: true,
									min: 0
								},
							});
							chart
								.line().size(10)
								.position('date*y1')
								.color(this.selectInputs[0].color).shape('smooth');
							chart
								.line().size(10)
								.position('date*y2')
								.color(this.selectInputs[1].color).shape('smooth');

						} else {
							return false
						}

						chart.axis('y1', {
							grid: null,
							title: null, //左右不显示坐标提示{}
						});
						chart.axis('y2', {
							title: null,
						});

						chart.tooltip({
							showCrosshairs: true, //展示辅助线
							shared: true,
						});
						chart.render();
						this.allAjax = false;
					},
					//选择显示数据
					selectLine(idx) {
						this.dataList[idx].checked = !this.dataList[idx].checked
						if (this.dataList[idx].checked == true) {
							this.selectInputs.push(this.dataList[idx]);
							if (this.selectInputs.length > 2) {
								this.selectInputs[0].checked = false;
								this.selectInputs.shift();
							}
						} else {
							this.selectInputs.forEach((item, index) => {
								if (this.dataList[idx].id == item.id)
									this.selectInputs.splice(index, 1);
							})
						}
						this.countOrderData()
					},
					//选择时间段
					changeTime(index = 1) {
						this.dropdownDate = this.dropdownList[index].date;
						this.dropdownName = this.dropdownList[index].name;
						this.searchTime = this.getTimeSlot();
						this.getDataInfo();
					},
					//选择请求数据
					getDataInfo() {
						let that = this
						that.allAjax = true
						let timeSlot = this.searchTime.join(' - ')
						
						let urlData={
							datetimerange: timeSlot
						}
						if(that.storeSelected!='all'){
							urlData={
								datetimerange: timeSlot,
								store_id:that.storeSelected
							}
						}
						Fast.api.ajax({
							url: 'shopro/store/dashboard/index',
							loading: false,
							data: urlData,
							success: function (res, ret) {
								that.orderList = res.data.order_list;
								// 支付订单
								let payOrderNum = 0
								let payOrderArr = []
								//支付金额	
								let payAmountNum = 0
								let payAmountArr = []
								// 代发货
								let noSentNum = 0
								let noSentArr = []
								//下单人数
								let orderNum = 0
								let orderArr = []
								//售后维权
								let aftersaleNum = 0
								let aftersaleArr = []
								//退款订单
								let refundNum = 0
								let refundArr = []
								//所有订单
								let allOrder = 0
								let allOrderArr = []

								// 待配送/待核销
								let offSentNum=0
								let offSentArr=[]
								
								that.orderList.forEach(e => {
									// 所有订单
									allOrder++;
									allOrderArr.push({
										counter: 1,
										createtime: e.createtime * 1000,
									})
									// 下单人数
									orderNum++
									orderArr.push({
										counter: 1,
										createtime: e.createtime * 1000,
										user_id: e.user_id
									})
									if (e.status > 0) {
										// 支付订单
										payOrderNum++
										payOrderArr.push({
											counter: 1,
											createtime: e.createtime * 1000
										})
										// 支付金额
										payAmountNum += Number(e.pay_fee)
										payAmountArr.push({
											counter: e.pay_fee,
											createtime: e.createtime * 1000
										})
										e.item.forEach(i => {
											//待备货
											if (i.dispatch_status == 0 && i.refund_status <=0) {
												noSentNum++
												noSentArr.push({
													counter: 1,
													createtime: e.createtime * 1000
												})
											}
											//待配送/待核销
											if (i.dispatch_status == 1 && i.refund_status <=0) {
												offSentNum++
												offSentArr.push({
													counter: 1,
													createtime: e.createtime * 1000
												})
											}
											// 维权
											if (i.aftersale_status > 0) {
												aftersaleNum++
												aftersaleArr.push({
													counter: 1,
													createtime: e.createtime * 1000
												})
											}
											// 退款
											if (i.refund_status > 0) {
												refundNum++
												refundArr.push({
													counter: 1,
													createtime: e.createtime * 1000
												})
											}
											
										})
									}
								})
								//支付订单
								that.dataList[0].num = payOrderNum
								that.dataList[0].item = payOrderArr
								// 支付金额
								that.dataList[1].num = payAmountNum.toFixed(2)
								that.dataList[1].item = payAmountArr
								// 待备货订单
								that.dataList[2].num = noSentNum
								that.dataList[2].item = noSentArr
								// 待配送/待核销
								that.dataList[3].num = offSentNum
								that.dataList[3].item = offSentArr
								// 下单人数
								const resorderArr = new Map();
								const neworderArr = orderArr.reverse().filter(item => !resorderArr.has(item.user_id) && resorderArr.set(item.user_id, 1));
								that.dataList[4].num = neworderArr.length
								that.dataList[4].item = neworderArr
								// 总订单量
								that.dataList[5].num = allOrderArr.length
								that.dataList[5].item = allOrderArr
								// 维权订单
								that.dataList[6].num = aftersaleNum
								that.dataList[6].item = aftersaleArr
								// 退款订单
								that.dataList[7].num = refundNum
								that.dataList[7].item = refundArr
								//判断是否选中
								that.selectInputs = []
								that.dataList.forEach((item, index) => {
									if (item.checked == true) that.selectInputs.push(item);
								})
								// 请求数据
								that.countOrderData();
							}
						})
					},
					countOrderData() {
						let that = this;
						let time = (
							new Date(that.searchTime[1]).getTime() - new Date(that.searchTime[0]).getTime()
						) / 1000 + 1;
						let kld = '';
						let interval = 0;
						if (time <= 60 * 60) {
							interval = parseInt(time / 60);

							kld = 'minutes';
						} else if (time <= 60 * 60 * 24) {
							interval = parseInt(time / (60 * 60));

							kld = 'hours';
						} else if (time <= 60 * 60 * 24 * 30 * 1.5) {
							interval = parseInt(time / (60 * 60 * 24));

							kld = 'days';

						} else if (time < 60 * 60 * 24 * 30 * 24) {
							interval = parseInt(time / (60 * 60 * 24 * 30));

							kld = 'months';

						} else if (time >= 60 * 60 * 24 * 30 * 24) {
							interval = parseInt(time / (60 * 60 * 24 * 30 * 12));

							kld = 'years';

						}
						this.drawX(interval, kld);

					},
					drawX(interval, kld) {
						let that = this
						let x = [];
						let selectInputLeng = 0
						this.selectInputs.forEach(e => {
							if (e.checked) {
								selectInputLeng++
							}
						})
						if (selectInputLeng == 1) {
							for (let i = 0; i <= interval; i++) {
								if (kld == 'minutes' || kld == 'hours') {
									x.push({
										date: moment(that.searchTime[0]).add(i, kld).format("DD HH:mm"),
										timeStamp: moment(that.searchTime[0]).add(i, kld).valueOf(),
										y2: 0
									});
								} else if (kld == 'days') {
									x.push({
										date: moment(that.searchTime[0]).add(i, kld).format("YYYY-MM-DD"),
										timeStamp: moment(that.searchTime[0]).add(i, kld).valueOf(),
										y2: 0,
										y1: 0
									});
								} else if (kld == 'months') {
									x.push({
										date: moment(that.searchTime[0]).add(i, kld).format("YYYY-MM"),
										timeStamp: moment(that.searchTime[0]).add(i, kld).valueOf(),
										y2: 0,
										y1: 0
									});
								} else {
									x.push({
										date: moment(that.searchTime[0]).add(i, kld).format("YYYY"),
										timeStamp: moment(that.searchTime[0]).add(i, kld).valueOf(),
										y2: 0
									});
								}
							}
							let flag3 = false
							for (var y = 0; y < x.length; y++) {
								let y2 = 0
								let selectItem = []
								let id = 0
								this.selectInputs.forEach(element => {
									if (element.checked == true) {
										selectItem = element.item
										id = element.id
									}
								})
								if (id == 6) {
									selectItem.forEach(se => {
										if (flag3) {
											if (se.createtime > x[0].timeStamp) {
												y2 += Number(se.counter)
											}
										} else {
											if (se.createtime > x[y].timeStamp && se.createtime <= x[y + 1].timeStamp) {
												flag3 = true
												y2 += Number(se.counter)
											}
										}
									})
								} else {
									selectItem.forEach(se => {
										if (y != x.length - 1) {
											if (se.createtime > x[y].timeStamp && se.createtime <= x[y + 1].timeStamp) {
												y2 += Number(se.counter)
											}
										} else {
											if (se.createtime > x[y].timeStamp) {
												y2 += Number(se.counter)
											}
										}

									})
									if (id == 5) {
										if (y2 > 0) {
											y2 = parseFloat(y2.toFixed(2))
										}
									}
								}

								x[y].y2 = y2
							}
						}
						if (selectInputLeng == 2) {
							for (let i = 0; i <= interval; i++) {
								if (kld == 'minutes' || kld == 'hours') {
									x.push({
										date: moment(that.searchTime[0]).add(i, kld).format("DD HH:mm"),
										timeStamp: moment(that.searchTime[0]).add(i, kld).valueOf(),
										y2: 0,
										y1: 0
									});
								} else if (kld == 'days') {
									x.push({
										date: moment(that.searchTime[0]).add(i, kld).format("YYYY-MM-DD"),
										timeStamp: moment(that.searchTime[0]).add(i, kld).valueOf(),
										y2: 0,
										y1: 0
									});
								} else if (kld == 'months') {
									x.push({
										date: moment(that.searchTime[0]).add(i, kld).format("YYYY-MM"),
										timeStamp: moment(that.searchTime[0]).add(i, kld).valueOf(),
										y2: 0,
										y1: 0
									});
								} else {
									x.push({
										date: moment(that.searchTime[0]).add(i, kld).format("YYYY"),
										timeStamp: moment(that.searchTime[0]).add(i, kld).valueOf(),
										y2: 0,
										y1: 0
									});
								}
							}
							let flag1 = false
							let flag2 = false
							for (var y = 0; y < x.length; y++) {
								let y1 = 0
								let y2 = 0
								if (this.selectInputs[0].id == 6) {
									this.selectInputs[0].item.forEach(se => {
										if (flag1) {
											if (se.createtime > x[0].timeStamp) {
												y1 += Number(se.counter)
											}
										} else {
											if (se.createtime > x[y].timeStamp && se.createtime <= x[y + 1].timeStamp) {
												flag1 = true
												y1 += Number(se.counter)
											}
										}
									})

								} else {
									this.selectInputs[0].item.forEach(se => {
										if (y != x.length - 1) {
											if (se.createtime > x[y].timeStamp && se.createtime <= x[y + 1].timeStamp) {
												y1 += Number(se.counter)
											}
										} else {
											if (se.createtime > x[y].timeStamp) {
												y1 += Number(se.counter)
											}
										}
									})
									if (this.selectInputs[0].id == 5) {
										if (y1 > 0) {
											y1 = parseFloat(y1.toFixed(2))
										}
									}
								}
								if (this.selectInputs[1].id == 6) {
									this.selectInputs[1].item.forEach(se => {
										if (flag2) {
											if (se.createtime > x[0].timeStamp) {
												y2 += Number(se.counter)
											}
										} else {
											if (se.createtime > x[y].timeStamp && se.createtime <= x[y + 1].timeStamp) {
												flag2 = true
												y2 += Number(se.counter)
											}
										}
									})
								} else {
									this.selectInputs[1].item.forEach(se => {
										if (y != x.length - 1) {
											if (se.createtime > x[y].timeStamp && se.createtime <= x[y + 1].timeStamp) {
												y2 += Number(se.counter)
											}
										} else {
											if (se.createtime > x[y].timeStamp) {
												y2 += Number(se.counter)
											}
										}
									})
									if (this.selectInputs[1].id == 5) {
										if (y2 > 0) {
											y2 = parseFloat(y2.toFixed(2))
										}

									}
								}
								x[y].y1 = y1
								x[y].y2 = y2
							}
						}
						that.chartsData = x
						that.allAjax = false
						that.charts()
					},
					//获取时间
					getTimeSlot() {
						let beginTime = '';
						let endTime = moment().format('YYYY-MM-DD');
						switch (this.dropdownDate) {
							case 'yesterday':
								endTime = moment().subtract(1, 'days').format('YYYY-MM-DD')
								beginTime = endTime
								break;
							case 'today':
								beginTime = endTime;
								break;
							case 'week':
								beginTime = moment().subtract(1, 'weeks').format('YYYY-MM-DD')
								break;
							case 'month':
								beginTime = moment().subtract(1, 'months').format('YYYY-MM-DD')
								break;
							case 'year':
								beginTime = moment().subtract(1, 'years').format('YYYY-MM-DD')
								break;
						}
						let timeSlot = [beginTime + ' 00:00:00', endTime + ' 23:59:59'];
						return timeSlot;
					},
					goDetail(status) {
						let that = this;
						let times = encodeURI(that.searchTime.join(" - "))
						parent.Fast.api.open(`shopro/order/order/index?status=${status}&datetimerange=${times}&store_id=${that.storeSelected}`, "查看详情", {
							callback: function (data) {}
						});
						return false;
					},
					scaleFunc(a, b) {
						return (a <= 0 ? 0 : a / b).toFixed(2) - 0
					}
				},
			})
		},
	};
	return Controller;
});