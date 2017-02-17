<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>



<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>「儀表板」頁面</title>

<link rel="shortcut icon" href="favicon.ico">
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">

</head>
<body class="gray-bg">
	<div class="widget">
		<div class="col-lg-2 col-sm-3">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>
						<i class="fa fa-angle-double-right"></i>案件搜尋
					</h3>
				</div>
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<thead>
							<tr class="bg-primary">
								<td><b>快速篩選</b></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>今天</td>
							</tr>
							<tr>
								<td>本週</td>
							</tr>
							<tr>
								<td>一個月</td>
							</tr>
							<tr>
								<td>三個月</td>
							</tr>
							<tr>
								<td>半年</td>
							</tr>
						</tbody>
					</table>
					<!--
<div class="ibox">
<div class="ibox-body">
<ul class="list-group" style="line-height:30px;">
<li class="list-group-item"><b>快速篩選</b></li>
<li class="list-group-item">今天</li>
<li class="list-group-item">本週</li>
<li class="list-group-item">一個月</li>
<li class="list-group-item">三個月</li>
<li class="list-group-item">半年</li>
</ul>
</div>
</div>
-->
				</div>
			</div>
		</div>
		<div class="col-lg-10 col-sm-9">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-body">
					<div class="row ibox">
						<div class="col-lg-6 col-md-6">
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
						<div class="col-lg-3 col-md-3">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">處理人</span> <input
									type="text" class="form-control" placeholder="請輸入處理人"
									aria-describedby="basic-addon1">
							</div>
						</div>
						<div class="col-lg-3 col-md-3">
							<div class="input-group">
								<span class="input-group-addon" id="basic-addon1">客戶ID</span> <input
									type="text" class="form-control" placeholder="請輸入ID"
									aria-describedby="basic-addon1">
							</div>
						</div>
					</div>
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

					<div class="row ibox">
						<div class="col-lg-12 col-md-12">
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




<script>
	$(document).ready(function() {
		// init datepicker
		$("#datepicker").datepicker();
		//init datatable
		$("#queryTable").DataTable();
		$("#queryTable").css("width", "100%");
	});
</script>
</html>
