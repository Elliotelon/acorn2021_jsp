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
<!-- 
	jquery 플러그인 imgLiquid.js 로딩하기 
	-반드시 jquery.js가 먼저 로딩이 되어 있어야지만 동작한다.
	-사용법은 이미지의 부모 div의 크기를 결정하고 이미지를 선택해서 .imgLiquid() 동작을 하면 된다.
-->
<script src="${pageContext.request.contextPath}/js/imgLiquid.js"></script>
<style>
	/* card 이미지 부모요소의 높이 지정*/
	.img-wrapper{
		height: 250px;
	}
	.card .card-text{
		/*한줄만 text가 나오고 한줄 넘는 길이에 대해서는 ... 처리 하는 css*/
		display:block;
		white-space : nowrap;
		text-overflow: ellipsis;
		overflow: hidden;
	}

</style>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="gallery" name="thisPage"/>
</jsp:include>
<div class="container">
	<a href="private/upload_form.jsp">사진 업로드</a>
	<a href="private/ajax_form.jsp">사진 업로드2</a>
	<h1>갤러리목록</h1>
	<div class="row mb-2">
		<%for(GalleryDto tmp:list){ %>
		<!-- 
			[ 칼럼의 폭을 반응형으로]
			device 폭768px 미만에서 칼럼의 폭 => 6/12 (50%)
			device 폭768px ~ 992px 에서 칼럼의 폭 => 4/12 (33.333%)
			device 폭992px 이상에서 칼럼의 폭 => 3/12 (25%)
			
		 -->
		<div class="col-6 col-md-4 col-lg-3">
			<a href="detail.jsp?num=<%=tmp.getNum()%>">
				<div class="card mb-3">
					<div class="img-wrapper">
						<img class="card-img-top" src="${pageContext.request.contextPath}<%=tmp.getImagePath() %>" />					
					</div>
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
<script>
	// card 이미지의 부모 요소를 선택해서 imgLiquid 동작하기
	$(".img-wrapper").imgLiquid();

</script>


</body>
</html>