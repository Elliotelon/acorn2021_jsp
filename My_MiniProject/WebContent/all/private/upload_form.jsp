<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/all/private/upload_form.jsp</title>
<jsp:include page="../../include/resource.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<jsp:include page="../../include/blogbasic.jsp"></jsp:include>
	<h1>이미지 업로드 폼</h1>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div>
			<label for="caption">설명</label>
			<input type="text" name="caption" id="caption" />
		</div>
		<div>
			<label for="image">이미지</label>
			<input type="file" name="image" id="image" 
				accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
		</div>
		<button type="submit">업로드</button>
	</form>
</div>
</body>
</html>