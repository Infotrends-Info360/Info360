<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
</head>

<body class="full-height-layout gray-bg" style="overflow-x: hidden">
	<!--右侧部分开始-->
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
									data-id="/info360/dashboard">儀表板</a>
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
					<li><a id="statusButton">
							<button class="btn btn-xs btn-primary btn-circle status-ready"
								style="display: none;">
								<i class="fa fa-check"></i>
							</button>
							<button class="btn btn-xs btn-danger btn-circle status-notready">
								<i class="fa fa-times"></i>
							</button>
					</a></li>
					<li class="dropdown"><a aria-expanded="false" role="button"
						class="dropdown-toggle" data-toggle="dropdown"
						style="line-height: 30px;" id="menuButton"><span
							id="navNickName">未登入</span> <span class="caret"></span>
							<ul role="menu" class="dropdown-menu" id="menuList">
								<!-- 																<li><a onclick="doLogin()">登入</a></li> -->
								<!-- 																<li><a onclick="doTest()">test</a></li> -->
								<!-- 																<hr> -->
								<li><a onclick="openTab(0)">儀表板</a></li>
								<li><a onclick="openTab(1)">案件搜尋</a></li>
								<li><a onclick="openTab(2)">設定</a></li>
								<!-- 								<li><a onclick="openTab(3)">修改密碼</a></li> -->
								<li><a onclick="logout()">登出</a></li>
								<hr>

								<!-- <li><a onclick="openTab(5)">0912345678</a> <a
									onclick="openTab(6)">0987654321</a></li>
									 -->
							</ul> </a></li>

					<!-- 實際觸發開啟頁籤區域 -->
					<div style="display: none;" id="menuItemList">
						<a class="J_menuItem" href="/info360/dashboard">儀表板</a> <a
							class="J_menuItem" href="/info360/query">案件搜尋</a> <a
							class="J_menuItem" href="/info360/setting">設定</a> <a
							class="J_menuItem" href="/info360/password">修改密碼</a> <a
							href="login.html">登出</a> <a class="J_menuItem" href="chat1"
							id="chat1">0912345678</a> <a class="J_menuItem" href="chat2"
							id="chat2">0987654321</a>
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
				src="/info360/dashboard" frameborder="0"
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
					<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
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
						onclick="rejectEvent">拒絕</button>
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
					<h3>帳號或密碼錯誤，請點選確定重新登入</h3>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal"
						onclick="javascript:window.location.href='console'">確定</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 全局js -->
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="resources/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script src="resources/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="resources/js/plugins/layer/layer.min.js"></script>

	<!-- 自定义js -->
	<script src="resources/js/hplus.js?v=4.1.0"></script>
	<script type="text/javascript" src="resources/js/contabs.js"></script>

	<!-- 第三方插件 -->
	<script src="resources/js/plugins/pace/pace.min.js"></script>

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

		var layim; // Layim

		var userName = '${userName}';
		var password = '${password}';

		var waittingClientIDList_g = []; //20170220 Lin

		var chatTab = [ "chat1", "chat2", "chat3", "chat4", "chat5" ];
		var chatList = []; // 20170220 Billy 聊天頁籤控制清單

		var maxCount = 0;
		var currentUserData = "";

		// Step-0 
		loginValidate();

		// 帳號密碼驗證
		function loginValidate() {
			$
					.ajax({
						url : "http://ws.crm.com.tw:8080/Info360_Setting/RESTful/Login",
						data : {
							account : userName,
							password : password
						},
						type : "POST",
						dataType : 'json',
						error : function(e) {
							console.log("請重新整理");
						},
						success : function(data) {
							console.log("login", data)

							// 測試用必驗證過
// 							doConnect();

							if (userName == "" || password == "") {
								// 未輸入帳號與密碼
								console.log(data.error)
								$("#loginDialogButton").trigger("click");
							} else if (data.error != null) {
								// 其他可能錯誤
								console.log(data.error);
								$("#loginDialogButton").trigger("click");
							} else {
								// 驗證通過
								//console.log(JSON.stringify(data));
								maxCount = data.person[0].max_count;
								//console.log(data.person[0].max_count);
								
								// Step-1 載入時連線ws
								doConnect();
							}

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
			//var $f = $("#myIFrame");
			//$f[0].contentWindow.MyFunction();
			closeCurrentTab();
		}

		// 連線&&登入
		function doConnect() {
			var hostname = "ws.crm.com.tw";
			ws = new WebSocket('ws://' + hostname + ':8888');

			ws.onopen = function() {
				console.log('websocket 打開成功');

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
						// 取得UserId
						UserID_g = obj.from;

						// 更新導覽列名稱
						$("#navNickName").html("Hi " + userName);

						// 變更線上狀態變數
						isonline = true;
						
						// 更新狀態
						var myUpdateStatusJson = new updateStatusJson("Agent",
								UserID_g, userName, "1", "no reason", "start");
						ws.send(JSON.stringify(myUpdateStatusJson));
					}

					// 接收到Client邀請chat的event
					if ("findAgentEvent" == obj.Event) {
						ClientName_g = obj.fromName;
						ClientID_g = obj.from;

						$("#inviteNumber").html(ClientName_g);
						$("#inviteDialogButton").trigger("click");
					}

					// 取得狀態
					if ("getUserStatus" == obj.Event) {
						// 結果為就緒
						if ("3" == obj.Status) {
							$("#statusButton button.status-ready").css(
									"display", "inline-block");
							$("#statusButton button.status-notready").css(
									"display", "none");
							// 結果為未就緒
						} else if ("4" == obj.Status) {
							$("#statusButton button.status-ready").css(
									"display", "none");
							$("#statusButton button.status-notready").css(
									"display", "inline-block");
						}
					}

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
						var UserName = obj.fromName
						roomId = RoomID_g;

						// 建立Layim名單
						console.log("acceptEvent");
						console.log(e);

						addLayimList(ClientName_g, UserName, roomId);

						// 更新開啟頁籤  & 組合客戶資料參數至後端
						var newTab = {};
						var currentChatTab = chatTab[0]; // 指派目前可用Tab
						chatTab.slice(1);

						newTab.id = RoomID_g;
						newTab.chatTab = currentChatTab;
						chatList.push(newTab);

						console.log("currentUserData");
						console.log(currentUserData);

						var id = currentUserData.CustomerData[0].id;
						var name = currentUserData.CustomerData[0].name;
						var address = currentUserData.CustomerData[0].CUSTNAM;

						$("#" + currentChatTab).html(id);
						var newHref = "chat1?id=" + id;
						newHref += "&name=" + name;
						newHref += "&address=" + address;

						$("#" + currentChatTab).prop("href", newHref);
						$("#" + currentChatTab).trigger("click");

						// 更新狀態
						var myUpdateStatusJson = new updateStatusJson("Agent",
								UserID_g, UserName_g, "Established",
								"Established");
						ws.send(JSON.stringify(myUpdateStatusJson));

						// 取得狀態
						getStatus();
					}

					// 接受訊息控制
					if ("messagetoRoom" == obj.Event) {
						// 判斷是否有開啟layim與是否為自己傳送的訊息
						if (true == layimswitch && obj.id != UserID_g) {
							// 將收到訊息顯示到layim上
							console.log("sendmessage");
							getclientmessagelayim(obj.text, obj.roomID,
									obj.UserName);
						}
					}

					if ("removeUserinroom" == obj.Event) {
						var fromUserId = obj.fromUserID;
						var roomID = obj.roomID

						layim.removeList({
							type : 'group',
							id : roomID
						//好友或者群组ID
						});
					}
				} else if ("{" != e.data.substring(0, 1)) {
					console.log(e);

					// 非指令訊息
					if (e.data.indexOf("Offline") > 0
							&& e.data.indexOf(userName) > 0) {
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

		// 登入
		function doLogin() {
			var now = new Date();
			
			// 向websocket送出登入指令
			var msg = {
				type : "login",
				UserName : userName,
				MaxCount : '3', //需從驗證登入頁面取得個人的max count並塞入
				ACtype : "Agent",
				channel : "chat",
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};
			// 發送消息
			ws.send(JSON.stringify(msg));

		}

		// 登出
		function logout() {
			// 向websocket送出登出指令
			var now = new Date();
			var msg = {
				type : "Exit",
				// text: message,
				id : UserID_g,
				UserName : userName,
				channel : "chat",
				waittingClientIDList : waittingClientIDList_g, //20170220 Lin
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
			// 向websocket送出變更狀態至準備就緒指令
			var myUpdateStatusJson = new updateStatusJson("Agent", UserID_g,
					userName, "3", "ready");
			ws.send(JSON.stringify(myUpdateStatusJson));

			// 取得狀態
			getStatus();
		}

		// Agent尚未準備就緒
		function agentNotReady() {
			// 更新狀態
			updateStatus("4", "no reason");
			// 取得狀態
			getStatus();

		}

		// 取得Agent狀態
		function getStatus() {
			console.log("getStatus");
			// 向websocket送出取得Agent狀態指令
			var now = new Date();
			var Eventmsg = {
				type : "getUserStatus",
				ACtype : "Agent",
				id : UserID_g,
				UserName : userName,
				channel : 'chat',
				date : now.getHours() + ":" + now.getMinutes() + ":"
						+ now.getSeconds()
			};
			// 發送消息
			ws.send(JSON.stringify(Eventmsg));
		}

		// 只有再aStatus狀態為not ready時,才會傳入aReason參數
		function updateStatus(aStatus, aReason) {
			// 向websocket送出變更狀態至未就緒指令
			var now = new Date();
			var updateAgentStatusmsg = {
				type : "updateStatus",
				ACtype : "Agent",
				id : UserID_g,
				UserName : userName,
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

			document.getElementById("AcceptEvent").disabled = true;
			document.getElementById("RejectEvent").disabled = true;
		}

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
		function addLayimList(ClientName, UserName, roomId) {
			layui.use('layim', function(layim) {
				layim.addList({
					type : 'group',
					username : ClientName + "," + UserName,
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
		}

		// 傳送群組訊息至layim視窗上
		function sendtoRoomonlay(text) {
			var myMessagetoRoomJson = new messagetoRoomJson("messagetoRoom",
					"Client", text, UserID_g, userName, RoomID_g, "chat", "");

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

			// 清除layim群聊
			layim.removeList({
				type : 'group',
				id : aRoomID
			});

			// 切換至該客戶資訊頁面
			chatList.forEach(function(entry) {
				if (aRoomID == entry.id) {
					$("#" + entry.chatTab).trigger("click");
					$('[name=iframe4]')[0].contentWindow.showCaseInfoTab();
				}
			});
		}

		function closeCurrentTab() {
			$(".page-tabs-content > .active > i").trigger("click");
		}

		/*-------------------------------------------------------*/
		$("#statusButton").on(
				"click",
				function() {
					var statusReady = $("#statusButton button.status-ready")
							.css("display");

					if (statusReady && statusReady == "inline-block") {
						agentNotReady();
					} else {
						agentReady();
					}
				});

		function openTab(order) {
			$("#menuItemList>a:eq(" + order + ")").trigger("click");
		}

		function showCloseDialog() {
			$("#closeRoomId").html(RoomID_g);
			$("#closeDialogButton").trigger("click");
		}

		//var displayStatus = $("#layui-layer100001").css("display");
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
											url : 'http://ws.crm.tw:8080/JAXRS-FileUpload/rest/upload/images' //（返回的数据格式见下文）
										//,type : '' //默认post
										},
										uploadFile : {
											url : 'http://ws.crm.tw:8080/JAXRS-FileUpload/rest/upload/files' //（返回的数据格式见下文）
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
										//,notice: true //是否开启桌面消息提醒，默认false
										//,voice: false //声音提醒，默认开启，声音文件为：default.wav
										,
										msgbox : 'layui/demo/msgbox.html' //消息盒子页面地址，若不开启，剔除该项即可
										,
										find : 'layui/demo/find.html' //发现页面地址，若不开启，剔除该项即可
										,
										chatLog : 'layui/demo/chatLog.html' //聊天记录页面地址，若不开启，剔除该项即可

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

								// 傳送群組訊息至layim視窗上
								sendtoRoomonlay(data.mine.content);

								if (To.type === 'friend') {
									//layim.setChatStatus('<span style="color:#FF5722;">对方正在输入。。。</span>');
								}

							});

							//监听查看群员
							layim.on('members', function(data) {
								console.log(data);
							});

							//监听聊天窗口的切换
							layim.on('chatChange', function(res) {
								var type = res.data.type;
								console.log(res);

								chatList
										.forEach(function(entry) {
											if (res.data.id == entry.id) {
												$("#" + entry.chatTab).trigger(
														"click");
											}
										});

								if (type === 'friend') {

								} else if (type === 'group') {

								}
							});

							$('.site-demo-layim').on('click', function() {
								var type = $(this).data('type');
								active[type] ? active[type].call(this) : '';
							});

							$("#userNickName").html(userName);

							// 開啟傳送layim參數
							layimswitch = true;
						});
	</script>

</body>
</html>