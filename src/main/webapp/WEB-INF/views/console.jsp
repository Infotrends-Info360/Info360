<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<jsp:include page="common/init.jsp"></jsp:include>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>info360</title>
<link rel="shortcut icon" href="resources/favicon.ico">
<link href="resources/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
<link href="resources/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/style.css?v=4.1.0" rel="stylesheet">

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>



<body class="gray-bg">

	<div style="text-align: center;">
		<h1 class="logo-name" style="color: #AAAAAA">Info360</h1>
	</div>

	<div class="middle-box text-center loginscreen  animated fadeInDown">
		<div class="text-center">
			<h3>歡迎使用Info360</h3>
		</div>
		<div>
			<form class="" role="form" method="POST" action="main">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="用户名"
						name="userName" required="" value="Holylin">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="密码"
						name="password" required="" value="info@1111">
				</div>

				<button class="btn btn-primary block full-width" id="loginButton">登入</button>
			</form>
			<div style="display:none;">
				<p class="text-muted text-center">
					<a href="#"><small>忘記密碼</small></a>
				</p>
			</div>
		</div>
	</div>

	<!-- 全局js -->
	<script src="resources/js/jquery.min.js?v=2.1.4"></script>
	<script src="resources/js/bootstrap.min.js?v=3.3.6"></script>

	<script>
		$("#loginButton").on("click", function() {
			
		});
	</script>
</body>

</html>