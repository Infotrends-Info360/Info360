<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>「儀表板」頁面</title>

<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">
<link href="resources/css/plugins/datapicker/datepicker3.css"rel="stylesheet">

        <link rel="shortcut icon" href="favicon.ico"> 
        <link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="widget">
		<!-- 佇列活動 Start-->
		<div class="col-lg-12 col-md-12">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>群組資訊</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="ibox">
								<div class="ibox-title">
									<h3>在線資訊</h3>
								</div>
								<div class="ibox-content">
									<small>在線人員</small>
									<h1>
										<span id="usercount"> </span>
									</h1>
									<small>在線客服人員</small>
									<h1>
										<span id="agentcount"> </span>
									</h1>
<!-- 									<small>在線客戶</small> -->
<!-- 									<h1> -->
<!-- 										<span id="clientcount"> </span> -->
<!-- 									</h1> -->
<!-- 									<small>總交談中通數</small> -->
<!-- 									<h1> -->
<!-- 										<span id="roomcount"> </span> -->
<!-- 									</h1> -->
								</div>

							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="row">
							<div class="ibox-title">
									<h3>在線客戶資訊</h3>
								</div>
							<div class="ibox-content">
<!-- 									<small>在線人員</small> -->
<!-- 									<h1> -->
<!-- 										<span id="usercount"> </span> -->
<!-- 									</h1> -->
<!-- 									<small>在線客服人員</small> -->
<!-- 									<h1> -->
<!-- 										<span id="agentcount"> </span> -->
<!-- 									</h1> -->
									<small>在線客戶</small>
									<h1>
										<span id="clientcount"> </span>
									</h1>
									<small>總交談中通數</small>
									<h1>
										<span id="roomcount"> </span>
									</h1>
								</div>
<!-- 								<div class="ibox-title"> -->
<!-- 									<h3>等待時間</h3> -->
<!-- 								</div> -->
<!-- 								<div class="col-lg-6 col-md-6"> -->
<!-- 									<div class="ibox"> -->
<!-- 										<div class="ibox-content"> -->
<!-- 											<h3>最長</h3> -->
<!-- 											<h1>00:15</h1> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="col-lg-6 col-md-6"> -->
<!-- 									<div class="ibox"> -->
<!-- 										<div class="ibox-content"> -->
<!-- 											<h3>平均</h3> -->
<!-- 											<h1>00:15</h1> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="col-lg-12 col-md-12"> -->
<!-- 									<div class="ibox"> -->
<!-- 										<div class="ibox-content"> -->
<!-- 											<h3>未接交談</h3> -->
<!-- 											<h1> -->
<!-- 												<span id="leaveclientcount"> </span> -->
<!-- 											</h1> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="col-lg-12 col-md-12"> -->
<!-- 									<div class="ibox"> -->
<!-- 										<div class="ibox-content"> -->
<!-- 											<h3>線上客服答應率</h3> -->
<!-- 											(接聽/掛斷(Not未接)) -->
<!-- 											<h1>0%</h1> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- 佇列活動 End-->

		<div class="col-lg-12 col-md-12">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>個人資訊</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="ibox">
								<div class="ibox-title">
									<h3>個人在線資訊</h3>
								</div>
								<div class="ibox-content">
<!-- 									<small>接通數</small> -->
<!-- 									<h1>0</h1> -->
<!-- 									<small>未接數(reject)</small> -->
<!-- 									<h1>0</h1> -->
									<small>個人交談中通數</small>
									<h1>
										<span id="userroomcount"> </span>
									</h1>
								</div>

							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="row">
								<div class="ibox-title">
									<h3>服務時間</h3>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="ibox">
										<div class="ibox-content">
											<h3>離席時間</h3>
											<h1><span id="notready_usetime"> </span></h1>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="ibox">
										<div class="ibox-content">
											<h3>準備就緒時間</h3>
											<h1><span id="ready_usetime"> </span></h1>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="ibox">
										<div class="ibox-content">
											<h3>通話時間</h3>
											<!--(總) -->
											<h1><span id="iestablished_usetime"> </span></h1>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="ibox">
										<div class="ibox-content">
											<h3>平均通話</h3>
											<!--(通話時間/接通數) -->
											<h1><span id="iestablished_usetime_avg"> </span></h1>
										</div>
									</div>
								</div>
								<!--<div class="col-lg-12 col-md-12">
                                        <div class="ibox">
                                            <div class="ibox-content">
                                                <h3>離席時間</h3>
                                                <h1>00:00</h1>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 col-md-12">
                                        <div class="ibox">
                                            <div class="ibox-content">
                                                <h3>準備就緒時間</h3>
                                                <h1>00:00</h1>
                                            </div>
                                        </div>
                                    </div>
									 <div class="col-lg-12 col-md-12">
                                        <div class="ibox">
                                            <div class="ibox-content">
                                                <h3>通話時間(總)</h3>
                                                <h1>00:00</h1>
                                            </div>
                                        </div>
                                    </div>
									 <div class="col-lg-12 col-md-12">
                                        <div class="ibox">
                                            <div class="ibox-content">
                                                <h3>平均通話(通話時間/接通數)</h3>
                                                <h1>00:00</h1>
                                            </div>
                                        </div>
                                    </div>-->
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		
		<div class="col-lg-12 col-md-12">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>EChart</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="ibox">
								<div class="ibox-title">
									<h3>EChart</h3>
								</div>
							</div>
						</div>
						
						<div class="col-lg-6 col-md-6">
							<div class="ibox">
								<div class="ibox-title">
									<div id="PieChart" style="width: 600px; height: 400px;"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="ibox">
								<div class="ibox-title">
									<div id="HistogramChart" style="width: 600px; height: 400px;"></div>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="ibox">
								<div class="ibox-title">
									<div id="LineChart" style="width: 600px; height: 400px;"></div>
								</div>
							</div>
						</div>
						
						
						
						

					</div>
				</div>
			</div>
		</div>



	</div>
<script src="resources/js/setting/echarts.js"></script>
	
<script type="text/javascript">
        // 基于准备好的dom，初始化echarts图表
        var myChart = echarts.init(document.getElementById('PieChart')); 
        
        option = {
        	    title : {
        	        text: '某站点用户访问来源',
        	        subtext: '纯属虚构',
        	        x:'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient: 'vertical',
        	        left: 'left',
        	        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
        	    },
        	    series : [
        	        {
        	            name: '访问来源',
        	            type: 'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:[
        	                {value:335, name:'直接访问'},
        	                {value:310, name:'邮件营销'},
        	                {value:234, name:'联盟广告'},
        	                {value:135, name:'视频广告'},
        	                {value:1548, name:'搜索引擎'}
        	            ],
        	            itemStyle: {
        	                emphasis: {
        	                    shadowBlur: 10,
        	                    shadowOffsetX: 0,
        	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
        	                }
        	            }
        	        }
        	    ]
        	};

        // 为echarts对象加载数据 
        myChart.setOption(option);
        
        
        var myChart = echarts.init(document.getElementById('HistogramChart')); 

        option = {
        		title:{
        			text:'坐标轴刻度与标签对齐'
        		},
            color: ['#3398DB'],
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'直接访问',
                    type:'bar',
                    barWidth: '60%',
                    data:[10, 52, 200, 334, 390, 330, 220]
                }
            ]
        };

        myChart.setOption(option);
        
        
        var myChart = echarts.init(document.getElementById('LineChart')); 
        option = {
        	    title: {
        	        text: '堆叠区域图'
        	    },
        	    tooltip : {
        	        trigger: 'axis',
        	        axisPointer: {
        	            type: 'cross',
        	            label: {
        	                backgroundColor: '#6a7985'
        	            }
        	        }
        	    },
        	    legend: {
        	        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
        	    },
        	    toolbox: {
        	        feature: {
        	            saveAsImage: {}
        	        }
        	    },
        	    grid: {
        	        left: '3%',
        	        right: '4%',
        	        bottom: '3%',
        	        containLabel: true
        	    },
        	    xAxis : [
        	        {
        	            type : 'category',
        	            boundaryGap : false,
        	            data : ['周一','周二','周三','周四','周五','周六','周日']
        	        }
        	    ],
        	    yAxis : [
        	        {
        	            type : 'value'
        	        }
        	    ],
        	    series : [
        	        {
        	            name:'邮件营销',
        	            type:'line',
        	            stack: '总量',
        	            areaStyle: {normal: {}},
        	            data:[120, 132, 101, 134, 90, 230, 210]
        	        },
        	        {
        	            name:'联盟广告',
        	            type:'line',
        	            stack: '总量',
        	            areaStyle: {normal: {}},
        	            data:[220, 182, 191, 234, 290, 330, 310]
        	        },
        	        {
        	            name:'视频广告',
        	            type:'line',
        	            stack: '总量',
        	            areaStyle: {normal: {}},
        	            data:[150, 232, 201, 154, 190, 330, 410]
        	        },
        	        {
        	            name:'直接访问',
        	            type:'line',
        	            stack: '总量',
        	            areaStyle: {normal: {}},
        	            data:[320, 332, 301, 334, 390, 330, 320]
        	        },
        	        {
        	            name:'搜索引擎',
        	            type:'line',
        	            stack: '总量',
        	            label: {
        	                normal: {
        	                    show: true,
        	                    position: 'top'
        	                }
        	            },
        	            areaStyle: {normal: {}},
        	            data:[820, 932, 901, 934, 1290, 1330, 1320]
        	        }
        	    ]
        	};
        myChart.setOption(option);
       
    </script>
    <script type="text/javascript">

    </script>



        <!-- 全局js -->
      	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
        <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
		<script src="resources/js/jquery.min.js?v=2.1.4"></script>
		<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
		
		
		
		
	        
	
		<script>
		function kpiview() {
<%-- 			var user = <%= userid%>; --%>
			var user = parent.UserID_g;
			if(user!=null && ""!=user){
				var data = 'user=' + user;
				var me = this;
				console.log("call " + "${BackendService_protocol}//${BackendService_hostname}:${BackendService_port}/${BackendService_project}/RESTful/GetKPI");
				$
						.ajax({
							url : "${BackendService_protocol}//${BackendService_hostname}:${BackendService_port}/${BackendService_project}/RESTful/GetKPI",
							type : "POST",
							dataType : 'json',
							data : data,
							error : function(e) {
								console.log("error");
							},
							success : function(data) {
								document.getElementById("usercount").innerHTML = data.usercount;
								document.getElementById("agentcount").innerHTML = data.agentcount;
								document.getElementById("clientcount").innerHTML = data.clientcount;
								document.getElementById("roomcount").innerHTML = data.roomcount;
// 								document.getElementById("leaveclientcount").innerHTML = data.leaveclientcount;
								if (user != null && "" != user) {
									//document.getElementById("username").innerHTML = data.username;
									document.getElementById("userroomcount").innerHTML = data.userroomcount;
								} else {
									//document.getElementById("username").innerHTML = 'null';
									document.getElementById("userroomcount").innerHTML = 0;
								}
								document.getElementById("notready_usetime").innerHTML = data.notready_usetime;
								document.getElementById("ready_usetime").innerHTML = data.ready_usetime;
								document.getElementById("iestablished_usetime").innerHTML = data.iestablished_usetime;
								document.getElementById("iestablished_usetime_avg").innerHTML = data.iestablished_usetime_avg;
							},
						});
			}
			setTimeout(function() {
				kpiview();
			}, 3000);
		}
		kpiview();
		//Get User ID
		//Get Talk Time
		//Get User Group Count
	</script>

</body>
</html>
