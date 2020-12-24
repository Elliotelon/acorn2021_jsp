<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/list.jsp</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css" />
</head>
<body>
<nav class="navbar navbar-dark bg-primary navbar-expand-sm">
	<div class="container">
	  	<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
			</li>
		</ul>	
	</div>
</nav>
<div class="container">
	<a href="${pageContext.request.contextPath }/todo/insertform.jsp">할일 추가하기</a>
	<h1>할일 목록 입니다.</h1>
	<table class="table">
		<thead class="table-dark">
			<tr>
				<th>번호</th>
				<th>할일</th>
				<th>등록일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<%
			//할일 목록을 불러온다.
			List<TodoDto> list=TodoDao.getInstance().getList();
		%>
		<tbody>
		<%for(TodoDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getContent() %></td>
				<td><%=tmp.getRegdate() %></td>
				<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
				<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
</div>
</body>
</html>



