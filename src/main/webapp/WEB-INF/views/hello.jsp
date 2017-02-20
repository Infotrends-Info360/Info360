<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello</title>
</head>
<body>
	<div class="container-fluid">
		<div class="text-center">
			<h1>Hello : ${name}</h1>
			<h1>Your Phone Number : ${tel}</h1>
			<input type="button" class="btn btn-success" onclick="history.back()" value="上一頁"></input>
		</div>
	</div>
</body>
</html>