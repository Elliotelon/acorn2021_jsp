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
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대 경로로 page 의 value 로 명시 해야한다. --%>
<%--
		navbar.jsp 페이지에 요청 파라미터를 전달할 수 있다.
		"thisPage" 라는 파라미터 명으로 "member" 라는 문자열 전달
		따라서 navbar.jsp 페이지 에서는 아래와 같이 파라미터를 추출할 수 있다.
		String thisPage=request.getParameter("thisPage")
	 --%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="member" name="thisPage"/>
</jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="breadcrumb-item active">회원목록</li>
		</ul>
	</nav>
	<a href="insertform.jsp">회원 추가 하러가기</a>
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

