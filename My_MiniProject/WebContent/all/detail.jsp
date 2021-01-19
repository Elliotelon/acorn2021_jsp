<%@page import="test.mypic.dao.MypicDao"%>
<%@page import="test.mypic.dto.MypicDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자세히 보여줄 겔러리 item 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//번호를 이용해서 겔러리 item 정보를 얻어온다.
	MypicDto dto=MypicDao.getInstance().getData(num);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/all/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<jsp:include page="../include/blogbasic.jsp"></jsp:include>
	<div class="card mb-3">
		<img class="card-img-top" src="${pageContext.request.contextPath }<%=dto.getImagePath()%>"/>
		<div class="card-body">
			<p class="card-text"><%=dto.getCaption() %></p>
			<p class="card-text">by <strong><%=dto.getWriter() %></strong></p>
			<p><small><%=dto.getRegdate() %></small></p>
		</div>
	</div>
	<nav>
		<ul class="pagination justify-content-center">
			
			<%if(dto.getPrevNum() != 0){ %>
				<li class="page-item mr-3">
					<a class="page-link" href="detail.jsp?num=<%=dto.getPrevNum()%>">&larr; Prev</a>
				</li>
			<%}else{ %>
				<li class="page-item disabled mr-3">
					<a class="page-link" href="javascript:">Prev</a>
				</li>	
			<%} %>
			<%if(dto.getNextNum() != 0){ %>
				<li class="page-item">
					<a class="page-link" href="detail.jsp?num=<%=dto.getNextNum()%>">Next &rarr;</a>
				</li>
			<%}else{ %>
				<li class="page-item disabled">
					<a class="page-link" href="javascript:">Next</a>
				</li>	
			<%} %>
			
		</ul>
	</nav>		
</div>
</body>
</html>
