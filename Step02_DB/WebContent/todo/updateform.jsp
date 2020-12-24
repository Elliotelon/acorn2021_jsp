<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//수정할 할일 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//수정할 할일 정보를 DB로 부터 얻어온다.	
	TodoDto dto=TodoDao.getInstance().getData(num);
	//수정폼을 응답한다.
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/updateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum()%>" />
		
		<div class="form-group">
			<label for="num">번호</label>
			<input class="form-control" type="text" id="num" value="<%=dto.getNum()%>" disabled/>		
		</div>
		
		<div class="form-group">
			<label for="content">할일</label>
			<input class="form-control" type="text" name="content" id="content" value="<%=dto.getContent()%>" />
			<small class="form-text text-muted">할일을 작성하세요</small>
		</div>
		
		<div class="form-group">
			<label for="regdate">등록일</label>
			<input class="form-control" type="text" name="regdate" id="regdate" value="<%=dto.getRegdate()%>" disabled/>
		</div>
		
		<button class="btn btn-success" type="submit">수정</button>
		<button class="btn btn-danger" type="reset">취소</button>
	</form>
</div>
</body>
</html>





