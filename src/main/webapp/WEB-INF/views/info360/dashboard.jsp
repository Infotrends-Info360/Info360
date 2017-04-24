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
<link href="resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">

        <link rel="shortcut icon" href="favicon.ico"> 
        <link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
        <link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
        <link href="resources/css/animate.css" rel="stylesheet">
        <link href="resources/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
	<div class="widget">
		<!-- 佇列活動 Start-->
		<div class="col-lg-6 col-md-6">
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

		<div class="col-lg-6 col-md-6">
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



		<!-- 代理活動 Start-->
		<!-- <div class="col-lg-3 col-md-3">
                <div class="panel panel-success" style="height:780px;">
                    <div class="panel-heading">
                        <h3>代理活動</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="ibox">
                                    <div class="ibox-title">
                                        <h3>作用中交談</h3>
                                    </div>
                                    <div class="ibox-content">
                                        <h1>0</h1>
                                    </div>
                                </div>    
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="ibox">
                                    <div class="ibox-title">
                                        <h3>交談負載</h3>
                                    </div>
                                    <div class="ibox-content">
                                        <h5>線上代理</h5>
                                        <h1>1</h1>
                                        <h5>每個代理的交談數</h5>
                                        <h1>0.0</h1>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="ibox">
                                    <div class="ibox-title">
                                        <h3>回應時間</h3>
                                    </div>
                                    <div class="ibox-content">
                                        <h5>最長</h5>
                                        <h1>-</h1>
                                        <h5>平均</h5>
                                        <h1>-</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
		<!-- 代理活動 End-->

		<!-- 滿意度 Start-->
		<!-- <div class="col-lg-3 col-md-3">
                <div class="panel panel-success" style="height:780px;">
                    <div class="panel-heading">
                        <h3>滿意度</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="ibox">
                                    <div class="ibox-title">
                                        <h3>滿意度評級</h3>
                                    </div>
                                    <div class="ibox-content">
                                        <h1>-</h1>
                                    </div>
                                </div>    
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="ibox">
                                    <div class="ibox-title">
                                        <h3>好</h3>
                                    </div>
                                    <div class="ibox-content">
                                        <h1>0</h1>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                                <div class="ibox">
                                    <div class="ibox-title">
                                        <h3>差</h3>
                                    </div>
                                    <div class="ibox-content">
                                        <h1>0</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->
		<!-- 滿意度 End-->
	</div>



        <!-- 全局js -->
        <script src="resources/js/jquery.min.js?v=2.1.4"></script>
        <script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<!-- 全局js -->
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	
        <!-- Flot -->
<!--         <script src="../js/plugins/flot/jquery.flot.js"></script> -->
<!--         <script src="../js/plugins/flot/jquery.flot.tooltip.min.js"></script> -->
<!--         <script src="../js/plugins/flot/jquery.flot.resize.js"></script> -->

        <!-- ChartJS-->
<!--         <script src="../js/plugins/chartJs/Chart.min.js"></script> -->

        <!-- Peity -->
<!--         <script src="../js/plugins/peity/jquery.peity.min.js"></script> -->

        <!-- Peity demo -->
<!--         <script src="../js/demo/peity-demo.js"></script> -->
<%-- 		<% --%>
// 		String userid =  request.getParameter("userid");
<%-- 		%> --%>
		<script>
		function kpiview() {
<%-- 			var user = <%= userid%>; --%>
			var user = parent.UserID_g;
			if(user!=null && ""!=user){
				var data = 'user=' + user;
				var me = this;
// 				alert("URL: ${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/GetKPI");
				$
						.ajax({
							url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/GetKPI",
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
