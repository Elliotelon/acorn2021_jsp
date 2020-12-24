<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--  
	jsp 페이지 안에서의 주석 입니다. 
	여기 작성한 내용은 jsp 페이지가 해석하지 않습니다.
	클라이언트 웹브라우저에 출력되지 않습니다.
--%>
<%--
	특정 jsp 페이지에 포함 시킬 내용을 jsp 페이지에 작성할수 있습니다.
 --%>
 <!-- 
	nav 요소는 div 요소에 의미를 더한 요소이다. 
	-navigation 요소를 포함하고 있다고 알려준다.
	
	배경색이 어두운색 계열이면 navbar-dark
	배경색이 밝은색 계열이면 navbar-light 클래스를 추가 해야한다.
-->
 <nav class="navbar navbar-dark bg-primary navbar-expand-sm">
	<div class="container">
	  	<a class="navbar-brand" href="${pageContext.request.contextPath }/">Acorn</a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="topNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath }/todo/list.jsp">할일목록</a>
				</li>
			</ul>	
		</div>
	</div>
</nav>
