<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="../../common/init.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>Chat頁面-05</title>

<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">
<link href="resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">

</head>
<body class="gray-bg">
	<div class="widget">
		<!-- 左側資訊區 Start-->
		<div id="leftTab" style="width: 220px; float: left; margin-left: 5px;">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel panel-heading">
					<h3>
						<i class="fa fa-angle-double-right"></i>客戶資料
					</h3>
				</div>

				<ul class="nav nav-pills default" id="rightTab">
					<li class="active"><a href="#leftTab_1_1" data-toggle="tab">基本資料</a></li>
					<li><a href="#leftTab_1_2" data-toggle="tab">常用連結 </a></li>
					<li><a href="#leftTab_1_3" data-toggle="tab" id="caseInfoTab">案件資訊
					</a></li>
				</ul>

				<div class="tab-content rightTab">
					<div class="tab-pane fade active in" id="leftTab_1_1">
						<div class="portlet">
							<div class="list-group customerInfo">
								<a href="#" class="list-group-item gray-bg">
									<h4>INFORMATION</h4>
								</a> <a href="#" class="list-group-item" style="display: none;">
									<h4>interactionId</h4>
									<h4 id="interactionId">${interactionId}</h4>
								</a>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="leftTab_1_2">
						<div class="portlet">
							<div class="portlet-body">
								<div class="widget">
									<div class="fa-tree-list" id="commonLinkRoot"
										style="font-size: 14px;"></div>
								</div>

							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="leftTab_1_3">
						<div class="portlet">
							<div class="portlet-body">
								<div class="input-group">
									<div class="col-xs-12">案件編號</div>
									<div class="col-xs-12">
										<input type="text" value="${interactionId}">
									</div>
								</div>
								<div class="input-group">
									<div class="col-xs-12">處理人</div>
									<div class="col-xs-12">
										<input type="text" id="caseUserName" value="">
									</div>
								</div>
								<div class="input-group">
									<div class="col-xs-12">案件類別</div>
									<div class="col-xs-12">
										<select class="selectpicker" id="caseSelection"
											style="width: 127px; padding: 2px 0px 2px 0px;">

										</select>

										<button class="btn-success" onclick="showCaseInfo()">註記</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 左側資訊區 End-->

		<!-- 右側主要功能區 Start-->
		<div class="row" id="rightContentTab"
			style="margin-left: 235px; margin-right: 5px;">

			<div class="col-sm-12 col-lg-12 col-md-12 panel panel-success"
				style="height: 780px; min-width: 500px; overflow-x: scroll;">
				<div style="margin: 1px 0px 0px 1px;" id="linkButton">
					<button class="btn-sm btn-warning"
						style="float: left; margin-left: -5px; margin-right: 5px;"
						onclick="leftTabToggle()" id="tabToggleButton">
						<i class="fa fa-lg fa-arrow-left" id="leftTabToggleButton"></i>
					</button>
					<button class="btn-sm btn-success" onclick="showHistoryQuery()"
						id="queryButton">
						<i class="fa fa-lg fa-user"></i> <span>歷史資料</span>
					</button>
					<button class="btn-sm btn-success" style="display: none;"
						id="caseInfoButton">
						<span onclick="showCaseInfo()">服務代碼</span> <i class="fa fa-times"
							onclick="closeCaseInfo()"></i>
					</button>
				</div>

				<!-- 右側内容區塊 Start -->
				<div id="content">
					<!-- 歷史資料Start -->
					<div class="panel-body" id="historyQuery">
						<!-- 搜尋條件區 Start -->
						<div class="row ibox">
							<div class="col-lg-6 col-md-6">
								<div class="input-group">
									<span class="input-group-addon">日期</span>
									<div class="input-daterange input-group" id="datepicker">
										<input type="text" class="input-sm form-control" name="start"
											value=""> <span class="input-group-addon">到</span> <input
											type="text" class="input-sm form-control" name="end" value="">
									</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-3">
								<div class="input-group">
									<span class="input-group-addon">處理人</span> <input type="text"
										class="form-control" placeholder="請輸入處理人" id="inputAgentId">
								</div>
							</div>
							<!-- 
						<div class="col-lg-3 col-md-3">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">客戶ID</span> <input
									type="text" class="form-control" placeholder="請輸入ID"
									aria-describedby="basic-addon1">
							</div>
						</div>
						 -->
							<div class="col-lg-3 col-md-3">
								<button class="btn-sm btn-success" onclick="search()"
									id="searchButton">搜尋</button>
								<button class="btn-sm btn-danger">取消</button>
							</div>
						</div>
						<!-- 
					<div class="row ibox">
						
						<div class="col-lg-9 col-md-9">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">主旨</span> <input
									type="text" class="form-control" placeholder="請輸入"
									aria-describedby="basic-addon1">
							</div>
						</div>
						 
						<div class="col-lg-3 col-md-3">
							<button class="btn-sm btn-success">搜尋</button>
							<button class="btn-sm btn-danger">取消</button>
						</div>
						
					</div>
					-->
						<!-- 搜尋條件區 End -->

						<div class="row ibox">
							<div class="col-lg-12 col-md-12">
								<table class="table table-striped table-bordered table-hover"
									id="queryTable">
									<thead>
										<tr>
											<th>開始時間</th>
											<th>結束時間</th>
											<th>來源</th>
											<th>處理人</th>
											<th>服務代碼</th>
											<th>備註</th>
										</tr>
									</thead>
									<tbody></tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- 歷史資料End -->

					<!-- 案件資訊專區 Start -->
					<div class="panel-body panel-success" id="caseInfo"
						style="display: none;">
						<div id="exTab1" class="tab-container">
							<ul class="nav nav-tabs" id="caseInfoLevel1">
							</ul>

							<div class="tab-content clearfix" id="caseInfoLevel1TabContent">
								<!-- 保留最後一個Tab為通話紀錄-->
								<div class="tab-pane" id="caseInfo99">
									<div id="chatRecord" class="widget"
										style="height: 600px; overflow-y: scroll;">
										<div class="row">
											<div class="col-xs-3" id="selectActivityData"></div>
											<div class="col-xs-9">
												<textarea id="theComment"
													style="height: 560px; width: 100%;"></textarea>
											</div>
										</div>
									</div>

								</div>
								<!-- 保留最後一個Tab為通話紀錄-->

								<div class="tab-pane active" id="caseInfo0">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo1">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo2">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo3">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo4">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo5">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo6">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo7">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo8">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
								<div class="tab-pane" id="caseInfo9">
									<div style="height: 600px; overflow-y: scroll;"></div>
								</div>
							</div>
						</div>
						<div class="panel gray-bg">
							<div style="font-size: 14px; padding: 5px; text-align: right;">
								<span style="display: none;"> <span
									style="margin: 0px 10px 0px 10px;"> <input
										type="checkbox"> 外撥
								</span> <span style="margin: 0px 10px 0px 10px;"> <input
										type="checkbox"> 來電提示
								</span> <span style="margin: 0px 10px 0px 10px;"> <input
										type="checkbox"> 抱怨
								</span> <span style="margin: 0px 10px 0px 10px;"> <input
										type="checkbox"> 離席
								</span> <span style="margin: 0px 10px 0px 10px;"> <input
										type="checkbox"> 黑名單
								</span>
								</span> <span style="margin: 0px 10px 0px 10px;">
									<button class="btn btn-sm btn-success" onclick="finishChat()">服務完成</button>
								</span>
							</div>
						</div>
					</div>
					<!-- 案件資訊專區 End-->
				</div>
				<!-- 右側内容區塊 End -->

			</div>
		</div>
	</div>

</body>



<!-- 全局js -->
<script src="resources/js/jquery.min.js?v=2.1.4"></script>
<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>

<!-- Data Tables -->
<script src="resources/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- DataPicker -->
<script src="resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>

<!-- bootstrap_treeview -->
<script src="resources/js/plugins/treeview/bootstrap-treeview.js"></script>

<script>
	var agentId = parent.UserID_g;

	$(document).ready(function() {
		// 案件資訊處理人
		console.log(parent.UserName_g);
		$("#caseUserName").val(parent.UserName_g);

		// 載入常用連結
		selectCommonLink();

		// 搜尋案件類別
		Query_ActivityMenu(0, 0);

		// 取得客戶資料
		getUserData();

		// init datepicker
		$("#datepicker").datepicker({
			format : 'yyyy-mm-dd',
			endDate : '0d'
		});

		// default search and initdataTable
		var opt = {
			"bLengthChange" : false,
			"iDisplayLength" : 15
		};

		$('#queryTable').DataTable(opt);
		$("#queryTable").css("width", "100%");

		quickSearchByTime(0);
	});

	// 取得左側客戶資料
	function getUserData() {
		var parentChatList = parent.chatList;
		var interactionId = "${interactionId}";

		for ( var index in parentChatList) {
			console.log(parentChatList[index]);

			if (parentChatList[index].id == interactionId) {
				var userData = parentChatList[index].currentUserData;
				var mapping = userData.mapping.Message;
				var mappingSorted = {};

				Object.keys(mapping).sort(function(a, b) {
					return mapping[a].sort - mapping[b].sort
				}).forEach(function(key) {
					mappingSorted[mapping[key].sort] = mapping[key];
					mappingSorted[mapping[key].sort].key = key;
				});

				console.log("mappingSorted : ");
				console.log(mappingSorted);

				for ( var count in mappingSorted) {
					var $a = '<a href="#" class="list-group-item">';
					$a += '<h4>' + mappingSorted[count].chiname + '</h4>';
					$a += '<h4 id="customer'
							+ mappingSorted[count].key.toLowerCase() // Billy 改為由key值作為id選擇器參照
							+ '"></h4>';
					$a += '</a>';

					$("div.customerInfo").append($a);
				}

				// 因客戶資料不一定會傳入，因此需先判斷是否有內容
				if (userData.CustomerData) {
					var customerData = userData.CustomerData[0];

					for ( var key in customerData) {
						var id = key
						$('#customer' + key.toLowerCase()).html(
								customerData[key]);
					}
				}
			}
		}

		// 重新綁定點選複雜事件
		$(".customerInfo a").on("click", function() {
			var copyText = $(this).find(':nth-child(2)').text();
			var $temp = $("<input>");

			$("body").append($temp);
			$temp.val(copyText).select();
			document.execCommand("copy");
			$temp.remove();
		});
	}

	/**
	 * 常用連結功能與Tab切換控制
	 */
	function selectCommonLink() {
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Select_commonlink",
					data : {

					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						console.log("請重新整理");
					},
					success : function(data) {
						var linkList = data.Tree;
						var $root = $("#commonLinkRoot");
						$root.html("");
						var $ul = $("#commonLinkRoot > ul");
						var secondLevel = [];
						var linkIndex = 1;

						for ( var index in linkList) {
							var parent = linkList[index].parent;
							var $span = '<ul style="list-style-type:none;margin-left:-20px;"><li><span>';

							if ("#" == parent) {
								var href = linkList[index].a_attr.href;
								var id = linkList[index].id;
								var text = linkList[index].text;

								$span += '<i class="fa fa-fw fa-folder-open">';
								$span += text;
								$span += '</span>';
								$span += '<ul style="list-style-type:none;margin-left:-20px;" dbid="' + id + '" level=0>';
								$span += '</ul></li></ul>';

								$root.append($span);
							} else {
								secondLevel.push(linkList[index]);
							}
						}

						for ( var index in secondLevel) {
							var parent = secondLevel[index].parent;
							var text = secondLevel[index].text;
							var id = secondLevel[index].id;
							var level = parseInt($('ul[dbid="' + parent + '"]')
									.attr("level"));
							if (secondLevel[index].a_attr) {
								var href = secondLevel[index].a_attr.href || "";
							}

							if (2 != level) {
								$li = '<li><span><i class="fa fa-fw fa-folder-open"></i>';
								$li += text;
								$li += '</span>';
								$li += '<ul style="list-style-type:none;margin-left:-20px;" dbid="'
										+ id
										+ '" level='
										+ (level + 1)
										+ '></ul>';
								$li += '</li>';
							} else if (2 == level) {
								$li = '<li><span onclick="showLink('
										+ linkIndex + ')">';
								$li += '<i class="fa fa-fw fa-file-text-o"></i>';
								$li += text;
								$li += '</span>';
								$li += '<ul style="list-style-type:none;margin-left:-20px;" dbid="'
										+ id
										+ '" level='
										+ (level + 1)
										+ '></ul>';
								$li += '</li>';

								generateLink(linkIndex, text, href);

								linkIndex++;
							}

							$('ul[dbid="' + parent + '"]').append($li);
						}

						turnListOn();
					}
				});
	}

	function generateLink(linkIndex, text, href) {

		href = href.replace("https", "http");
		// 產生按鈕
		var $button = '<button class="btn-sm btn-success" style="display:none;margin-right:5px;" id="linkButton' + linkIndex+ '" >';
		$button += '<span onclick="showLink(' + linkIndex + ')">' + text
				+ '</span>';
		$button += '<i class="fa fa-times" onclick="closeLink(' + linkIndex
				+ ')"></i>';
		$button += '</button>';

		$("#linkButton").append($button);

		// 產生iframe內容
		var $content = $("#content");
		var $div = '<div class="panel-body" id="link' + linkIndex + '" style="display:none;">';
		$div += '<iframe src="' + href
				+ '" style="width:100%;min-height:750px;"></iframe>';
		$div += '</div>';

		$content.append($div);
	}

	function showHistoryQuery() {
		// 按鈕處理
		clearLinkStyle();
		$("#queryButton").removeClass("btn-success");
		$("#queryButton").addClass("btn-primary");

		hideAllContent();
		$("#historyQuery").show();
	}

	function showCaseInfo() {
		// 按鈕處理
		clearLinkStyle();
		$("#caseInfoButton").removeClass("btn-success");
		$("#caseInfoButton").addClass("btn-primary");

		// 內容處理
		hideAllContent()
		$("#caseInfoButton").show();
		$("#caseInfo").show();

		// 搜尋案件資訊選單
		var level1DbId = $("#caseSelection option:selected").val();
		Query_ActivityMenu(1, level1DbId);
	}

	function showLink(linkIndex) {
		// 按鈕處理
		clearLinkStyle();

		$("#linkButton" + linkIndex).show();
		$("#linkButton" + linkIndex).removeClass("btn-success");
		$("#linkButton" + linkIndex).addClass("btn-primary");

		// 內容處理
		hideAllContent()
		$("#link" + linkIndex).show();
	}

	function closeLink(linkIndex) {
		// 按鈕處理
		clearLinkStyle();
		$("#linkButton" + linkIndex).hide();
		$("#queryButton").removeClass("btn-success");
		$("#queryButton").addClass("btn-primary");

		// iframe 重新載入
		var src = $('#link' + linkIndex + ' iframe').prop("src");
		$('#link' + linkIndex + ' iframe').prop("src", "");
		$('#link' + linkIndex + ' iframe').prop("src", src);

		hideAllContent()
		$("#historyQuery").show();
	}

	function closeCaseInfo() {
		clearLinkStyle();
		$("#queryButton").removeClass("btn-success");
		$("#queryButton").addClass("btn-primary");
		$("#caseInfoButton").hide();

		hideAllContent()
		$("#historyQuery").show();
	}

	function hideAllContent() {
		$("#content>div").hide();
	}

	function clearLinkStyle() {
		$("#linkButton button").removeClass("btn-primary");
		$("#linkButton button").addClass("btn-success");
		//$("#queryButton").addClass("btn-success");
		//$("#caseInfoButton").addClass("btn-success");
	}

	/* tree list controll */
	function turnListOn() {
		/* tree list controll */
		$(".fa-tree-list>span")
				.on(
						"click",
						function() {
							if ($(".fa-tree-list>span>i").hasClass(
									"fa-folder-open")) {
								// toggle icon
								$(".fa-tree-list>span>i").removeClass(
										"fa-folder-open");
								$(".fa-tree-list>span>i").addClass("fa-folder");

								$(".fa-tree-list ul").hide();
							} else if ($(".fa-tree-list>span>i").hasClass(
									"fa-folder")) {
								// toggle icon
								$(".fa-tree-list>span>i").removeClass(
										"fa-folder");
								$(".fa-tree-list>span>i").addClass(
										"fa-folder-open");

								$(".fa-tree-list ul").show();
								$(".fa-tree-list>ul>li>span").find("i")
										.removeClass("fa-folder-open");
								$(".fa-tree-list>ul>li>span").find("i")
										.addClass("fa-folder");
								$(".fa-tree-list ul li").find("ul").hide();
							}
						});

		$(".fa-tree-list>ul>li>span").on("click", function() {
			if ($(this).find("i").hasClass("fa-folder-open")) {
				// toggle icon
				$(this).find("i").removeClass("fa-folder-open");
				$(this).find("i").addClass("fa-folder");

				$(this).parent().find("ul").hide();

			} else if ($(this).find("i").hasClass("fa-folder")) {
				// toggle icon
				$(this).find("i").removeClass("fa-folder");
				$(this).find("i").addClass("fa-folder-open");

				$(this).parent().find("ul").show();
			}

		});

		$(".fa-tree-list>ul>li>ul>li>span").on("click", function() {
			if ($(this).find("i").hasClass("fa-folder-open")) {
				// toggle icon
				$(this).find("i").removeClass("fa-folder-open");
				$(this).find("i").addClass("fa-folder");

				$(this).parent().find("ul").hide();

			} else if ($(this).find("i").hasClass("fa-folder")) {
				// toggle icon
				$(this).find("i").removeClass("fa-folder");
				$(this).find("i").addClass("fa-folder-open");

				$(this).parent().find("ul").show();
			}

		});

		$(".fa-tree-list>ul>li>ul>li>ul>li>span").on("click", function() {
			if ($(this).find("i").hasClass("fa-folder-open")) {
				// toggle icon
				$(this).find("i").removeClass("fa-folder-open");
				$(this).find("i").addClass("fa-folder");

				$(this).parent().find("ul").hide();

			} else if ($(this).find("i").hasClass("fa-folder")) {
				// toggle icon
				$(this).find("i").removeClass("fa-folder");
				$(this).find("i").addClass("fa-folder-open");

				$(this).parent().find("ul").show();
			}

		});
	}

	$(".customerInfo a").on("click", function() {
		var copyText = $(this).find(':nth-child(2)').text();
		var $temp = $("<input>");

		$("body").append($temp);
		$temp.val(copyText).select();
		document.execCommand("copy");
		$temp.remove();
	});

	$("#tabToggleButton").on("mouseover", function() {
		//leftTabToggle();
	});

	function leftTabToggle() {
		var isOpen = $("#leftTabToggleButton").hasClass("fa-arrow-left");

		if (isOpen) {
			$("#leftTabToggleButton").removeClass("fa-arrow-left");
			$("#leftTabToggleButton").addClass("fa-arrow-right");

			$("#rightContentTab").animate({
				"margin-left" : '5px'
			});

			$("#leftTab").animate({
				"margin-left" : '-230px'
			});
		} else {
			$("#leftTabToggleButton").removeClass("fa-arrow-right");
			$("#leftTabToggleButton").addClass("fa-arrow-left");

			$("#rightContentTab").animate({
				"margin-left" : '235px'
			});

			$("#leftTab").animate({
				"margin-left" : '5px'
			});
		}
	}

	/** 
	 * 案件資訊專區
	 */
	function Query_ActivityMenu(level, dbId) {
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query_ActivityMenu",
					data : {
						dbid : dbId
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						console.log("請重新整理");
					},
					success : function(data) {
						// 搜尋第零階原始案件類別選項
						if (0 == level) {
							var $caseSelection = $("#caseSelection");
							$caseSelection.html("");

							for ( var index in data.activitymenu) {
								var menuName = data.activitymenu[index].menuname;
								var dbid = data.activitymenu[index].dbid;

								$caseSelection
										.append("<option value='" + dbid +"'>"
												+ menuName + "</option");
							}
						} else if (1 == level) {
							var $ul = $("#caseInfoLevel1");
							$ul.html("");
							$("#caseInfo" + index).html("");

							if (0 == data.activitygroups.length) {
								$(
										"#caseInfoLevel1TabContent > .tab-pane.active")
										.removeClass("active");
								$("#caseInfo99").addClass("active");
								$ul
										.append('<li><a href="#caseInfo99" data-toggle="tab">通話紀錄</a></li>');
							} else {
								$("#caseInfo99").removeClass("active");
								$("#caseInfo0").addClass("active");

								for ( var index in data.activitygroups) {
									var groupname = data.activitygroups[index].groupname;
									var dbid = data.activitygroups[index].dbid;

									if (0 == index) {
										var $li = "<li class='active'><a href='#caseInfo" + index + "'";
                                        $li += " data-toggle='tab'>"
												+ groupname + "</a></li>";
									} else {
										var $li = "<li><a href='#caseInfo" + index + "'";
                                        $li += " data-toggle='tab'>"
												+ groupname + "</a></li>";
									}

									$ul.append($li);

									//console.log($("#caseInfo" + index));
									if (0 == $("#caseInfo" + index).length) {
										var caseInfoDiv = '<div class="tab-pane" id="caseInfo' + index + '"><div style="height: 600px; overflow-y: scroll;"></div></div>'

										$("#caseInfoLevel1TabContent").append(
												caseInfoDiv);
									}

									Flag_Data(dbid, index);
								}

								$ul
										.append('<li><a href="#caseInfo99" data-toggle="tab">通話紀錄</a></li>');
							}

						}
					}
				});
	}

	function Flag_Data(dbId, tabIndex) {
		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/FLAGDATA",
					data : {
						dbid : dbId
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						console.log("請重新整理");
					},
					success : function(data) {
						var targetTable = $("#caseInfo" + tabIndex + " > div");
						targetTable.html("");
						console.log(data);
						// 重新將acitivitydata與flag組成巢狀結構
						var titleList = [];

						for ( var index in data.Flag0) {
							var titleflag = data.Flag0[index].titleflag;

							if (1 == titleflag) {
								data.Flag0[index].dataList = [];
								titleList.push(data.Flag0[index]);
							}
						}

						for ( var index in data.Flag0) {
							var titleflag = data.Flag0[index].titleflag;
							var titlegroup = data.Flag0[index].titlegroup;

							if (0 == titleflag) {
								for ( var key in titleList) {
									if (titleList[key].dbid == titlegroup) {
										titleList[key].dataList
												.push(data.Flag0[index]);
									}
								}
							}
						}

						console.log("titleList");
						console.log(titleList);
						// 根據巢狀結構建立對應的表格
						for ( var index in titleList) {
							var $table = '<table class="table table-striped table-bordered table-hover" style="width:100%">';

							// 加入標題
							$table += '<thead><tr><td colspan="5"><b class="text-success">'
									+ titleList[index].codename
									+ '</b></td></tr></thead>';

							var dataList = titleList[index].dataList;
							var dataCount = 0;
							var $tbody = '<tr>';

							for ( var key in dataList) {
								$tbody += '<td sytle="width:20%">';
								$tbody += '<input class="activityLog" type="checkbox" value="'
										+ dataList[key].codename
										+ '" dbid ="'
										+ dataList[key].dbid
										+ '" onclick="getCheckedData();">';
								$tbody += dataList[key].codename + '</td>';

								if (dataCount % 5 == 4
										|| key == dataList.length - 1) {
									$tbody += "</tr>";
								}

								dataCount++;
							}

							$tbody += '</tbody>';
							$table += $tbody;

							$table += '</table>';
							targetTable.append($table);
						}
					}
				});
	}

	// 「案件資訊」點選checkbox畫面清單控制
	function getCheckedData() {
		var val = [];
		var dbid = [];

		$("#selectActivityData").html("");

		$('.activityLog:checked')
				.each(
						function(i) {
							val[i] = $(this).val();
							dbid[i] = $(this).attr("dbid");

							var activitydata = '<div class="selectData" style="margin: 15px;" dbid="' + dbid[i]+ '">';
							activitydata += '<span class="tag label label-default" style="padding: 5px;"><span>';
							activitydata += val[i];
							activitydata += '</span> <a><i class="fa fa-times" onclick="unckeckItem('
									+ dbid[i] + ')"></i></a></span></div>'

							$("#selectActivityData").append(activitydata);
						});
	}

	function unckeckItem(dbid) {
		$(".selectData[dbid=" + dbid + "]").remove();
		$(".activityLog[dbid=" + dbid + "]").prop("checked", false);
	}

	// 將「案件資訊」選取結果與備註欄發送至Server
	function insertRptActivityLog() {
		var interactionId = "${interactionId}";
		var theComment = $("#theComment").val() || "";
		var activitydataids = "";
		var dbid = [];

		$('.activityLog:checked').each(function(i) {
			dbid[i] = $(this).attr("dbid");

			if (0 == activitydataids.length) {
				activitydataids += dbid[i];
			} else {
				activitydataids += "," + dbid[i];
			}
		});

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Insert_rpt_activitylog",
					data : {
						interactionid : interactionId,
						activitydataids : activitydataids,
						comment : theComment
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						console.log("請重新整理");
					},
					success : function(data) {
						console.log("Insert_rpt_activitylog success");
						console.log(data);

						// 20170313_sam
						// 更新ACW結束時間 
						sendComment(interactionId, activitydataids, theComment);

						// 關閉目前使用頁籤
						var interactionId = "${interactionId}";
						parent.closeCurrentTab(interactionId);
					}
				});
	}

	// 通話結束，自動點選案件資訊，根據設定決定是否選取第一層清單
	function showCaseInfoTab() {
		$("#caseInfoTab").trigger("click");

		if (parent.autoSelectCaseInfo) {
			showCaseInfo();
		}
	}

	// 結束客戶資訊頁籤
	function finishChat() {
		// 新增案件資訊活動代碼紀錄
		insertRptActivityLog();
	}

	// 20170313_sam
	// 更新ACW結束時間 
	function sendComment(aInteractionid, aActivitydataids, aComment) {
		// 		alert("sendComment()");
		function sendCommentJson(aInteractionid, aActivitydataids, aComment) {
			this.type = "sendComment";
			this.interactionid = aInteractionid;
			this.activitydataids = aActivitydataids;
			this.comment = aComment;
		}
		// 寄送請求至WS
		var mySendCommentJson = new sendCommentJson(aInteractionid,
				aActivitydataids, aComment);
		parent.ws.send(JSON.stringify(mySendCommentJson));
	}
	// end of 20170313_sam

	/* 搜尋功能專區 */
	// 案件搜尋
	function search() {
		var start = $('#datepicker [name="start"]').val();
		var end = $('#datepicker [name="end"]').val();
		var id = $("#inputAgentId").val() || agentId;

		console.log("start : " + start + "; end : " + end + "; id :" + id);

		$('#queryTable').DataTable().destroy();
		$('#queryTable tbody').html("");

		$
				.ajax({
					url : "${IMWebSocket_protocol}//${IMWebSocket_hostname}:${IMWebSocket_port}/IMWebSocket/RESTful/Query",
					data : {
						startdate : start,
						enddate : end,
						agentid : id
					},
					type : "POST",
					dataType : 'json',

					error : function(e) {
						console.log("請重新整理");

					},
					success : function(data) {
						console.log(data);
						var queryData = data.data;

						for ( var index in queryData) {
							var agentName = queryData[index].Agentname;
							var codeName = queryData[index].Codename;
							var endd = queryData[index].Enddate;
							var startd = queryData[index].Startdate;
							var comment = queryData[index].Thecomment;
							var ixnId = queryData[index].ixnid;
							var src = queryData[index].src;

							var $tr = '<tr>';
							$tr += '<td>' + startd + '</td>';
							$tr += '<td>' + endd + '</td>';
							$tr += '<td>' + src + '</td>';
							$tr += '<td>' + agentName + '</td>';
							$tr += '<td>' + codeName + '</td>';
							$tr += '<td>' + comment + '</td>';
							$tr += '</tr>';

							$('#queryTable tbody').append($tr);
						}

						var opt = {
							"bLengthChange" : false,
							"iDisplayLength" : 15
						};

						$('#queryTable').DataTable(opt);
						$("#queryTable").css("width", "100%");
					}
				});
	}

	// 快速選取指定時間
	function quickSearchByTime(days) {
		var endDate = new Date();
		var year = endDate.getFullYear();
		var month = endDate.getMonth() + 1;
		var day = endDate.getDate();
		var endDateStr = addZeroLeft(year, 4) + "-" + addZeroLeft(month, 2)
				+ "-" + addZeroLeft(day, 2);

		if (0 == days) {
			var startDate = new Date(year, month - 1, day);
		} else if (7 == days) {
			var startDate = new Date(year, month - 1, day - 7);
		} else if (30 == days) {
			var startDate = new Date(year, month - 2, day);
		} else if (90 == days) {
			var startDate = new Date(year, month - 4, day);
		} else if (180 == days) {
			var startDate = new Date(year, month - 7, day);
		}

		year = startDate.getFullYear();
		month = startDate.getMonth() + 1;
		day = startDate.getDate();
		var startDateStr = addZeroLeft(year, 4) + "-" + addZeroLeft(month, 2)
				+ "-" + addZeroLeft(day, 2);

		$('#datepicker [name="start"]').datepicker("update", startDateStr);
		$('#datepicker [name="end"]').datepicker("update", endDateStr);

		search();
	}

	/*
	 * 左邊補0，用於日期或時間
	 * str: 要被補0的字串
	 * length: 要補多少個0
	 */
	function addZeroLeft(str, length) {
		str = str + '';

		if (str.length >= length) {
			return str;
		} else {
			return addZeroLeft("0" + str, length);
		}
	}
</script>

</html>