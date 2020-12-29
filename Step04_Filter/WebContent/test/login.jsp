<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.폼 전송되는 아이디와 비밀번호를 읽어온다.
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	
	//2.DB에 해당 회원정보가 있는지 select 해본다.
	boolean isValid=false; //유효한 정보인지 여부
	//아이디 : gura, 비밀번호 : 1234 가 DB에 저장된 유효한 정보라고 가정해 보자
	if(id.equals("gura")&&pwd.equals("1234")){
		isValid=true;
		//로그인 했다는 의미에서 session scope에 "id"라는 키값으로 로그인된 아이디를 담는다.
		session.setAttribute("id", id);
	}
	//3.회원정보가 맞으면 로그인 처리후 응답, 틀리면 로그인 실패라고 응답.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/login.jsp</title>
</head>
<body>
<%if(isValid){ %>
	<p>
		<strong><%=id %></strong> 회원님 로그인 되었습니다.
		<a href="${pageContext.request.contextPath}/index.jsp">확인</a>
	</p>
<%}else{ %>
	<p>
		아이디 혹은 비밀번호가 틀려요!
		<a href="${pageContext.request.contextPath}/index.jsp">다시시도</a>
	</p>
<%} %>
</body>
</html>