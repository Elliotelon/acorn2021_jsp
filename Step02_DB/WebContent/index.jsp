<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link rel="stylesheet" href="css/bootstrap.css" />
</head>
<body>
<!-- 
	nav 요소는 div 요소에 의미를 더한 요소이다. 
	- navigation 요소를 포함하고 있다고 알려준다. 
-->

<!-- 
	배경색이 어두운색 계열이면 navbar-dark 
	배경색이 밝은색 계열이면 navbar-light 클래스를 추가 해야한다.
 -->
<nav class="navbar navbar-dark bg-primary navbar-expand-sm">
	<div class="container">
	  	<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>
		<ul class="navbar-nav">
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
			</li>
		</ul>	
	</div>
</nav>
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









