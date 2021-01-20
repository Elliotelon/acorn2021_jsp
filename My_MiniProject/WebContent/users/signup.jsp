<%@page import="java.io.PrintWriter"%>
<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 가입할 회원의 정보를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	//UsersDto 객체에 회원정보를 담고
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	//UsersDao 객체를 이용해서 DB 에 저장한다.
	boolean isSuccess=UsersDao.getInstance().insert(dto);
	//결과를 응답하기 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup.jsp</title>
</head>
<body>
<script>
<%if(isSuccess){
	session.setAttribute("id",id);
%>
	alert("가입성공! 로그인 해주세요!");
	location.href="loginform.jsp";
<%}else{%>
	alert("가입실패! 다시 가입해주세요!");
	location.href="signip_form.jsp"
<%}%>
</script>
</body>
</html>