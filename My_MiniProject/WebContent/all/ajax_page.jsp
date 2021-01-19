<%@page import="test.mypic.dao.MypicDao"%>
<%@page import="test.mypic.dto.MypicDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=8;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//ajax 요청 파리미터 pageNum 읽어오기 
	int pageNum=Integer.parseInt(request.getParameter("pageNum"));
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//startRowNum 과 endRowNum  을 MypicDto 객체에 담고
	MypicDto dto=new MypicDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//MypicDao 객체를 이용해서 회원 목록을 얻어온다.
	List<MypicDto> list=MypicDao.getInstance().getList(dto);
%>    
<%
    	for(MypicDto tmp:list){
    %>
<div class="col-6 col-md-4 col-lg-3">
	<div class="card mb-3">
		<a href="detail.jsp?num=<%=tmp.getNum() %>">
			<div class="img-wrapper page-<%=pageNum%>">
				<img class="card-img-top" src="${pageContext.request.contextPath }<%=tmp.getImagePath() %>" />
			</div>
		</a>
		<div class="card-body">
			<p class="card-text"><%=tmp.getCaption() %></p>
			<p class="card-text">by <strong><%=tmp.getWriter() %></strong></p>
			<p><small><%=tmp.getRegdate() %></small></p>
		</div>
	</div>
</div>
<%} %>