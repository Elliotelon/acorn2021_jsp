<%@page import="test.qa.dto.QaDto"%>
<%@page import="test.qa.dao.QaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 파라미터로 전달되는 자세히 보여줄 글 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. 글번호를 이용해서 DB 에서 글정보를 읽어온다.
	QaDto dto=QaDao.getInstance().getData(num);
	//3. 글 조회수를 올린다.
	QaDao.getInstance().addViewCount(num);
	//4. 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qa/detail.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	#con{
		margin-top:5rem;
	}
	#tab{
		margin-top:-3rem;
	}
</style>
</head>
<body>
<jsp:include page="../include/blogbasic.jsp"></jsp:include>
<div class="container" id="con">
	<table class="table table-bordered bg-light">
		<tr>
			<th>글번호</th>
			<td><%=dto.getNum() %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewCount() %></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<table class="table table-borderless bg-light" id="tab">
		<div class="form-group">
			<label for="textarea">
				<tr>
					<th>내용</th>
				</tr>
			</label>
			<tr>
				<td>
				    <textarea class="form-control" id="textarea" rows="3"><%=dto.getContent() %></textarea>			
				</td>			
			</tr>
		</div>
	</table>
	
	<%
		//session scope 에서 로그인된 아이디를 읽어와 본다. ( null 일수도 있음 )
		String id=(String)session.getAttribute("id");
	%>
	<div class="form-inline mb-5 justify-content-end">
		<%if(dto.getWriter().equals(id)){ %>
			<a href="private/updateform.jsp?num=<%=dto.getNum()%>">
				<button class="btn btn-success btn-xs" >수정</button>
			</a>
			<a href="javascript:deleteConfirm()">
				<button class="btn btn-danger btn-xs ml-1" >삭제</button>
			</a>
		<%} %>
		<a href="list.jsp">
			<button class="btn btn-info btn-xs ml-1" >목록</button>
		</a>
	</div>
	<jsp:include page="../include/blogfooter.jsp"></jsp:include>
</div>

<script>
	function deleteConfirm(){
		let isDelete=confirm("글을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num=<%=dto.getNum()%>";
		}
	}
</script>
</body>
</html>