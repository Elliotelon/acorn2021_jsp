<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/error/500.jsp</title>
</head>
<body>
	<p>요청을 처리하던중 내부적으로 에러가 발생했습니다. 조속히 복구 하겠습니다.</p>
	<p>에러메세지:${requestScope['javax.servlet.error.message'] }</p>
	<p>상태코드:${requestScope['javax.servlet.error.status_code'] }</p>
	<p>요청한 위치:${requestScope['javax.servlet.error.request_uri'] }</p>
	<p>${requestScope['javax.servlet.error.exception'] }</p>
	<p>${requestScope['javax.servlet.error.exception_type'] }</p>
</body>
</html>