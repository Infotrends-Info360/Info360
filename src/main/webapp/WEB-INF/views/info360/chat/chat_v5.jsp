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
								</a> <a href="#" class="list-group-item">
									<h4>姓名</h4>
									<h4 id="fromName">${name}</h4>
								</a> <a href="#" class="list-group-item">
									<h4>住址</h4>
									<h4>${address}</h4>
								</a> <a href="#" class="list-group-item">
									<h4>專屬人員</h4>
									<h4>Alex</h4>
								</a> <a href="#" class="list-group-item">
									<h4>註冊地</h4>
									<h4>台北分公司</h4>
								</a> <a href="#" class="list-group-item">
									<h4>帳號狀態</h4>
									<h4>啟用</h4>
								</a> <a href="#" class="list-group-item">
									<h4>身份證字號</h4>
									<h4>${id}</h4>
								</a> <a href="#" class="list-group-item">
									<h4>性別</h4>
									<h4>男</h4>
								</a>
							</div>
						</div>
					</div>
					<div class="tab-pane fade" id="leftTab_1_2">
						<div class="portlet">
							<div class="portlet-body">
								<div class="widget">
									<div class="fa-tree-list">
										<span> <i class="fa fa-fw fa-folder-open"></i> 特別提示
										</span>

										<ul style="list-style-type: none; margin-left: -20px;">
											<li><span> <i class="fa fa-fw fa-folder-open"></i>
													最新專案
											</span>
												<ul style="list-style-type: none; margin-left: -20px;">
													<li onclick="clickLink1()"><i
														class="fa fa-fw fa-file-text-o"></i>優惠方案</li>
													<li onclick="clickLink2()"><i
														class="fa fa-fw fa-file-text-o"></i>週年慶大放送</li>
												</ul></li>
											<li class="active"><span> <i
													class="fa fa-fw fa-folder-open"></i> 軟體操作
											</span>
												<ul style="list-style-type: none; margin-left: -20px;">
													<li><i class="fa fa-fw fa-file-text-o"></i>知識管理</li>
													<li><i class="fa fa-fw fa-file-text-o"></i>考試系統</li>
													<li><i class="fa fa-fw fa-file-text-o"></i>客服代表應用</li>
												</ul></li>
											<li><span> <i class="fa fa-fw fa-folder"></i>
													硬體故障簡易處理
											</span>

												<ul
													style="list-style-type: none; display: none; margin-left: -20px;">
													<li><i class="fa fa-fw fa-file-text-o"></i>個人電腦</li>
													<li><i class="fa fa-fw fa-file-text-o"></i>交換機</li>
												</ul></li>
										</ul>
									</div>
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
				<div style="margin: 1px 0px 0px 1px;">
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
					<button class="btn-sm btn-success" style="display: none;"
						id="linkButton1">
						<span onclick="showLink1()">優惠方案</span> <i class="fa fa-times"
							onclick="closeLink(1)"></i>
					</button>

					<button class="btn-sm btn-success" style="display: none;"
						id="linkButton2">
						<span onclick="showLink2()">週年慶大放送</span> <i class="fa fa-times"
							onclick="closeLink(2)"></i>
					</button>
				</div>

				<div class="panel-body" id="historyQuery">
					<!-- 客戶資料Start -->
					<div class="row">
						<div class="col-lg-6 col-md-6 col-xs-12"
							style="margin-bottom: 2px;">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">日期</span>
								<div class="input-daterange input-group" id="datepicker">
									<input type="text" class="input-sm form-control" name="start"
										value="2014-11-11"> <span class="input-group-addon">到</span>
									<input type="text" class="input-sm form-control" name="end"
										value="2014-11-17">
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-xs-6"
							style="margin-bottom: 2px;">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">處理人</span> <input
									type="text" class="form-control" placeholder="請輸入處理人"
									aria-describedby="basic-addon1">
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-xs-6">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">客戶ID</span> <input
									type="text" class="form-control" placeholder="請輸入ID"
									aria-describedby="basic-addon1">
							</div>
						</div>

						<div class="col-lg-9 col-md-9 col-xs-8"
							style="margin-bottom: 2px;">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">主旨</span> <input
									type="text" class="form-control" placeholder="請輸入"
									aria-describedby="basic-addon1">
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-xs-4"
							style="margin-bottom: 2px;">
							<button class="btn-sm btn-success">搜尋</button>
							<button class="btn-sm btn-danger">取消</button>
						</div>

						<div class="col-lg-12 col-md-12 col-xs-12">
							<table class="table table-striped table-bordered table-hover"
								id="queryTable">
								<thead>
									<tr>
										<td>欄位1</td>
										<td>欄位2</td>
										<td>欄位3</td>
										<td>欄位4</td>
										<td>欄位5</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
									<tr>
										<td>Chrome</td>
										<td>IE</td>
										<td>FireFox</td>
										<td>Safari</td>
										<td>Netscape</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- 客戶資料End -->

				<!-- 常用連結專區 Start-->
				<div class="panel-body" id="link1" style="display: none;">
					<iframe src="http://www.crm.com.tw/"
						style="width: 100%; min-height: 400px;"></iframe>
				</div>

				<div class="panel-body" id="link2" style="display: none;">
					<iframe src="http://www.pchome.com"
						style="width: 100%; min-height: 400px;"></iframe>
				</div>
				<!-- 常用連結專區 End-->

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
											<textarea id="theComment" style="height: 560px; width: 100%;"></textarea>
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
							<span style="display:none;"> 
								<span style="margin: 0px 10px 0px 10px;"> <input
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
							</span> 
							
							<span style="margin: 0px 10px 0px 10px;">
								<button class="btn btn-sm btn-success" onclick="finishChat()">服務完成</button>
							</span>
						</div>
					</div>
				</div>
				<!-- 案件資訊專區 End-->

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
	$(document).ready(function() {
		// init datepicker
		$("#datepicker").datepicker();
		// init datatable
		$("#queryTable").DataTable();
		$("#queryTable").css("width", "100%");

		// 案件資訊處理人
		console.log(parent.UserName_g);
		$("#caseUserName").val(parent.UserName_g);

		// 搜尋案件類別
		Query_ActivityMenu(0, 0);
	});

	function queryActivityMenu() {
		$
				.ajax({
					url : "http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Query_ActivityMenu",
					data : {
						dbid : 0
					},
					type : "POST",
					dataType : 'json',
					error : function(e) {
						console.log(e);
					},
					success : function(data) {
						console.log(data)

						for ( var index in data.activitymenu) {
							console.log(data.activitymenu[index].menuname);
						}
					}
				});
	}

	function clickLink1() {
		$("#linkButton1").show();
		showLink1();
	}

	function clickLink2() {
		$("#linkButton2").show();
		showLink2();
	}

	function showHistoryQuery() {
		hideAll();
		$("#historyQuery").show();

		clearLinkStyle();
		$("#queryButton").removeClass("btn-success");
		$("#queryButton").addClass("btn-primary");
	}

	function showLink1() {
		hideAll();
		$("#link1").show();

		clearLinkStyle();
		$("#linkButton1").removeClass("btn-success");
		$("#linkButton1").addClass("btn-primary");
	}

	function showLink2() {
		hideAll();
		$("#link2").show();

		clearLinkStyle();
		$("#linkButton2").removeClass("btn-success");
		$("#linkButton2").addClass("btn-primary");
	}

	function showCaseInfo() {
		// 畫面控制
		hideAll();
		$("#caseInfoButton").show();
		$("#caseInfo").show();

		clearLinkStyle();
		$("#caseInfoButton").removeClass("btn-success");
		$("#caseInfoButton").addClass("btn-primary");

		// 搜尋案件資訊選單
		var level1DbId = $("#caseSelection option:selected").val();
		Query_ActivityMenu(1, level1DbId);
	}

	function clearLinkStyle() {
		$("#queryButton").removeClass("btn-primary");
		$("#queryButton").addClass("btn-success");
		$("#linkButton1").removeClass("btn-primary");
		$("#linkButton1").addClass("btn-success");
		$("#linkButton2").removeClass("btn-primary");
		$("#linkButton2").addClass("btn-success");
		$("#caseInfoButton").removeClass("btn-primary");
		$("#caseInfoButton").addClass("btn-success");
	}

	function closeLink(number) {
		if (number == '1') {
			$("#linkButton1").hide();
			$("#link1").hide();
		} else if (number == '2') {
			$("#linkButton2").hide();
			$("#link2").hide();
		}

		clearLinkStyle();
		$("#historyQuery").show();
	}

	function closeCaseInfo() {
		$("#caseInfoButton").hide();
		$("#caseInfo").hide();

		clearLinkStyle();
		$("#historyQuery").show();
	}

	function hideAll() {
		$("#historyQuery").hide();
		$("#link1").hide();
		$("#link2").hide();
		$("#caseInfo").hide();
	}

	/* tree list controll */
	$(".fa-tree-list>span").on(
			"click",
			function() {
				if ($(".fa-tree-list>span>i").hasClass("fa-folder-open")) {
					// toggle icon
					$(".fa-tree-list>span>i").removeClass("fa-folder-open");
					$(".fa-tree-list>span>i").addClass("fa-folder");

					$(".fa-tree-list ul").hide();
				} else if ($(".fa-tree-list>span>i").hasClass("fa-folder")) {
					// toggle icon
					$(".fa-tree-list>span>i").removeClass("fa-folder");
					$(".fa-tree-list>span>i").addClass("fa-folder-open");

					$(".fa-tree-list ul").show();
					$(".fa-tree-list>ul>li>span").find("i").removeClass(
							"fa-folder-open");
					$(".fa-tree-list>ul>li>span").find("i").addClass(
							"fa-folder");
					$(".fa-tree-list ul li").find("ul").hide();
				}
			});

	$(".fa-tree-list>ul>li>span").on("click", function() {
		//console.log($(this));
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
					url : "http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Query_ActivityMenu",
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

								//console.log("[" + index + "]" + menuName + ";" + dbid);
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
					url : "http://ws.crm.com.tw:8080/IMWebSocket/RESTful/FLAGDATA",
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

						// 重新將acitivitydata與flag組成巢狀結構
						var titleList = [];

						for ( var index in data.activitydata) {
							var titleflag = data.activitydata[index].titleflag;
							var codename = data.activitydata[index].codename;
							data.activitydata[index].dataList = [];

							titleList.push(data.activitydata[index]);
						}

						for ( var index in data.Flag) {
							var titlegroup = data.Flag[index].titlegroup;

							for ( var key in titleList) {
								if (titleList[key].titleflag == titlegroup) {
									titleList[key].dataList
											.push(data.Flag[index]);
								}
							}
						}

						//console.log(titleList);
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

		// 		console.log("insertRptActivityLog");
		// 		console.log("activitydataids : " + activitydataids);
		// 		console.log("interactionId : " + interactionId);

		$
				.ajax({
					url : "http://ws.crm.com.tw:8080/IMWebSocket/RESTful/Insert_rpt_activitylog",
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

						// 關閉目前使用頁籤
						var interactionId = "${interactionId}";
						parent.closeCurrentTab(interactionId);
					}
				});
	}

	function showCaseInfoTab() {
		$("#caseInfoTab").trigger("click");

		if (parent.autoSelectCaseInfo) {
			showCaseInfo();
		}
	}

	function finishChat() {
		// 新增案件資訊活動代碼紀錄
		insertRptActivityLog();
	}
</script>

</html>