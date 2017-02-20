<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>info360</title>
</head>

<jsp:include page="WEB-INF/views/common/init.jsp"></jsp:include>

<body>
	<h2>Hello Spring Mvc</h2>
	<form action="hello" method="post">
		<label>Name：</label><input name="name">
		<label>Tel：</label><input name="tel">
		<button type="submit">送出</button>
	</form>
</body>

</html>