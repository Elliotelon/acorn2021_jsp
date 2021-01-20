<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	#con{
		margin-top:5rem;
	}
	.form-group{
		width:10rem;
	}
</style>
</head>
<body>
<jsp:include page="../../include/blogbasic.jsp"></jsp:include>
<div class="container" id="con">
	<!-- 
		파일 업로드 폼 작성법
		1. method="post"
		2. enctype="multipart/form-data"
		3. <input type="file"/>
		-enctype="multipart/form-data"가 설정된 폼을 전송하면
		폼 전송된 내용을 추출할때 HttpServletRequest 객체로 추출을 할 수 없다.
		MultipartRequest 객체를 이용해서 추출해야 한다.
	 -->
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="title">제목</label>
			<input class="form-control"type="text" name="title" id="title" />
		</div>
		<div>
			<label for="myFile">첨부파일</label>
			<input type="file" name="myFile" id="myFile" />
		</div>
		<div class="form-inline mb-5 justify-content-start">
			<button class="btn btn-success btn-xs" type="submit">업로드</button>
		</div>
	</form>
	<jsp:include page="../../include/blogfooter.jsp"></jsp:include>
</div>
</body>
</html>