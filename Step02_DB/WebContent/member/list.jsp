<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//MemberDao 객체를 이용해서 회원 목록을 얻어온다.
	List<MemberDto> list=MemberDao.getInstance().getList();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="../css/bootstrap.css" />
</head>
<body>
<div class="container">
	<a href="insertform.jsp">회원 추가 하러가기</a>
	<h1>회원 목록입니다.</h1>
	<table class="table">
		<thead class="table-dark">	
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
					<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
					<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
				</tr>
			<%} %>
		</tbody>
	</table>
</div>
</body>
</html>

