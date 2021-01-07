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
<%
	//"thisPage" 라는 파라미터 명으로 전달된 문자열 읽어오기
	String thisPage=request.getParameter("thisPage");
	//NullPointerException 방지
	if(thisPage==null){
		thisPage="";
	}
%>
 <nav class="navbar navbar-dark bg-dark navbar-expand-sm fixed-top">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath }/">
	  		<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-house" viewBox="0 0 20 20">
			  <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
			  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
			</svg>
	  	</a>
		<button class="navbar-toggler" data-toggle="collapse" data-target="#topNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="topNav">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item <%=thisPage.equals("cafe")?"active":"" %>">
					<a class="nav-link" href="${pageContext.request.contextPath }/cafe/list.jsp">글목록</a>
				</li>
				<li class="nav-item <%=thisPage.equals("file")?"active":"" %>">
					<a class="nav-link" href="${pageContext.request.contextPath }/file/list.jsp">자료실목록</a>
				</li>
			</ul>	
			<%
			//로그인된 아이디가 있는지 읽어와 본다.
			String id=(String)session.getAttribute("id");
			%>
			<%if(id==null){ %>
				<a class="btn btn-success btn-sm"
				 href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>		
			<%}else{ %>
				<span class="navbar-text">
					<a href="${pageContext.request.contextPath}/users/private/info.jsp"><%=id %></a>
					<a class="btn btn-warning btn-sm"
					href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
				</span>
			<%} %>
		</div>
	</div>
</nav>
