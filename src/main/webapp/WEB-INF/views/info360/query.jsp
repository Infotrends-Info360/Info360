<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>「儀表板」頁面</title>
<script src="resources/js/jquery.min.js?v=2.1.4"></script>
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/layui/css/layui.css" rel="stylesheet">
<link href="resources/css/plugins/datapicker/datepicker3.css"
	rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">

<link rel="stylesheet" href="resources/jstree/style.min.css" />
<script type="text/javascript" src="resources/jstree/jstree.min.js"></script>

<link href="resources/css/plugins/toastr/toastr.min.css"
	rel="stylesheet">

</head>
<style>
.dataTables_filter {
	display: none;
}
</style>
<body class="gray-bg">
	<div class="widget">
		<!-- 左側快速選取區Start -->
		<div class="col-lg-2 col-sm-3">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>
						<i class="fa fa-angle-double-right"></i>案件搜尋
					</h3>
				</div>
				<div class="panel-body">
					<input id="today" type="hidden"></input> <input id="week"
						type="hidden"></input>


					<table class="table table-bordered table-hover">
						<thead>
							<tr class="bg-primary">
								<td><b>快速篩選</b></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td type="button" onclick="quickSearchByTime(0)">今天</td>
							</tr>
							<tr>
								<td type="button" onclick="quickSearchByTime(7)">本週</td>
							</tr>
							<tr>
								<td type="button" onclick="quickSearchByTime(30)">一個月</td>
							</tr>
							<tr>
								<td type="button" onclick="quickSearchByTime(90)">三個月</td>
							</tr>
							<tr>
								<td type="button" onclick="quickSearchByTime(180)">半年</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 左側快速選取區End -->

		<!-- 右側搜尋面板Start -->
		<div class="col-lg-10 col-sm-9">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-body">
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
			</div>
		</div>
		<!-- 右側搜尋面板End -->
	</div>
</body>

<!-- 全局js -->

<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>

<!-- Data Tables -->
<script src="resources/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="resources/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- DataPicker -->
<script src="resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>

<!-- toastStr -->
<script src="resources/js/plugins/toastr/toastr.min.js"></script>

<script type="text/javascript">
	var agentId = parent.UserID_g;

	$(document).ready(function() {
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