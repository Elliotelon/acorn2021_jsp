<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/list.jsp</title>
</head>
<body>
<div class="container">
	<h1>새글 작성 폼 입니다.</h1>
	<form action="insert.jsp" method="post">
		<div>
			<label for="title">제목</label>
			<input type="text" name="title" id="title" />
		</div>
		<div>
			<label for="content">내용</label>
			<textarea name="content" id="content"></textarea>
		</div>
		<button type="submit">저장</button>
	
	</form>

</div>
</body>
</html>