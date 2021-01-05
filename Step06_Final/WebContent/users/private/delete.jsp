<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.로그인된 id 가져오기
	String id=(String)session.getAttribute("id");
	//2.UsersDao의 delete 메소드를 이용하여 결과값을 isDelete에 담기
	boolean isDelete=UsersDao.getInstance().delete(id);
	//3.담긴 결과를 확인하기.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/delete.jsp</title>
</head>
<body>
<%if(isDelete){ %>
	<p>회원정보가 삭제 되었습니다.</p>
<%}else{ %>
	<p>회원정보 삭제 실패</p>
<%} %>
</body>
</html>