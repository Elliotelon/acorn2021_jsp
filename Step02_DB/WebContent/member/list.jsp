<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	int pageRowCount=5;
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*pageRowCount;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*pageRowCount;
	
	//startRowNum 과 endRowNum  을 MemberDto 객체에 담고
	MemberDto dto=new MemberDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//MemberDao 객체를 이용해서 회원 목록을 얻어온다.
	List<MemberDto> list=MemberDao.getInstance().getList(dto);
	
	//int PageDisplayCount=5;
	
	int startPageNum=1+((pageNum-1)/5)*5;
	int endPageNum=startPageNum+5-1;
	
	//전체 row의 갯수
	int totalRow=MemberDao.getInstance().getCount();
	
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)5);
	
	if(endPageNum>=totalPageCount){
		endPageNum=totalPageCount;
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<%-- 포함시킬 jsp 페이지의 위치를 반드시 상대 경로로 page 의 value 로 명시 해야한다. --%>
<%-- 
	navbar.jsp 페이지에 요청 파라미터를 전달할수 있다. 
	"thisPage" 라는 파라미터 명으로 "member" 라는 문자열 전달 
	따라서 navbar.jsp 페이지 에서는 아래와 같이 파라미터를 추출할수 있다. 
	String thisPage=request.getParameter("thisPage")
--%>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="member" name="thisPage"/>
</jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="breadcrumb-item active">회원목록</li>
		</ul>
	</nav>
	<a href="insertform.jsp">회원 추가 하러가기</a>
	<table class="table">
		<thead class="table-dark">	
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp:list){ %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
					<td><a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a></td>
					<td><a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a></td>
				</tr>
			<%} %>
		</tbody>
	</table>
	<p class="alert alert-warning">
		현재 페이지는 <strong><%=pageNum %></strong> 입니다.
		죄송하지만 현재 저희 개발자가 아직 안배운게 있어서 다른 페이지로 이동하고 싶으면
		주소창에 <code>?pagNum=원하는페이지</code> 처럼 작성해서 이동하세요 
	</p>
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	  	<li class="page-item">
	  		<a class="page-link"href="list.jsp?pageNum=<%=startPageNum-1%>">Prev</a>
	  	</li>
	  	<%for(int i=startPageNum; i<=endPageNum; i++) {%>
    		<%if(i==pageNum){ %>
    			<li class="page-item active">
		    		<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
		    	</li>	
    		<%}else{ %>
    			<li class="page-item">
		    		<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
		    	</li>
		    <%} %>
	    <%} %>
	    <li class="page-item">
	    	<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">Next</a>
	    </li>
	  </ul>
	</nav>
</div>
</body>
</html>


