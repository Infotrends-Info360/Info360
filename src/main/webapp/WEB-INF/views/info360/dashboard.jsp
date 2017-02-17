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
		<!-- 佇列活動 Start-->
		<div class="col-lg-6 col-md-6">
			<div class="panel panel-success" style="height: 780px;">
				<div class="panel-heading">
					<h3>佇列活動</h3>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="ibox">
								<div class="ibox-title">
									<h3>已分派通數</h3>
								</div>
								<div class="ibox-content">
									<small>包含已分配交談</small>
									<h1>1</h1>
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="row">
								<div class="ibox-title">
									<h3>等待時間</h3>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="ibox">
										<div class="ibox-content">
											<h3>最長</h3>
											<h1>00:15</h1>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="ibox">
										<div class="ibox-content">
											<h3>平均</h3>
											<h1>00:15</h1>
										</div>
									</div>
								</div>
								<div class="col-lg-12 col-md-12">
									<div class="ibox">
										<div class="ibox-content">
											<h3>未接交談</h3>
											<small>自 5:00 pm</small>
											<h1>0</h1>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- 佇列活動 End-->

		<!-- 代理活動 Start-->
		<div class="col-lg-3 col-md-3">
			<div class="panel panel-success" style="height: 780px;">
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
		</div>
		<!-- 代理活動 End-->

		<!-- 滿意度 Start-->
		<div class="col-lg-3 col-md-3">
			<div class="panel panel-success" style="height: 780px;">
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
		</div>
		<!-- 滿意度 End-->
	</div>



	<!-- 全局js -->
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>

</body>
</html>
