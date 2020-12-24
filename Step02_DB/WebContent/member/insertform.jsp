<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
			</li>
			<li class="breadcrumb-item active">회원추가 폼</li>
		</ul>
	</nav>	
	<form action="insert.jsp" method="post">
		<div class="form-group">
			<label for="name">이름</label>
			<input class="form-control" type="text" name="name" id="name"/>
			<small class="form-text text-muted">이름을 예쁘게 적으세요~</small>
		</div>
		<div class="form-group">
			<label for="addr">주소</label>
			<input class="form-control" type="text" name="addr" id="addr"/>
			<small class="form-text text-muted">실제 사는 주소를 작성하세요!</small>
		</div>
		<button class="btn btn-success" type="submit">추가</button>
	</form>
</div>
</body>
</html>



