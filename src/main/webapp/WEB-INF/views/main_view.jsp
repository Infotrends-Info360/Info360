<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html onmouseenter="document.getElementById('InfoFocus').value = 0 "onmouseleave="document.getElementById('InfoFocus').value = 1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>info360主頁</title>

<meta name="keywords" content="Info360文字客服">
<meta name="description" content="Info360文字客服">

<link rel="shortcut icon" href="resources/favicon.ico">
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/layui/css/layui.css" rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">
<link href="resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">
<!-- 20170320 Lin -->
</head>

<body class="full-height-layout gray-bg" style="overflow-x: hidden">
<input value="" id="InfoFocus" type="hidden"></input>
	<!--右侧部分開始-->
	<div id="page-wrapper" class="gray-bg dashbard-1">
		<!--<div class="border-bottom">-->

		<nav class="navbar navbar-static-top" role="navigation">
		<button aria-controls="navbar" aria-expanded="false"
			data-target="#navbar" data-toggle="collapse"
			class="navbar-toggle collapsed" type="button">
			<i class="fa fa-reorder"></i>
		</button>

		<div class="container-fluid">
			<div class="navbar-header">
				<div class="row">
					<div class="col-md-2 col-sm-2">
						<a href="#" class="navbar-brand"
							style="color: white; line-height: 30px; margin-left: 15px;">Info360</a>
					</div>
					<div class="col-md-10 col-sm-10">
						<div class="content-tabs">
							<button class="roll-nav roll-left J_tabLeft">
								<i class="fa fa-backward"></i>
							</button>
							<nav class="page-tabs J_menuTabs">
							<div class="page-tabs-content">
								<a href="#" class="active J_menuTab"
									data-id="/info360/dashboard" style="display: none;"
									id="dashboardTab">儀表板</a>
							</div>
							</nav>
							<button class="roll-nav roll-right J_tabRight">
								<i class="fa fa-forward"></i>
							</button>
							<div class="btn-group roll-nav roll-right">
								<button class="dropdown J_tabClose" data-toggle="dropdown">
									關閉操作<span class="caret"></span>

								</button>
								<ul role="menu" class="dropdown-menu dropdown-menu-right">
									<li class="J_tabShowActive"><a>定位目前選擇頁籤</a></li>
									<li class="divider"></li>
									<li class="J_tabCloseAll"><a>關閉全部頁籤</a></li>
									<li class="J_tabCloseOther"><a>關閉所有其他頁籤</a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>

			</div>

			<div class="navbar-collapse collapse" id="navbar"
				aria-expanded="true">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a aria-expanded="false" role="button"
						class="dropdown-toggle" data-toggle="dropdown"
						style="line-height: 30px;" id="statusButton">
							<button class="btn btn-sm btn-primary status-ready"
								style="display: none;">準備就緒</button>
							<button class="btn btn-sm btn-danger status-notready">
								未就緒</button>
							<button class="btn btn-sm btn-warning status-paperWork"
								style="display: none;">文書處理</button>
							<ul role="menu" class="dropdown-menu" id="statusList">
								<li class="agentReady"><a onclick="agentReady()">準備就緒</a></li>
								<li><a notReady="notReady" onclick="agentNotReady()">離席</a></li>
							</ul></li>
					<li class="dropdown"><a aria-expanded="false" role="button"
						class="dropdown-toggle" data-toggle="dropdown"
						style="line-height: 30px;" id="menuButton"><span
							id="navNickName">未登入</span> <span class="caret"></span>
							<ul role="menu" class="dropdown-menu" id="menuList">
								<!-- <li><a onclick="doLogin()">登入</a></li> -->
								<!-- <li><a onclick="doTest()">test</a></li> -->
								<!-- <hr> -->
								<li><a onclick="openTab(0)">儀表板</a></li>
								<li><a onclick="openTab(6)">案件搜尋</a></li>
								<li><a onclick="openTab(7)">設定</a></li>
<!-- 								<li><a onclick="openTab(9)">personsetting</a></li> -->
								<!-- <li><a onclick="openTab(8)">修改密碼</a></li> -->
								<li><a onclick="logout()">登出</a></li>
								<hr>

								<li id="chat1Tab" style="display: none;"><a
									onclick="openTab(1)">chat1</a></li>
								<li id="chat2Tab" style="display: none;"><a
									onclick="openTab(2)">chat2</a></li>
								<li id="chat3Tab" style="display: none;"><a
									onclick="openTab(3)">chat3</a></li>
								<li id="chat4Tab" style="display: none;"><a
									onclick="openTab(4)">chat4</a></li>
								<li id="chat5Tab" style="display: none;"><a
									onclick="openTab(5)">chat5</a></li>

							</ul> </a></li>

					<!-- 實際觸發開啟頁籤區域 -->
					<div style="display: none;" id="menuItemList">
						<a class="J_menuItem" href="/info360/dashboard">儀表板</a> <a
							class="J_menuItem" href="chat1" id="chat1"></a> <a
							class="J_menuItem" href="chat2" id="chat2"></a> <a
							class="J_menuItem" href="chat3" id="chat3"></a> <a
							class="J_menuItem" href="chat4" id="chat4"></a> <a
							class="J_menuItem" href="chat5" id="chat5"></a> <a
							class="J_menuItem" href="/info360/query">案件搜尋</a> <a
							class="J_menuItem" href="/info360/setting">設定</a> <a
							class="J_menuItem" href="/info360/password">修改密碼</a>
<!-- 							<a class="J_menuItem" href="/info360/personsetting">設定</a> -->
							 <a
							href="login.html">登出</a>
							
					</div>
					<!-- 實際觸發開啟頁籤區域 -->
				</ul>
			</div>
		</div>

		</nav>
		<!--
</div>
-->
		<div class="row J_mainContent" id="content-main">
			<iframe class="J_iframe" name="iframe0" width="100%" height="100%"
				src="/info360/dashboard" frameborder="0" style="display: none;"
				data-id="/info360/dashboard" seamless></iframe>
		</div>

		<div class="footer navbar-fixed-bottom">
			<div class="pull-left">
				&copy; 2016-2017 <a href="http://www.crm.com.tw/" target="_blank">crm</a>
			</div>
		</div>
	</div>
	<!--右侧部分结束-->


	<!-- 彈跳對話視窗-->
	<!-- Modal -->
	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#myModal" style="display: none;" id="closeDialogButton">Open
		Modal</button>

	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">警告</h3>
				</div>
				<div class="modal-body">
					<h3>請問你是否要結束此對話？</h3>
					<div style="display: none;" id="closeRoomId"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal"
						onclick="leaveRoom()">確定</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onclick="reOpenCurrentChat()">取消</button>
				</div>
			</div>

		</div>
	</div>

	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#inviteDialog" style="display: none;"
		id="inviteDialogButton">Open Modal</button>

	<div id="inviteDialog" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" id="inviteNumber"></h3>
				</div>
				<div class="modal-body">
					<h3>請問你是否要接受此對話？</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal"
						onclick="acceptEvent()">接受</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onclick="rejectEvent()" id="inviteRejectButton">拒絕</button>
					<button type="button" class="btn btn-default"
						style="visibility: hidden;" data-dismiss="modal"
						id="inviteCloseButton"></button>
					<!-- ringTimeout時關閉此inviteDialog視窗 -->
				</div>
			</div>

		</div>
	</div>

	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#loginDialog" style="display: none;"
		id="loginDialogButton">Open Modal</button>

	<div id="loginDialog" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">登入失敗</h3>
				</div>
				<div class="modal-body">
					<h3 id="loginFailedMessage">帳號或密碼錯誤，請點選確定重新登入</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal"
						onclick="javascript:window.location.href='console'">確定</button>
				</div>
			</div>

		</div>
	</div>

	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#transferDialog" style="display: none;"
		id="transferDialogButton">Open Modal</button>

	<div id="transferDialog" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title">轉接(三方)</h3>
				</div>
				<div class="modal-body">
					<div style="display: none" id="transferRoomId"></div>
					<table class="table table-striped table-bordered table-hover"
						id="transferTable">
						<thead>
							<tr>
								<th class="text-center" colspan="4">客服列表</th>
							</tr>
							<tr>
								<th style="width: 25%;">客服人員</th>
								<th style="width: 25%;">姓名</th>
								<th style="width: 25%;">登入狀態</th>
								<th style="width: 25%;">動作</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>

		</div>
	</div>

	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#inviteThirdPartyDialog" style="display: none;"
		id="inviteThirdPartyDialogButton">Open Modal</button>

	<div id="inviteThirdPartyDialog" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" id="inviteThirdPartyNumber"></h3>
				</div>
				<div class="modal-body">
					<h3 id="inviteThirdPartyText">請問你是否要接受此轉接(三方)？</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal"
						onclick="acceptThirdPartyEvent()">接受</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal"
						onclick="rejectThirdPartyEvent()"
						id="inviteThirdPartyRejectButton">拒絕</button>
					<button type="button" class="btn btn-default"
						style="visibility: hidden;" data-dismiss="modal"
						id="inviteThirdPartyCloseButton"></button>
				</div>
			</div>

		</div>
	</div>

	<!-- Trigger the modal with a button -->
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
		data-target="#waitingDialog" style="display: none;"
		id="waitingDialogButton">Open Modal</button>

	<div id="waitingDialog" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						id="closeWaitingDialogButton">&times;</button>
					<h3 class="modal-title text-center">註冊中請稍候</h3>
				</div>
				<div class="modal-body">
					<div class="sk-spinner sk-spinner-circle">
						<div class="sk-circle1 sk-circle"></div>
						<div class="sk-circle2 sk-circle"></div>
						<div class="sk-circle3 sk-circle"></div>
						<div class="sk-circle4 sk-circle"></div>
						<div class="sk-circle5 sk-circle"></div>
						<div class="sk-circle6 sk-circle"></div>
						<div class="sk-circle7 sk-circle"></div>
						<div class="sk-circle8 sk-circle"></div>
						<div class="sk-circle9 sk-circle"></div>
						<div class="sk-circle10 sk-circle"></div>
						<div class="sk-circle11 sk-circle"></div>
						<div class="sk-circle12 sk-circle"></div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- 全局js -->
	<script src="resources/js/md5.min.js"></script>

	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/jquery-ui-1.10.4.min.js"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/js/plugins/layer/layer.min.js"></script>

	<!-- Data Tables -->
	<script src="resources/js/plugins/dataTables/jquery.dataTables.js"></script>
	<script src="resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

	<!-- 自定义js -->
	<script src="resources/js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="resources/js/contabs.js"></script>

	<!-- 第三方插件 -->
	<script src="resources/js/plugins/pace/pace.min.js"></script>
	<script src="resources/js/plugins/toastr/toastr.min.js"></script>
	<!-- 20170320 Lin -->

	<!-- layui -->
	<script src="resources/layui/layui.js"></script>

	<!-- Websocket -->

	<script src="resources/js/info360/swfobject.js"></script>
	<!-- for IE8 websocket compatibility -->
	<script src="resources/js/info360/web_socket.js"></script>
	<!-- for IE8 websocket compatibility -->
	<script src="resources/js/info360/websocket-util.js"></script>

	<script src="resources/js/info360/websocket-util.js"></script>
	<script src="resources/js/info360/Query_Interaction.js"></script>

	<!-- 	<script src="resources/js/info360/websocket-agent.js"></script> -->

	<script>
		
		var ws; // websocket
		var UserName_g; // 使用者名稱全域變數
		var UserID_g; // 使用者ID全域變數
		var RoomID_g; // 此為第一個加入的RoomID, 僅為開發過程使用, 不符合目前架構, 為過度開發期間保留的全域變數
		var ClientID_g; // 現在準備要服務的Client的ID 
		var ClientName_g; // 現在準備要服務的Client的名稱

		var currentClientID = ""; // 當前客戶ID
		var isonline = false; // 判斷是否上線的開關
		var autoSelectCaseInfo = true; // 判斷是否自動開啟案件資訊

		var layim; // Layim

		var userName = '${userName}';
		var password = md5('${password}');
		// 		var password = '${password}';

		var waittingClientIDList_g = []; //20170220 Lin
		var waittingAgentIDList_g = []; //20170223 Lin

		var chatTab = [ "chat1", "chat2", "chat3", "chat4", "chat5" ];
		var chatList = []; // 20170220 Billy 聊天頁籤控制清單

		var currentAgentList = []; // 20170411 Billy 目前好友名單
		var currentThirdPartyInvite; // 20170412 Billy 轉接三方專用暫存區

		var maxCount = 0;
		var currRoomCount_g = 0; //每個Agent現在已接通話數 20170224 Lin
		var currentUserData = "";

		// 20170223 Lin
		var notreadyreason_dbid_g = 0; //not ready Reason - 於皆換成NOTREADY狀態時傳入StatusEnum.updateState()方法中
		var webSocketTimeout = 5000; // ws連線超時設定值
		var StatusEnum = {
			LOGIN : {
				statusname : 'LOGIN',
				dbid : '0',
				description : '中文'
			},
			LOGOUT : {
				statusname : 'LOGOUT',
				dbid : '0',
				description : '中文'
			},
			READY : {
				statusname : 'READY',
				dbid : '0',
				description : '中文'
			},
			NOTREADY : {
				statusname : 'NOTREADY',
				dbid : '0',
				description : '中文'
			},
			AFTERCALLWORK : {
				statusname : 'AFTERCALLWORK',
				dbid : '0',
				description : '中文'
			},
			RING : {
				statusname : 'RING',
				dbid : '0',
				description : '中文'
			},
			IESTABLISHED : {
				statusname : 'IESTABLISHED',
				dbid : '0',
				description : '中文'
			},
			OESTABLISHED : {
				statusname : 'OESTABLISHED',
				dbid : '0',
				description : '中文'
			},
			REJECT : {
				statusname : 'REJECT',
				dbid : '0',
				description : '中文'
			},

			currStatusEnum : '',

			login_dbid : null,
			logout_dbid : null,
			ready_dbid : null,
			notready_dbid : null,
			paperwork_dbid : null,
			ring_dbid : null,
			iestablished_dbid : [],
			oestablished_dbid : null,
			reject_dbid : null,

			getStatusEnum : function(aStatusname) {
				aStatusname = aStatusname.toUpperCase();

				if (StatusEnum.LOGIN.statusname == aStatusname) {
					return StatusEnum.LOGIN;
				} else if (StatusEnum.LOGOUT.statusname == aStatusname) {
					return StatusEnum.LOGOUT;
				} else if (StatusEnum.READY.statusname == aStatusname) {
					return StatusEnum.READY;
				} else if (StatusEnum.NOTREADY.statusname == aStatusname) {
					return StatusEnum.NOTREADY;
				} else if (StatusEnum.AFTERCALLWORK.statusname == aStatusname) {
					return StatusEnum.AFTERCALLWORK;
				} else if (StatusEnum.RING.statusname == aStatusname) {
					return StatusEnum.RING;
				} else if (StatusEnum.IESTABLISHED.statusname == aStatusname) {
					return StatusEnum.IESTABLISHED;
				} else if (StatusEnum.OESTABLISHED.statusname == aStatusname) {
					return StatusEnum.OESTABLISHED;
				} else if (StatusEnum.REJECT.statusname == aStatusname) {
					return StatusEnum.REJECT;
				}

				return null;
			},

			updateDbid : function(aObj) {
				if (aObj.login_dbid != null)
					StatusEnum.login_dbid = aObj.login_dbid;
				if (aObj.logout_dbid != null)
					StatusEnum.logout_dbid = aObj.logout_dbid;
				if (aObj.ready_dbid != null)
					StatusEnum.ready_dbid = aObj.ready_dbid;
				if (aObj.notready_dbid != null)
					StatusEnum.notready_dbid = aObj.notready_dbid;
				if (aObj.aftercallwork_dbid != null)
					StatusEnum.aftercallwork_dbid = aObj.aftercallwork_dbid;
				if (aObj.ring_dbid != null)
					StatusEnum.ring_dbid = aObj.ring_dbid;
				if (aObj.iestablished_dbid != null)
					StatusEnum.iestablished_dbid.push(aObj.iestablished_dbid);
				if (aObj.oestablished_dbid != null)
					StatusEnum.oestablished_dbid = aObj.oestablished_dbid;
				if (aObj.reject_dbid != null)
					StatusEnum.reject_dbid = aObj.reject_dbid;
			},

			updateStatus : function(aStatusEnum, aStartORend, aDbid, aRoomID,
					aClientID, aReason_dbid) {
				//更新現有狀態
				StatusEnum.currStatusEnum = aStatusEnum;

				if ('end' == aStartORend && aDbid === undefined) {
					console.log("updateStatus - end - "
							+ aStatusEnum.description + " aDbid not found");
					return;
				}

				// 去server更新狀態
				var myUpdateStatusJson = new updateStatusJson("Agent",
						UserID_g, UserName_g, aStatusEnum.dbid, "no reason",
						aStartORend, aDbid, aRoomID, aClientID, aReason_dbid);
				ws.send(JSON.stringify(myUpdateStatusJson));

				if ('end' == aStartORend) {
					return null;
				}
				//					// 從server取得狀態
				//					getStatus();
			}

		};
		// 20170223 Lin

		// 20170320 Lin
		toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"progressBar" : true,
			"positionClass" : "toast-top-right",
			"onclick" : null,
			"showDuration" : "400",
			"hideDuration" : "1000",
			"timeOut" : "7000",
			"extendedTimeOut" : "1000",
			"showEasing" : "swing",
			"hideEasing" : "linear",
			"showMethod" : "fadeIn",
			"hideMethod" : "fadeOut"
		}
		// 20170320 Lin

		// Step-0 
		loginValidate();

		// 帳號密碼驗證
		function loginValidate() {
			$("#waitingDialogButton").trigger("click");

			$
					.ajax({
						url : "${RESTful_protocol}//${RESTful_hostname}:${RESTful_port}/${RESTful_project}/RESTful/Login",

						data : {
							account : userName,
							password : password
						},
						type : "POST",
						dataType : 'json',
						error : function(e) {
							$("#closeWaitingDialogButton").trigger("click");
							console.log("請重新整理");
						},
						success : function(data) {
							console.log("login", data)

							// 測試用必驗證過
							// 							doConnect();
							$('#loginDialog').off('hidden.bs.modal');

							if (userName == "" || password == "") {
								// 未輸入帳號與密碼
								console.log(data.error)
								$('#loginDialog').on('hidden.bs.modal',
										function() {
											window.location.href = 'console';
										})

								$("#loginDialogButton").trigger("click");
							} else if (data.error != null) {
								// 其他可能錯誤
								console.log(data.error);
								$('#loginDialog').on('hidden.bs.modal',
										function() {
											window.location.href = 'console';
										})

								$("#loginDialogButton").trigger("click");
							} else {
								// 驗證通過
								// 								console.log(JSON.stringify(data));
								maxCount = data.person[0].max_count;
								UserID_g = data.person[0].dbid;
								UserName_g = data.person[0].user_name;

								$("#dashboardTab").show();
								$('iframe[name="iframe0"]').show();
								$("#userNickName").html(UserName_g);

								// 						$('.J_iframe').attr('src',
								// 								'/info360/dashboard?userid=' + UserID_g); // 20170222 Lin 刷新dashboard，為了取的UserID
								// Step-1 載入時連線ws
								doConnect();
							}
							$("#closeWaitingDialogButton").trigger("click");
						},
						beforeSend : function() {
							// 					$('#loading').show();
						},
						complete : function() {
							// 					$('#loading').hide();

						}
					});
		}

		function doTest() {

		}

		// 連線&&登入
		function doConnect() {
			var hostname = "${websocket_hostname}" || "ws.crm.com.tw";
			var protocol = "${websocket_protocol}" || "ws:";
			var port = "${websocket_port}" || "8888";
			ws = new WebSocket(protocol + '//' + hostname + ':' + port);

			var wsTimeout = setTimeout(function() {
				$("#loginFailedMessage").html("Web Socket連線失敗，請重新登入。");

				$('#loginDialog').on('hidden.bs.modal', function() {
					window.location.href = 'console';
				})

				$("#loginDialogButton").trigger("click");
			}, webSocketTimeout);

			ws.onopen = function() {
				console.log('websocket 打開成功');
				clearTimeout(wsTimeout);

				// Step-2 連線後登入
				doLogin();
			};

			// 當收到服務端的消息時
			ws.onmessage = function(e) {

				// e.data 是服務端發來的資料
				if ("{" == e.data.substring(0, 1) && e.data.length > 2) {
					var obj = jQuery.parseJSON(e.data);
					console.log(obj);

					// 接收到有人登入的訊息
					if ("userjoin" == obj.Event) {
						// 20170321_sam
						if (obj.isLoggedIn) {
							alert(obj.isLoggedInText);
						}
						// end of 20170321_sam

						// 取得UserId
						UserID_g = obj.from;

						// 更新導覽列名稱
						$("#navNickName").html("Hi " + UserName_g);

						// 變更線上狀態變數
						isonline = true;

						//20170223 Lin

						var statusList = obj.statusList;
						var reasonList = obj.reasonList;

						// 產生NotReady狀態切換按鈕
						for ( var index in reasonList) {
							console.log(reasonList[index]);
							var statusName = reasonList[index].statusname_tw;
							var dbid = reasonList[index].dbid.trim();

							var $li = '<li><a dbid="' + dbid
									+ '" onclick="agentNotReady(' + dbid
									+ ')">' + statusName + '</a></li>'
							$("#statusList").append($li);
						}

						// 更新statusList - enum
						// 格式: {Login={description=登入, dbid=1}, Ring={description=響鈴, dbid=6}
						console.log("***Enum - 更新enum: ");
						jQuery.each(statusList, function(key, val) {
							var tmpStatusEnum = StatusEnum.getStatusEnum(key);
							tmpStatusEnum.dbid = val.dbid;
							tmpStatusEnum.description = val.description;
						});
					}

					// 20170321_sam
					if ("userjoinAgain" == obj.Event) {
						alert(obj.text);
						// 更新畫面
						$("#statusButton button.status-ready").css("display",
								"none");
						$("#statusButton button.status-notready").css(
								"display", "inline-block");

						$("#navNickName").html("已登出");

						window.location.href = 'console';
					}
					// end of 20170321_sam

					// 接收到Client邀請chat的event
					if ("findAgentEvent" == obj.Event) {
						ClientName_g = obj.fromName;
						ClientID_g = obj.from;
						notifyMe_phone();
						$("#inviteNumber").html(ClientName_g);
						$("#inviteDialogButton").trigger("click");
					}

					// 取得狀態 (此方法不再使用)
					// 					if ("getUserStatus" == obj.Event) {
					// 						// 結果為就緒
					// 						if ("3" == obj.Status) {
					// 							$("#statusButton button.status-ready").css(
					// 									"display", "inline-block");
					// 							$("#statusButton button.status-notready").css(
					// 									"display", "none");
					// 							$("#statusButton button.status-paperWork").css(
					// 									"display", "none");

					// 							//控制可選取按鈕
					// 							$("#statusList li").show();
					// 							$("#statusList li.agentReady").hide();

					// 							// 結果為未就緒
					// 						} else if ("4" == obj.Status) {
					// 							$("#statusButton button.status-ready").css(
					// 									"display", "none");
					// 							$("#statusButton button.status-notready").css(
					// 									"display", "inline-block");
					// 							$("#statusButton button.status-paperWork").css(
					// 									"display", "none");

					// 							//控制可選取按鈕
					// 							$("#statusList li").hide();
					// 							$("#statusList li.agentReady").show();
					// 						}
					// 					}

					if ("senduserdata" == obj.Event) {
						console.log("onMessage - senduserdata event");

						// 接收到Agent or Client加入列表的訊息
						currentUserData = obj.userdata;

						//20170220 Lin
						waittingClientIDList_g.push(new function() {
							this.clientID = obj.userdata.id
						});
						//20170220 Lin
					}

					// 接受成功加入Layim清單
					if ("AcceptEvent" == obj.Event) {
						// 拿取資料 + 為之後建立roomList做準備
						RoomID_g = obj.roomID; // 之後要改成local variable
						var myRoomID = obj.roomID;
						var UserName = obj.fromName;
						var chatRoomMsg = obj.chatRoomMsg; // 接收系統訊息
						roomId = RoomID_g;

						// 建立Layim名單
						console.log("acceptEvent");
						//console.log(e);

						addLayimList(ClientName_g + "," + UserName, roomId);
						// 20170313_sam
						getclientmessagelayim(chatRoomMsg, myRoomID, "系統通知"); // 更新系統訊息

						// 更新開啟頁籤  & 組合客戶資料參數至後端
						var newTab = {};
						var currentChatTab = chatTab[0]; // 指派目前可用Tab
						chatTab = chatTab.slice(1);

						newTab.id = RoomID_g;
						newTab.chatTab = currentChatTab;
						newTab.currentUserData = currentUserData;
						chatList.push(newTab);

						console.log("chatList : ");
						console.log(chatList);

						$("#" + currentChatTab).html(ClientName_g);
						var newHref = currentChatTab + "?id=" + ClientName_g;
						newHref += "&interactionId=" + RoomID_g;

						$("#" + currentChatTab).prop("href", newHref);
						$("#" + currentChatTab).trigger("click");

						$("#" + currentChatTab + "Tab > a").html(ClientName_g);
						$("#" + currentChatTab + "Tab").show();

						// 新增上方chatTab與layim連動事件 Billy 20170406
						$("a.J_menuTab").on(
								"click",
								function() {
									var id = $(this).attr("data-id");
									if ("chat" == id.substr(0, 4)) {
										$("#" + id.substr(0, 5) + "Tab > a")
												.trigger("click");
									}
								});

						// maxCount機制
						currRoomCount_g++ // here
						if (currRoomCount_g == maxCount) {
							console.log("reach max count");
						}
					}

					//20170223 Lin
					// 接收拒絕事件
					if ("RejectEvent" == obj.Event) {

					}
					//20170223 Lin

					// 接受訊息控制
					if ("messagetoRoom" == obj.Event) {
						// 判斷是否有開啟layim與是否為自己傳送的訊息
						if (true == layimswitch && obj.id != UserID_g) {
							// 將收到訊息顯示到layim上
							console.log("sendmessage");
							getclientmessagelayim(obj.text, obj.roomID,
									obj.UserName);
							var Focus = document.getElementById('InfoFocus').value
							if(Focus == 1){
								notifyMe(); 
							}
						}
					}

					//20170223 Lin
					//接收更新狀態後取得的DBID
					if ("updateStatus" == obj.Event) {
						// 20170313_sam
						// 						alert("obj.startORend: " + obj.startORend + " - " + obj.currStatusEnum);
						// 						alert("obj.currStatusEnum: " + obj.currStatusEnum);
						var startORend = obj.startORend;
						var currStatusEnum = StatusEnum
								.getStatusEnum(obj.currStatusEnum);
						// 						alert("currStatusEnum: " + currStatusEnum);

						// 20170320 Lin
						if (obj.maxCountReached) {
							toastr.error("已達到通話上限，無法切回準備就緒");
						}
						// 20170320 Lin

						// 更新狀態前端畫面 20170320_sam
						if (currStatusEnum == StatusEnum.READY) {
							// 							alert("switch to ready button");
							$("#statusButton button.status-ready").css(
									"display", "inline-block");
							$("#statusButton button.status-notready").css(
									"display", "none");
							$("#statusButton button.status-paperWork").css(
									"display", "none");

							//控制可選取按鈕
							$("#statusList li").show();
							$("#statusList li.agentReady").hide();
						} else if (currStatusEnum == StatusEnum.NOTREADY) {
							// 							alert("switch to notready button");
							$("#statusButton button.status-ready").css(
									"display", "none");
							$("#statusButton button.status-notready").css(
									"display", "inline-block");
							$("#statusButton button.status-paperWork").css(
									"display", "none");
							
							
							// 將顯示NOTREADY原因調為預設值"未就緒" 20170420_sam
							var statusName = "未就緒";
							$("#statusButton button.status-notready").html(statusName);
							// 已選取的未就緒選項需隱藏
							$("#statusList li").show();
							$('a[notReady="notReady"]').parent().hide();
							// end of 將顯示NOTREADY原因調為預設值"未就緒" 20170420_sam
							
							//控制可選取按鈕
							$("#statusList li.agentReady").show();
						} else if ("start" == startORend
								&& currStatusEnum == StatusEnum.AFTERCALLWORK) {
							// 							alert("AFTERCALLWORK");
							// 掛線後，狀態顯示文書處理。(加入顏色機制(橘色))
							$("#statusList li").show();

							$("#statusButton button.status-paperWork").css(
									"display", "inline-block");
							$("#statusButton button.status-notready").css(
									"display", "none");
							$("#statusButton button.status-ready").css(
									"display", "none");
						}
						// end of 20170313_sam
						// 						StatusEnum.updateDbid(obj);
					}
					//通知響鈴結束
					if ("ringTimeout" == obj.Event) {
						console.log("ringTimeout");

						// 20170314_sam
						// 						// 將請求畫面去掉
						if ($('#inviteDialog').hasClass("in")) {
							$("#inviteCloseButton").trigger("click");
						}
						// 將此clientID從waittingClientIDList_g中去除
						var index_remove;
						for ( var index in waittingClientIDList_g) {
							clientIDJson = waittingClientIDList_g[index];
							var clientID = clientIDJson.clientID;
							if (ClientID_g == clientID) {
								index_remove = index;
							}
							//   console.log("clietIDJson.clientID: " + clientIDJson.clientID);
						}
						waittingClientIDList_g.splice(index_remove, 1);
						// end of 20170320_sam

						// 加入逾時自動拒絕機制
						// 						if($('#inviteDialog').hasClass("in")) {
						// 							$("#inviteRejectButton").trigger("click");
						// 						} else {
						// 							rejectEvent();
						// 						}
					}
					//20170223 Lin

					if ("removeUserinroom" == obj.Event) {

						var fromUserID = obj.fromUserID;
						var roomID = obj.roomID
						var roomMembers = obj.roomMembers;
						// 20170313_sam
						// 只收他人傳來的系統訊息
						if (fromUserID != UserID_g) {
							var chatRoomMsg = obj.chatRoomMsg; // 接收系統訊息
							var leftRoomMsg = chatRoomMsg.leftRoomMsg;
							var closedRoomMsg = chatRoomMsg.closedRoomMsg;

							getclientmessagelayim(leftRoomMsg, roomID, "系統通知"); // 更新系統訊息

							if (closedRoomMsg != undefined) {
								getclientmessagelayim(closedRoomMsg, roomID,
										"系統通知"); // 更新系統訊息
							}
						}

						// 20170418  聊天房間若是所有人皆離開時清除layim群聊並切換至該客資頁籤 Billy
						if ('[]' == roomMembers) {
							// 清除layim群聊清單
							console.log("聊天室已無成員，removeList : " + roomID);
							var chatRoomMsg = obj.chatRoomMsg; // 接收系統訊息
							var closedRoomMsg = chatRoomMsg.closedRoomMsg;

							if (closedRoomMsg != undefined) {
								toastr.error(closedRoomMsg);
							}
							
							layim.removeList({
								type : 'group',
								id : roomID
							//好友或者群组ID
							});

							// 切換至該客戶資訊頁面
							chatList
									.forEach(function(entry) {
										if (roomID == entry.id) {
											$("#" + entry.chatTab).trigger(
													"click");
											var iframeName = entry.chatTab
													.replace("chat", "iframe");
											$('[name=' + iframeName + ']')[0].contentWindow
													.showCaseInfoTab();
										}
									});
						}
					}

					// 20170331_sam
					if ("clientServerd" == obj.Event) {
						alert("obj.text: " + obj.text);
					}// end of 20170331_sam

					// 20170411 刷新好友名單 Billy
					if ("refreshAgentList" == obj.Event) {
						var agentList = obj.agentList;

						clearAgentList();
						$("#transferTable").DataTable().destroy();
						$("#transferTable tbody").html("");

						for (key in agentList) {
							var userName = agentList[key].username;
							var userId = agentList[key].userid;
							var ready = agentList[key].ready;

							if (UserID_g != userId) {
								layim
										.addList({
											type : 'friend',
											username : userName,
											avatar : 'resources/layui/css/pc/layim/skin/new_logo.jpg' // 消息來源使用者頭像
											,
											groupid : 1,
											id : userId
										});

								var currentAgent = {};
								currentAgent.userId = userId;
								currentAgent.userName = userName;

								currentAgentList.push(currentAgent);

								// 重整轉接三方名單
								var $tr = "<tr>";

								$tr += '<td>' + userId + '</td>';
								$tr += '<td>' + userName + '</td>';

								if (ready) {
									$tr += '<td>準備就緒</td>';
								} else {
									$tr += '<td>未就緒</td>';
								}

								$tr += '<td><div class="col-xs-6"><button class="btn btn-success" data-dismiss="modal" onclick="inviteAgentThirdParty(\'transfer\',\''
										+ userId + '\')">轉接</button></div>';
								$tr += '<div class="col-xs-6"><button class="btn btn-primary" data-dismiss="modal" onclick="inviteAgentThirdParty(\'thirdParty\',\''
										+ userId
										+ '\')">三方</button></div></td>';
								$tr += '</tr>';

								$("#transferTable tbody").append($tr);
							}

						}

						// default search and initdataTable
						var opt = {
							"bLengthChange" : false,
							"iDisplayLength" : 10
						};

						$("#transferTable").DataTable(opt);

						console.log("currentAgentList:");
						console.log(currentAgentList);
					}
					// End of 20170411 刷新好友名單 Billy

					// 20170411 私訊功能 Billy
					if ("privateMsg" == obj.Event) {
						console.log("privateMessage : ");

						// 判斷是否有開啟layim與是否為發送給自己的訊息
						if (true == layimswitch && obj.sendto == UserID_g) {
							getPrivateMessageLayim(obj.text, obj.UserID,
									obj.UserName)
						}
					}
					// End of 20170411 私訊功能 Billy

					// 20170412 轉接三方回應功能 Billy
					if ("inviteAgentThirdParty" == obj.Event) {
						var fromAgentName = obj.fromAgentName;
						var inviteType = obj.inviteType;
						var clientId = obj.userdata.Tel1;

						$("#inviteThirdPartyNumber").html(clientId);

						if ("transfer" == inviteType) {
							$("#inviteThirdPartyText").html(
									"來自：" + fromAgentName + "的轉接，請問你是否要接受此對話？")
						} else if ("thirdParty" == inviteType) {
							$("#inviteThirdPartyText").html(
									"來自：" + fromAgentName
											+ "的三方轉接，請問你是否要接受此對話？")
						}

						//轉接,請問你是否要接受此對話?
						currentThirdPartyInvite = obj;

						$("#inviteThirdPartyDialogButton").trigger("click");
					}

					if ("addUserInRoom" == obj.Event) {
					}

					// 當接收轉接三方後開啟聊天視窗
					if ("responseThirdParty" == obj.Event) {
						var response = obj.response;
						var inviteType = obj.inviteType;
						var invitedAgentId = obj.invitedAgentID
						var fromAgentId = obj.fromAgentID;
						var roomId = obj.roomID;
						var fromAgentName = currentThirdPartyInvite.fromAgentName;

						// 1.處理邀請者的事件
						if (UserID_g == fromAgentId) {
							if ("reject" == response) {
								if ("transfer" == inviteType) {
									$("#layim-group" + roomId).trigger("click");
									toastr.error("轉接失敗-對方拒絕");
								} else if ("thirdParty" == inviteType) {
									toastr.error("三方轉接失敗-對方拒絕");
								}
							} else if ("timeout" == response) {
								if ("transfer" == inviteType) {
									toastr.error("轉接失敗-對方無回應");
									$("#layim-group" + roomId).trigger("click");
								} else if ("thirdParty" == inviteType) {
									toastr.error("三方轉接失敗-對方無回應");
								}
							} else if ("accept" == response) {
								if ("transfer" == inviteType) {
									// 處理轉接
									toastr.success("轉接成功");
								} else if ("thirdParty" == inviteType) {
									// 處理三方
									toastr.success("三方轉接成功");
								}
							}
						} else if (UserID_g != fromAgentId) {
							if ("reject" == response) {
								if ("transfer" == inviteType) {
									//toastr.error("轉接失敗-拒絕");
								} else if ("thirdParty" == inviteType) {
									//toastr.error("三方轉接失敗-拒絕");
								}
							} else if ("timeout" == response) {
								if ("transfer" == inviteType) {
									toastr.error("轉接失敗-回應時間過長");
									$("#inviteThirdPartyCloseButton").trigger(
											"click");
								} else if ("thirdParty" == inviteType) {
									toastr.error("三方轉接失敗-回應時間過長");
									$("#inviteThirdPartyCloseButton").trigger(
											"click");
								}
							} else if ("accept" == response) {
								if ("transfer" == inviteType) {
									// 處理轉接
									console.log("acceptTransferInvite");

									toastr.success("轉接成功");

									RoomID_g = currentThirdPartyInvite.roomID;
									var clientId = currentThirdPartyInvite.userdata.Tel1;
									var chatRoomMsg = obj.chatRoomMsg; // 接收系統訊息
									currentUserData = currentThirdPartyInvite.userdata;

									// 建立Layim名單
									addLayimList(clientId + "," + UserName_g,
											RoomID_g);

									// 更新開啟頁籤  & 組合客戶資料參數至後端
									var newTab = {};
									var currentChatTab = chatTab[0]; // 指派目前可用Tab
									chatTab = chatTab.slice(1);

									newTab.id = RoomID_g;
									newTab.chatTab = currentChatTab;
									newTab.currentUserData = currentUserData;
									chatList.push(newTab);

									$("#" + currentChatTab).html(clientId);
									var newHref = currentChatTab + "?id="
											+ clientId;
									newHref += "&interactionId=" + RoomID_g;

									$("#" + currentChatTab).prop("href",
											newHref);
									$("#" + currentChatTab).trigger("click");

									$("#" + currentChatTab + "Tab > a").html(
											ClientName_g);
									$("#" + currentChatTab + "Tab").show();

									// 新增上方chatTab與layim連動事件 Billy 20170406
									$("a.J_menuTab")
											.on(
													"click",
													function() {
														var id = $(this).attr(
																"data-id");
														if ("chat" == id
																.substr(0, 4)) {
															$(
																	"#"
																			+ id
																					.substr(
																							0,
																							5)
																			+ "Tab > a")
																	.trigger(
																			"click");
														}
													});

									// maxCount機制
									currRoomCount_g++ // here
									if (currRoomCount_g >= maxCount) {
										console.log("reach max count");
									}
								} else if ("thirdParty" == inviteType) {
									// 處理三方
									console.log("acceptThirdPartyInvite");
									toastr.success("三方轉接成功");

									RoomID_g = currentThirdPartyInvite.roomID;
									var clientId = currentThirdPartyInvite.userdata.Tel1;
									var chatRoomMsg = obj.chatRoomMsg; // 接收系統訊息
									currentUserData = currentThirdPartyInvite.userdata;

									// 建立Layim名單
									addLayimList(clientId + "," + fromAgentName
											+ "," + UserName_g, RoomID_g);

									// 更新開啟頁籤  & 組合客戶資料參數至後端
									var newTab = {};
									var currentChatTab = chatTab[0]; // 指派目前可用Tab
									chatTab = chatTab.slice(1);

									newTab.id = RoomID_g;
									newTab.chatTab = currentChatTab;
									newTab.currentUserData = currentUserData;
									chatList.push(newTab);

									$("#" + currentChatTab).html(clientId);
									var newHref = currentChatTab + "?id="
											+ clientId;
									newHref += "&interactionId=" + RoomID_g;

									$("#" + currentChatTab).prop("href",
											newHref);
									$("#" + currentChatTab).trigger("click");

									$("#" + currentChatTab + "Tab > a").html(
											ClientName_g);
									$("#" + currentChatTab + "Tab").show();

									// 新增上方chatTab與layim連動事件 Billy 20170406
									$("a.J_menuTab")
											.on(
													"click",
													function() {
														var id = $(this).attr(
																"data-id");
														if ("chat" == id
																.substr(0, 4)) {
															$(
																	"#"
																			+ id
																					.substr(
																							0,
																							5)
																			+ "Tab > a")
																	.trigger(
																			"click");
														}
													});

									// maxCount機制
									currRoomCount_g++ // here
									if (currRoomCount_g >= maxCount) {
										console.log("reach max count");
									}
								}
							}
						}
					}
					// End of20170412 轉接三方回應功能 Billy
				} else if ("{" != e.data.substring(0, 1)) {
					console.log(e);

					// 非指令訊息
					if (e.data.indexOf("Offline") > 0
							&& e.data.indexOf(UserName_g) > 0) { //20170223 Lin
						$("#statusButton button.status-ready").css("display",
								"none");
						$("#statusButton button.status-notready").css(
								"display", "inline-block");

						$("#navNickName").html("已登出");

						window.location.href = 'console';
					}
				}
			}
		}

		function clearAgentList() {
			for (key in currentAgentList) {
				// 清除layim群聊
				layim.removeList({
					type : 'friend',
					id : currentAgentList[key].userId
				});
			}

			currentAgentList = [];
		}

		// 登入
		function doLogin() {
			var now = new Date();

			// 向websocket送出登入指令
			var msg = {
				type : "login",
				id : UserID_g,
				UserName : UserName_g,
				// 				MaxCount : '3', //需從驗證登入頁面取得個人的max count並塞入
				maxCount : "" + maxCount,
				ACtype : "Agent",
				channel : "chat",
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};
			// 發送消息
			ws.send(JSON.stringify(msg));

			currRoomCount_g = 0;

		}

		// 登出
		function logout() {
			// 向websocket送出登出指令
			var now = new Date();
			var msg = {
				type : "Exit",
				// text: message,
				id : UserID_g,
				UserName : UserName_g,
				channel : "chat",
				waittingClientIDList : waittingClientIDList_g, //20170220 Lin
				waittingAgentIDList : waittingAgentIDList_g, //20170223 Lin
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};

			// 發送消息
			ws.send(JSON.stringify(msg));

			// 清空waittingClientIDList_g 20170220 Lin
			waittingClientIDList_g = [];
		}

		//Agent準備就緒
		function agentReady() {
			// 20170313_sam 
			// 向websocket送出變更狀態至準備就緒指令
			StatusEnum.updateStatus(StatusEnum.READY, "start");
			// end of 20170313_sam

			// 取得狀態
			// 			getStatus();
		}

		// Agent尚未準備就緒
		function agentNotReady(reason) {
			var reasonDbId = notreadyreason_dbid_g;
			var statusName = "未就緒";

			if (reason && reason > 0) {
				reasonDbId = reason;
				statusName = $('a[dbid="' + reason + '"]').html();

				// 已選取的未就緒選項需隱藏
				$("#statusList li").show();
				$('a[dbid="' + reason + '"]').parent().hide();
			} else {
				// 已選取的未就緒選項需隱藏
				$("#statusList li").show();
				$('a[notReady="notReady"]').parent().hide();
			}

			$("#statusButton button.status-notready").html(statusName);

			// 20170313_sam 
			StatusEnum.updateStatus(StatusEnum.NOTREADY, "start", null, null,
					null, reasonDbId);
			// end of 20170313_sam 
			// 			getStatus();

		}

		// 取得Agent狀態(此方法不再使用)
		// 		function getStatus() {
		// 			console.log("getStatus");
		// 			// 向websocket送出取得Agent狀態指令
		// 			var now = new Date();
		// 			var Eventmsg = {
		// 				type : "getUserStatus",
		// 				ACtype : "Agent",
		// 				id : UserID_g,
		// 				UserName : UserName_g,
		// 				channel : 'chat',
		// 				date : now.getHours() + ":" + now.getMinutes() + ":"
		// 						+ now.getSeconds()
		// 			};
		// 			// 發送消息
		// 			ws.send(JSON.stringify(Eventmsg));
		// 		}

		// 只有再aStatus狀態為not ready時,才會傳入aReason參數
		function updateStatus(aStatus, aReason) {
			// 向websocket送出變更狀態至未就緒指令
			var now = new Date();
			var updateAgentStatusmsg = {
				type : "updateStatus",
				ACtype : "Agent",
				id : UserID_g,
				UserName : UserName_g,
				status : aStatus,
				reason : aReason,
				channel : "chat",
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};
			// 發送消息
			ws.send(JSON.stringify(updateAgentStatusmsg));
		}

		function acceptEvent() {
			currentClientID = ClientID_g;
			// 在此使用新的方法,將一個list的成員都加入到同一群組中
			var memberListToJoin = [];
			var mem1 = new myRoomMemberJsonObj(currentClientID);
			var mem2 = new myRoomMemberJsonObj(UserID_g);
			memberListToJoin.push(mem1);
			memberListToJoin.push(mem2);
			addRoomForMany("none", memberListToJoin); // "none"是一個keyword, 會影響websocket server的邏輯判斷處理

			//20170220 Lin
			// 將此clientID從waittingClientIDList_g中去除
			var index_remove;
			for ( var index in waittingClientIDList_g) {
				clientIDJson = waittingClientIDList_g[index];
				var clientID = clientIDJson.clientID;
				if (currentClientID == clientID) {
					index_remove = index;
				}
				//   console.log("clietIDJson.clientID: " + clientIDJson.clientID);
			}
			waittingClientIDList_g.splice(index_remove, 1);
			//20170220 Lin
		}

		function rejectEvent() {
			var Eventfrom = ClientID_g;
			// 向websocket送出拒絕交談指令
			var now = new Date();
			var msg = {
				type : "RejectEvent",
				ACtype : "Agent",
				id : UserID_g,
				UserName : UserName_g,
				sendto : Eventfrom,
				channel : "chat",
				// Event: "RejectEvent",
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};
			// 發送消息
			ws.send(JSON.stringify(msg));

			//20170220 Lin
			// 將此clientID從waittingClientIDList_g中去除
			var index_remove;
			for ( var index in waittingClientIDList_g) {
				clientIDJson = waittingClientIDList_g[index];
				var clientID = clientIDJson.clientID;
				if (ClientID_g == clientID) {
					index_remove = index;
				}
				//   console.log("clietIDJson.clientID: " + clientIDJson.clientID);
			}
			waittingClientIDList_g.splice(index_remove, 1);
			//20170220 Lin

			//document.getElementById("AcceptEvent").disabled = true;
			//document.getElementById("RejectEvent").disabled = true;
		}

		// 轉接三方接受、拒絕專區 Start
		function acceptThirdPartyEvent() {
			var roomId = currentThirdPartyInvite.roomID;
			var fromAgentId = currentThirdPartyInvite.fromAgentID;
			var invitedAgentId = currentThirdPartyInvite.invitedAgentID;
			var inviteType = currentThirdPartyInvite.inviteType;
			var userData = currentThirdPartyInvite.userdata;
			var text = currentThirdPartyInvite.text;

			var msg = {
				type : "responseThirdParty",
				ACtype : "Agent",
				roomID : roomId,
				fromAgentID : fromAgentId,
				invitedAgentID : invitedAgentId,
				response : "accept",
				inviteType : inviteType,
				userdata : userData,
				text : text,
				channel : "chat",
			};

			console.log("acceptThirdPartyEvent()");
			console.log(msg);

			// 發送消息
			ws.send(JSON.stringify(msg));
		}

		function rejectThirdPartyEvent() {
			var roomId = currentThirdPartyInvite.roomID;
			var fromAgentId = currentThirdPartyInvite.fromAgentID;
			var invitedAgentId = currentThirdPartyInvite.invitedAgentID;
			var inviteType = currentThirdPartyInvite.inviteType;
			var userData = currentThirdPartyInvite.userdata;
			var text = currentThirdPartyInvite.text;

			var msg = {
				type : "responseThirdParty",
				ACtype : "Agent",
				roomID : roomId,
				fromAgentID : fromAgentId,
				invitedAgentID : invitedAgentId,
				response : "reject",
				inviteType : inviteType,
				userdata : userData,
				text : text,
				channel : "chat",
			};

			console.log("rejectThirdPartyEvent()");
			console.log(msg);

			// 發送消息
			ws.send(JSON.stringify(msg));
		}
		// 轉接三方接受、拒絕專區 End

		// 將多人同時加入房間
		// aMemberListToJoin船入格式如下:
		// [{"ID":"c8013217-2b20-46c4-ba2d-848fa430775e"},{"ID":"773bc9f4-3462-4360-8b11-e35be56b820a"}]
		function addRoomForMany(aRoomID, aMemberListToJoin) {
			if (aRoomID === undefined)
				aRoomID = RoomID_g; // 開發過渡期使用,之後會修掉

			console.log("addRoomForMany() - aMemberListToJoin"
					+ aMemberListToJoin);
			// 向websocket送出加入群組指令
			var now = new Date();
			var msg = {
				type : "addRoomForMany",
				roomID : aRoomID,
				memberListToJoin : aMemberListToJoin,
				ACtype : "Agent",
				UserName : UserName_g,
				channel : "chat",
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};

			// 發送消息
			ws.send(JSON.stringify(msg));
		}

		// 進線時新增此人物至好友清單
		function addLayimList(name, roomId) {
			layui.use('layim', function(layim) {
				layim.addList({
					type : 'group',
					username : name,
					avatar : 'resources/layui/css/pc/layim/skin/new_logo.jpg' // 消息來源使用者頭像
					,
					groupid : 1,
					id : roomId
				});
			});

			$("#layim-group" + roomId).trigger("click");
		}

		// layim取得訊息
		function getclientmessagelayim(text, roomId, UserName) {
			// 組成傳送群組訊息至layim視窗上的JSON指令
			obj = {

				username : UserName // 消息來源用戶名
				,
				name : "adjakdjakld",
				avatar : 'resources/layui/css/pc/layim/skin/new_logo.jpg' // 消息來源使用者頭像
				,
				id : roomId // 聊天視窗來源ID（如果是私聊，則是用戶id，如果是群聊，則是群組id）
				,
				type : "group" // 聊天視窗來源類型，從發送消息傳遞的to裡面獲取
				,
				content : text // 消息內容
				// ,cid: 0 //消息id，可不傳。除非你要對消息進行一些操作（如撤回）
				// ,mine: false //是否我發送的消息，如果為true，則會顯示在右方
				// ,fromid: 100001 //消息來源者的id，可用於自動解決流覽器多視窗時的一些問題
				,
				timestamp : new Date().getTime()
			// 服務端動態時間戳記
			}

			// 發送消息給layim
			layim.getMessage(obj);
			// 取消自動點選新訊息視窗功能
			//$("#layim-group" + roomId).trigger("click");
		}

		function getPrivateMessageLayim(text, userId, userName) {
			// 組成傳送群組訊息至layim視窗上的JSON指令
			obj = {
				username : userName // 消息來源用戶名
				,
				avatar : 'resources/layui/css/pc/layim/skin/new_logo.jpg' // 消息來源使用者頭像
				,
				id : userId // 聊天視窗來源ID（如果是私聊，則是用戶id，如果是群聊，則是群組id）
				,
				type : "friend" // 聊天視窗來源類型，從發送消息傳遞的to裡面獲取
				,
				content : text // 消息內容
				// ,cid: 0 //消息id，可不傳。除非你要對消息進行一些操作（如撤回）
				// ,mine: false //是否我發送的消息，如果為true，則會顯示在右方
				// ,fromid: 100001 //消息來源者的id，可用於自動解決流覽器多視窗時的一些問題
				,
				timestamp : new Date().getTime()
			// 服務端動態時間戳記
			}

			// 發送消息給layim
			layim.getMessage(obj);
		}

		// 傳送群組訊息至layim視窗上
		function sendtoRoomonlay(text) {
			var myMessagetoRoomJson = new messagetoRoomJson("messagetoRoom",
					"Client", text, UserID_g, UserName_g, RoomID_g, "chat", "");

			// 發送消息給WebSocket	
			console.log("sendtoRoomonlay");
			console.log(myMessagetoRoomJson);

			ws.send(JSON.stringify(myMessagetoRoomJson));

		}

		//送出私訊
		function send(aSendto, aMessage) {

			if (aSendto === undefined)
				aSendto = document.getElementById('sendto').value;
			if (aMessage === undefined)
				aMessage = document.getElementById('message').value;

			// 向websocket送出私訊指令
			var now = new Date();
			var msg = {
				type : "message",
				text : aMessage,
				id : UserID_g,
				UserName : UserName_g,
				sendto : aSendto,
				channel : "chat",
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};
			// 發送消息
			ws.send(JSON.stringify(msg));
		}

		// 轉接(三方)邀請事件 20170412 Billy
		function inviteAgentThirdParty(type, invitedAgentId) {
			var roomId = $("#transferRoomId").html();
			var text = $(".layui-show > .layim-chat-main").html();

			// 轉接後關閉目前視窗
			if ("transfer" == type) {
				$('.layim-chatlist-group' + roomId).parent().parent().parent()
						.find('.layui-layer-setwin>a.layui-layer-close1')
						.trigger("click");
			}

			var userData;

			for (key in chatList) {
				if (chatList[key].id == roomId) {
					userData = chatList[key].currentUserData;
				}
			}

			var msg = {
				type : "inviteAgentThirdParty",
				ACtype : "Agent",
				roomID : RoomID_g,
				fromAgentID : UserID_g,
				invitedAgentID : invitedAgentId,
				fromAgentName : UserName_g,
				inviteType : type,
				userdata : userData,
				text : text,
				channel : "chat"
			};

			currentThirdPartyInvite = msg;

			console.log("inviteAgentThirdParty");
			console.log(msg);
			// 發送消息
			ws.send(JSON.stringify(msg));
		}

		// 離開房間
		function leaveRoom(aRoomID, aUserID) {
			if (aUserID === undefined)
				aUserID = UserID_g;
			if (aRoomID === undefined)
				aRoomID = $("#closeRoomId").text();
			// 向websocket送出離開群組指令
			var now = new Date();
			var msg = {
				type : "leaveRoom",
				roomID : aRoomID,
				id : aUserID,
				UserName : userName,
				channel : "chat",
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};

			// 發送消息
			ws.send(JSON.stringify(msg));
		}

		function closeCurrentTab(interactionId) {
			// 刪除目前使用Chat清單
			chatList.forEach(function(entry) {
				if (interactionId == entry.id) {
					// 
					$("#" + entry.chatTab).trigger("click");
					$(".page-tabs-content > .active > i").trigger("click");

					chatList.splice($.inArray(entry, chatList), 1);
					chatTab.push(entry.chatTab)

					// 右上清單動作
					$("#" + entry.chatTab + "Tab > a").html("");
					$("#" + entry.chatTab + "Tab").hide();
				}
			});
			console.log("after close tab and remove (chatList) : ");
			console.log(chatList);
		}

		/*-------------------------------------------------------*/
		// 		$("#statusButton").on(
		// 				"click",
		// 				function() {
		// 					var statusReady = $("#statusButton button.status-ready")
		// 							.css("display");
		// 					if (statusReady && statusReady == "inline-block") {
		// 						agentNotReady();
		// 					} else {
		// 						agentReady();
		// 					}
		// 				});
		function openTab(order) {
			$("#menuItemList>a:eq(" + order + ")").trigger("click");

			var chatTab = "chat" + order;
			var roomId = "";

			for (key in chatList) {
				if (chatList[key].chatTab == chatTab) {
					roomId = chatList[key].id;
				}
			}

			if ("" != roomId) {
				$("#layim-group" + roomId).trigger("click");
			}

			if (6 == order) {
				$('a[data-id="/info360/query"]').children().show();
			} else if (7 == order) {
				console.log(order + " is selected");
				$('a[data-id="/info360/setting"]').children().show();
			}
// 			else if (9 == order) {
// 				console.log(order + " is selected");
// 				$('a[data-id="/info360/personsetting"]').children().show();
// 			}
		}

		function showTransferDialog() {
			console.log(RoomID_g);

			if ("" != RoomID_g) {
				$("#transferRoomId").html(RoomID_g);
				$("#transferDialogButton").trigger("click");
			} else {
				toastr.error("好友清單不提供轉接(三方功能)");
			}
		}

		function showCloseDialog() {
			console.log(RoomID_g);
			$("#closeRoomId").html(RoomID_g);
			$("#closeDialogButton").trigger("click");
		}

		function reOpenCurrentChat() {
			var roomId = $("#closeRoomId").html();

			$("#layim-group" + roomId).trigger("click");
		}
	</script>

	<script>
		layui
				.use(
						'layim',
						function() {
							layim = layui.layim;

							//基础配置
							layim
									.config({
										//初始化接口
										init : {
											url : '',
											data : {}
										}
										//查看群员接口
										,
										members : {
											url : '',
											data : {}
										}

										,
										uploadImage : {
											url : 'http://10.5.0.132:8080/JAXRS-FileUpload/rest/upload/images' //（返回的数据格式见下文）
										//,type : '' //默认post
										},
										uploadFile : {
											url : 'http://10.5.0.132:8080/JAXRS-FileUpload/rest/upload/files' //（返回的数据格式见下文）
										//,type : '' //默认post
										}

										//扩展工具栏
										,
										tool : [ {
											alias : 'code',
											title : '代碼',
											icon : '&#xe64e;'
										} ]

										//,brief: true //是否简约模式（若开启则不显示主面板）

										//,title: 'WebIM' //自定义主面板最小化时的标题
										//,right: '100px' //主面板相对浏览器右侧距离
										//,minRight: '90px' //聊天面板最小化时相对浏览器右侧距离
										//,initSkin: '3.jpg' //1-5 设置初始背景
										//,skin: ['aaa.jpg'] //新增皮肤
										//,isfriend: false //是否开启好友
										//,isgroup: false //是否开启群组
										,
										min : true //是否始终最小化主面板，默认false
										,notice: true //是否开启桌面消息提醒，默认false
										,voice: true //声音提醒，默认开启，声音文件为：default.wav
// 										,
// 										msgbox : 'layui/demo/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
// 										,
// 										find : 'layui/demo/find.html' //发现页面地址，若不开启，剔除该项即可
// 										,
// 										chatLog : 'layui/demo/chatLog.html' //聊天记录页面地址，若不开启，剔除该项即可

									});
							//监听在线状态的切换事件
							layim.on('online', function(status) {
								layer.msg(status);
							});
							//监听签名修改
							layim.on('sign', function(value) {
								layer.msg(value);
							});
							//监听自定义工具栏点击，以添加代码为例
							layim.on('tool(code)', function(insert) {
								layer.prompt({
									title : '插入代碼',
									formType : 2,
									shade : 0
								}, function(text, index) {
									layer.close(index);
									insert('[pre class=layui-code]' + text
											+ '[/pre]'); //将内容插入到编辑器
								});
							});
							//监听layim建立就绪
							layim.on('ready', function(res) {
								//layim.msgbox(5);
							});

							//監聽發送消息
							layim.on('sendMessage', function(data) {
								var To = data.to;
								console.log('sendMessage log');
								console.log(data);

								if (To.type === 'group') {
									// 傳送群組訊息至layim視窗上
									sendtoRoomonlay(data.mine.content);
								} else if (To.type === 'friend') {
									// 向websocket送出私訊指令
									var now = new Date();
									var msg = {
										type : "message",
										text : data.mine.content,
										sendto : To.id,
										channel : "chat",
										date : now.getHours() + ":"
												+ now.getMinutes() + ":"
												+ now.getSeconds()
									};
									// 發送消息
									ws.send(JSON.stringify(msg));
								}

							});

							//监听查看群员
							layim.on('members', function(data) {
								console.log(data);
							});

							//监听聊天窗口的切换
							layim
									.on(
											'chatChange',
											function(res) {
												var type = res.data.type;
												console.log(res);

												if (type === 'friend') {
													RoomID_g = "";
													$(
															".layim-chatlist-friend"
																	+ res.data.id)
															.removeClass(
																	'layui-anim-incoming-chat');
												} else if (type === 'group') {
													RoomID_g = res.data.id;

													// 新增layim 訊息切換背景顏色控制，參照layim.js內 "chatChange-color"
													$(
															".layim-chatlist-group"
																	+ RoomID_g)
															.removeClass(
																	'layui-anim-incoming-chat');
													chatList
															.forEach(function(
																	entry) {
																if (res.data.id == entry.id) {
																	$(
																			"#"
																					+ entry.chatTab)
																			.trigger(
																					"click");
																}
															});
												}
											});

							$('.site-demo-layim').on('click', function() {
								var type = $(this).data('type');
								active[type] ? active[type].call(this) : '';
							});

							$("#userNickName").html(UserName_g);

							// 開啟傳送layim參數
							layimswitch = true;
						});
		
		function notifyMe() {
			  // Let's check if the browser supports notifications
			  if (!("Notification" in window)) {
			    alert("This browser does not support desktop notification");
			  }

			  // Let's check whether notification permissions have already been granted
			  else if (Notification.permission === "granted") {
			    // If it's okay let's create a notification
			    var notification = new Notification("Hi 您有新訊息!");
			  }

			  // Otherwise, we need to ask the user for permission
			  else if (Notification.permission !== "denied") {
			    Notification.requestPermission(function (permission) {
			      // If the user accepts, let's create a notification
			      if (permission === "granted") {
			        var notification = new Notification("Hi 您有新訊息!!");
			      }
			    });
			  }
				setTimeout(function() { notification.close() }, "${Info_notification}");
			  // At last, if the user has denied notifications, and you 
			  // want to be respectful there is no need to bother them any more.
			}
		
		function notifyMe_phone() {
			  // Let's check if the browser supports notifications
			  if (!("Notification" in window)) {
			    alert("This browser does not support desktop notification");
			  }

			  // Let's check whether notification permissions have already been granted
			  else if (Notification.permission === "granted") {
			    // If it's okay let's create a notification
			    var notification = new Notification("Hi 您有新的通話!");
			  }

			  // Otherwise, we need to ask the user for permission
			  else if (Notification.permission !== "denied") {
			    Notification.requestPermission(function (permission) {
			      // If the user accepts, let's create a notification
			      if (permission === "granted") {
			        var notification = new Notification("Hi 您有新的通話!!");
			      }
			    });
			  }
				setTimeout(function() { notification.close() }, "${Info_notification}");
			}
		

// 		function InfoFocus(){
// 			var FocusInfo = 1;
		
// 			$(window).on("blur focus", function(e) {
// 				var InfoFocus = true;	
// 			    var prevType = $(this).data("prevType");
// 			    if (prevType != e.type) {   //  reduce double fire issues
// 			        switch (e.type) {
// 			            case "blur":
// 			                break;
// 			            case "focus":
// 			            	FocusInfo = 0;
// 			                break;
// 			        }
// 			    }
// 			    $(this).data("prevType", e.type);
// 			})
// 		}
	
		        
	</script>

</body>
</html>
