<%@page import="java.util.ArrayList"%>
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
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*pageRowCount;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*pageRowCount;
	
	//startRowNum 과 endRowNum을 MemberDto 객체에 담고
	MemberDto dto=new MemberDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//MemberDao 객체를 이용해서 회원 목록을 얻어온다.
	List<MemberDto> list=MemberDao.getInstance().getList(dto);
	
	//페이지리스트의 갯수지정
	int pageListCount=5;
	//페이지 블록지정
	int pageBlock=pageNum%pageListCount==0? pageNum/pageListCount:(pageNum/pageListCount)+1;
	//보여줄 페이지의 시작 ROWNUM을 정해진범위 안에서 일정하게 고정
	startRowNum=1+(pageBlock-1)*pageListCount;
	//보여줄 페이지의 끝 ROWNUM 정해진범위 안에서 일정하게 고정
	endRowNum=startRowNum+pageListCount-1;
	
	//전체 ROW갯수 가져오기
	int count=MemberDao.getInstance().getCount();
	
	//전체 페이지 수
	int pageCount=0;
	if(count%pageRowCount==0){
		pageCount=count/pageRowCount;	
	}else{
		pageCount=(count/pageRowCount)+1;
	}
	
	//페이지의endRowNum이 페이지수보다 클 경우 endRowNum을 페이지수로 바꿔주는 작업
	if(endRowNum>=pageCount){
		endRowNum=pageCount;
	}
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>

</style>
</head>
<body>
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
	
	<nav>
	  <ul class="pagination">
	  	<!-- 첫페이지에서는 이전링크 숨기는 코드 -->
	    <li class="page-item">
	      <a class="page-link" href="?pageNum=<%=startRowNum-1%>"
	      <%=startRowNum==1?"hidden":"" %>>
	        <span style="color:black">&laquo;</span>
	      </a>
	    </li>
	    
	    <!-- startRowNum에서 endRowNum까지 화면에 보여주는 코드 -->
	    <%
	    	for(int i=startRowNum; i<=endRowNum; i++){
	    	%>
	    		<!-- 현재페이지 활성화시키는 코드 -->
				<li class="page-item <%=i==pageNum?"active":""%>">
					<a class="page-link" href="?pageNum=<%=i%>" 
					style='color:black<%=i==pageNum?"; background-color:#EAEAEA; border-color:#EAEAEA":""%>' ><%=i%></a>
				</li>	
	   	  <%}
	    
	    %>
	    <!-- 마지막페이지 다음링크 숨기는 코드 -->
	    <li class="page-item">
	      <a class="page-link" href="?pageNum=<%=endRowNum+1%>" 
	      <%=endRowNum>=pageCount?"hidden":""%>>
	        <span style='color:black'>&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>
</body>
</html>