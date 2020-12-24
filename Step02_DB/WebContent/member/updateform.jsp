<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 수정할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 해당 회원의 정보를 얻어온다.
	MemberDto dto=MemberDao.getInstance().getData(num);
	//3. 수정 form 에 기본 값으로 넣어주면서 응답한다. 
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
</head>
<body>
	<h1>회원 정보 수정 폼 입니다.</h1>
	<form action="update.jsp" method="post">
		<!-- 회원정보를 수정 반영할때 번호도 필요하기 때문에 폼 제출될때 같이 제출되도록 한다. -->
		<input type="hidden" name="num" value="<%=dto.getNum() %>"/>
		<!--  아래 번호는 단순 display 용도이다.  -->
		번호 <input type="text" value="<%=dto.getNum() %>" disabled/> <br/>
		이름 <input type="text" name="name" value="<%=dto.getName() %>"/><br/>
		주소 <input type="text" name="addr" value="<%=dto.getAddr() %>"/><br/>
		<button type="submit">수정확인</button>
		<button type="reset">취소</button>
	</form>
</body>
</html>



