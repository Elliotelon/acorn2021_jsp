<%@page import="test.users.dto.UsersDto"%>
<%@page import="test.users.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope 에서 수정할 회원의 아이디
	String id=(String)session.getAttribute("id");
	//폼 전송되는 파라미터에서 구 비밀번호, 새비밀번호 읽어오기
	String pwd=request.getParameter("pwd");
	String newPwd=request.getParameter("newPwd");
	//DB에 수정반영하고 작업 성공여부를 리턴 받는다.
	UsersDto dto=new UsersDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setNewPwd(newPwd);
	boolean isSuccess=UsersDao.getInstance().updatePwd(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/pwd_update.jsp</title>
</head>
<body>
<script>
	<%if(isSuccess){//비밀번호 수정 성공이면
		//다시 로그인 하도록 로그아웃 처리를 한다.
		session.removeAttribute("id");
	%>
		alert("수정했습니다.");
		location.href="${pageContext.request.contextPath}/users/loginform.jsp";
	<%}else{%>
		alert("수정실패");
		location.href="pwd_updateform.jsp"
	<%}%>
</script>
</body>
</html>