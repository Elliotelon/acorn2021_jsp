<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>users/private/updateform.jsp</title>
<style>
	/*프로필 이미지를 작은 원형으로 만든다.*/
	#profileImage{
		width:50px;
		height:50px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}

</style>
</head>
<body>
<%
	//세션 영역에 저장된 아이디를 이용해서
	String id=(String)session.getAttribute("id");
	//DB에 저장된 가입정보를 읽어온다.
	UsersDto dto=UsersDao.getInstance().getData(id);

%>
<div class="container">
	<h1>가입정보 수정 폼 입니다.</h1>
	<%if(dto.getProfile()==null){ %>
		<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
 			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
		</svg>
	<%}else{ %>
		<img id="profileImage" src="${pageContext.request.contextPath}<%=dto.getProfile() %>"/>
	<%} %>
	<form action="update.jsp" method="post">
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" value="<%=dto.getId() %>" disabled />
		</div>
		<div>
			<label for="email">이메일</label>
			<input type="email" id="email" name="email" value="<%=dto.getEmail() %>" />
		</div>
		<button type="submit">수정확인</button>
		<button type="reset">취소</button>
	</form>
	<h2>프로필 이미지 업로드 테스트</h2>
	<form action="profile_upload.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="image" accept=".jpg, .jpeg, .png, .JPG, .JPEG" />
		<button type="submit">업로드</button>
	</form>

</div>
</body>
</html>