<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 몇번 회원을 삭제 할지 알아내서(삭제할 회원의 번호를 읽어온다.)
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 실제로 삭제한다.
	MemberDao dao=MemberDao.getInstance();
	boolean isSuccess=dao.delete(num);
	//3. 응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p> 
			<strong><%=num %></strong> 번 회원의 정보를 삭제 했습니다.
			<a href="list.jsp">확인</a>
		</p>
	<%}else{ %>
		<p>회원 정보 삭제 실패! <a href="list.jsp">확인</a></p>
	<%} %>
</body>
</html>



