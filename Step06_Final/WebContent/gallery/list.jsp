<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="java.util.List"%>
<%@page import="test.gallery.dao.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Gallery 목록 얻어오기
	List<GalleryDto> list=GalleryDao.getInstance().getList();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<a href="private/upload_form.jsp">사진 업로드</a>
	<h1>갤러리목록</h1>
	<div class="row">
		<%for(GalleryDto tmp:list){ %>
		<div class="col-6 col-md-3">
			<a href="detail.jsp?num=<%=tmp.getNum()%>">
				<div class="card">
					<img class="card-img-top" src="${pageContext.request.contextPath}<%=tmp.getImagePath() %>" />
					<div class="card-body">
						<p class="card-text"><%=tmp.getCaption() %></p>
						<p class="card-text">작성자: <strong><%=tmp.getWriter() %></strong></p>		
						<p><small><%=tmp.getRegdate() %></small></p>
					</div>
				</div>					
			</a>
		</div>
		<%} %>
	</div>
</div>
</body>
</html>