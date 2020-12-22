<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 깨지지 않도록 
	request.setCharacterEncoding("utf-8");
	//폼 전송되는 파라미터 추출 
	String content=request.getParameter("content");
	//DB 에 저장할 내용을 Dto 에 담는다 
	TodoDto dto=new TodoDto();
	dto.setContent(content);
	//Dao 를  이용해서 DB 에 저장한다.
	boolean isSuccess=TodoDao.getInstance().insert(dto);
	//결과를 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insert.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>
			//javascript 를 클라이언트에게 로딩시켜서 페이지 이동 시키기
			location.href="list.jsp";
		</script>
	<%}else{ %>
		<p> 할일 추가 실패! <a href="insertform.jsp">다시 작성</a></p>
	<%} %>
</body>
</html>





