<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대 경로로 page 의 value 로 명시 해야한다. --%>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="member/list.jsp">회원 목록보기</a></li>
		<!-- 
			아래의 링크가 동작하도록 해 보세요.
			목록보기, 추가, 수정, 삭제 기능을 모두 구현 하세요.
			test.todo.dto
			test.todo.dao 페키지도 만들고 TodoDto TodoDao 도 만드세요.
			모두 구현후 bootstrap css 도 모든 페이지에 적용 시켜 보세요.
		 -->
		<li><a href="todo/list.jsp">할일 목록 보기</a></li>
		<li><a href="test/signup_form.jsp">폼 안에 있는 여러 input 요소 테스트</a></li>
	</ul>
</div>
</body>
</html>









