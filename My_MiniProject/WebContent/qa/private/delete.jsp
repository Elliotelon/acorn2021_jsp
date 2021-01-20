<%@page import="test.qa.dao.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 삭제할 글번호를 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB에서 삭제하고
	boolean isSuccess=QaDao.getInstance().delete(num);
	//3. 응답한다.


%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qa/private/delete.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			alert("삭제 했습니다.");
			location.href="${pageContext.request.contextPath}/cafe/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("삭제 실패!");
			location.href="detail.jsp?num=<%=num%>"
		</script>
	<%} %>
</body>
</html>