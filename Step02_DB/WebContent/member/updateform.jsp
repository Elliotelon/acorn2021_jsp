<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1.수정할 회원의 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB에서 해당 회원의 정보를 얻어온다.
	MemberDto dto=MemberDao.getInstance().getData(num);
	//3. 수정 form에 기본 값으로 넣어주면서 응답한다.
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/updateform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/">home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath}/member/list.jsp">회원목록</a>			
			</li>
			<li class="breadcrumb-item active">회원수정</li>
		</ul>
	</nav>
	<form action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%=dto.getNum()%>" />
		
		<div class="form-group">
			<label for="num">번호</label>
			<input class="form-control" type="text" id="num" value="<%=dto.getNum()%>" disabled/>		
		</div>
		
		<div class="form-group">
			<label for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name" value="<%=dto.getName()%>" />
			<small class="form-text text-muted">이름을 작성하세요</small>
		</div>
		
		<div class="form-group">
			<label for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr" value="<%=dto.getAddr()%>"/>
			<small class="form-text text-muted">주소를 작성하세요</small>
		</div>
		
		<button class="btn btn-success" type="submit">수정</button>
		<button class="btn btn-danger" type="reset">취소</button>
	</form>
	
</div>
</body>
</html>



