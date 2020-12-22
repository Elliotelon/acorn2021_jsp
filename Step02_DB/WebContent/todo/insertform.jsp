<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
	<div class="container">
		<h1>할일 추가 폼 입니다.</h1>
		<form action="${pageContext.request.contextPath }/todo/insert.jsp" method="post">
			<label for="content">할일</label>
			<input type="text" name="content" id="content"/>
			<button type="submit">추가</button>
		</form>
	</div>
</body>
</html>

