<%@page import="test.qa.dto.QaDto"%>
<%@page import="test.qa.dao.QaDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
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
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	/*
	[검색 키워드에 관련된 처리]
	-검색 키워드가 파라미터로 넘어올수도 있고 안넘어 올수도 있다.
	
	*/
	String keyword=request.getParameter("keyword");
	String condition=request.getParameter("condition");
	
	//만일 키워드가 넘어오지 않는다면
	if(keyword==null){
		//키워드와 검색 조건에 빈문자열을 넣어 준다.
		//클라이언트 웹브라우저에 출력할때 "null"을 출력되지 않게 하기 위해서
		keyword="";
		condition="";
	}
	//특수기호를 인코딩한 키워드를 미리 준비한다.
	String encodedK=URLEncoder.encode(keyword);
	
	//startRowNum 과 endRowNum  을 QaDto 객체에 담고
	QaDto dto=new QaDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
	List<QaDto> list=null;
	//전체 row의 갯수를 담을 지역변수를 미리 만든다.
	int totalRow=0;
	
	//만일 검색 키워드가 넘어온다면
	if(!keyword.equals("")){
		//검색 조건이 무엇이냐에 따라 분기하기
		if(condition.equals("title_content")){// 제목+파일명 검색인 경우
			//검색 키워드를 QaDto에 담아서 전달한다.
			dto.setTitle(keyword);
			dto.setContent(keyword);
			//제목+파일명 검색일때 호출하는 메소드를 이용해서 목록 얻어오기
			list=QaDao.getInstance().getListTC(dto);
			//제목+파일명 검색일때 호출하는 메소드를 이용해서 row의 갯수 얻어오기
			totalRow=QaDao.getInstance().getCountTC(dto);
		}else if(condition.equals("title")){// 제목 검색인 경우
			dto.setTitle(keyword);
			list=QaDao.getInstance().getListT(dto);
			totalRow=QaDao.getInstance().getCountT(dto);
		}else if(condition.equals("writer")){// 작성자 검색인 경우
			dto.setWriter(keyword);
			list=QaDao.getInstance().getListW(dto);
			totalRow=QaDao.getInstance().getCountW(dto);
		}//다른 검색 조건을 추가 하고 싶다면 아래에 else if()를 계속 추가하면 된다.
		
	}else{//검색 키워드가 넘어오지 않는다면
		//키워드가 없을때 호출하는 메소드를 이용해서 파일 목록을 얻어온다.
		list=QaDao.getInstance().getList(dto);
		//키워드가 없을때 호출하는 메소드를 이용해서 전체 row의 갯수를 얻어온다.
		totalRow=QaDao.getInstance().getCount();	
	
	}
	
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	

	
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //보정해준다.
	}
	
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/qa/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	#con{
		margin-top:5rem;
	}
</style>
</head>
<body>
<jsp:include page="../include/blogbasic.jsp"></jsp:include>
<div class="container" id="con">
	<a href="private/insertform.jsp">새글 작성</a>
	<table class="table table-striped">
		<thead class="table-dark">
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<%for(QaDto tmp:list){ %>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></td>
				<td><%=tmp.getViewCount() %></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	<nav>
	  <ul class="pagination justify-content-center">
	  	<%if(startPageNum!=1){ %>
		  	<li class="page-item">
		  		<a class="page-link"href="list.jsp?pageNum=<%=startPageNum-1%>&condition=<%=condition%>&keyword=<%=encodedK%>">Prev</a>
		  	</li>	  	
	  	<%}else{ %>
	  		<li class="page-item disabled">
		  		<a class="page-link" href="javascript:">Prev</a>
		  	</li>
	  	<%} %>
	  	<%for(int i=startPageNum; i<=endPageNum; i++) {%>
    		<%if(i==pageNum){ %>
    			<li class="page-item active">
		    		<a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition%>&keyword=<%=encodedK%>"><%=i %></a>
		    	</li>	
    		<%}else{ %>
    			<li class="page-item">
		    		<a class="page-link" href="list.jsp?pageNum=<%=i %>&condition=<%=condition%>&keyword=<%=encodedK%>"><%=i %></a>
		    	</li>
		    <%} %>
	    <%} %>
	    <%if(endPageNum<totalPageCount){ %>
		    <li class="page-item">
		    	<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>&condition=<%=condition%>&keyword=<%=encodedK%>">Next</a>
		    </li>	    
	    <%}else{ %>
	    	<li class="page-item disabled">
		    	<a class="page-link" href="javascript:">Next</a>
		    </li>
	    <%} %>
	  </ul>
	</nav>
	<form action="list.jsp" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title_content" <%=condition.equals("title_content")?"selected":"" %>>제목+내용</option>
			<option value="title"<%=condition.equals("title")?"selected":"" %>>제목</option>
			<option value="writer"<%=condition.equals("writer")?"selected":"" %>>작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어..."  value=<%=keyword %>>
		<button type="submit">검색</button>
	</form>
	<%-- 만일 검색 키워드가 존재한다면 몇개의 글이 검색 되었는지 알려준다. --%>
	<%if(!keyword.equals("")){ %>
		<div class="alert alert-success" style="width:275px">
			<strong><%=totalRow %></strong> 개의 자료가 검색 되었습니다.
		</div>	
	<%} %>
	<jsp:include page="../include/blogfooter.jsp"></jsp:include>
</div>
</body>
</html>
