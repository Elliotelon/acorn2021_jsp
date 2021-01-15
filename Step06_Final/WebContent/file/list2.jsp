<%@page import="java.net.URLEncoder"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	//로그인된 아이디가 있는지 읽어와 본다.
	String id=(String)session.getAttribute("id");
%>
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
	
	//startRowNum 과 endRowNum  을 CafeDto 객체에 담고
	FileDto dto=new FileDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//ArrayList 객체의 참조값을 담을 지역변수를 미리 만든다.
	List<FileDto> list=null;
	//전체 row의 갯수를 담을 지역변수를 미리 만든다.
	int totalRow=0;
	
	//만일 검색 키워드가 넘어온다면
	if(!keyword.equals("")){
		//검색 조건이 무엇이냐에 따라 분기하기
		if(condition.equals("title_filename")){// 제목+파일명 검색인 경우
			//검색 키워드를 FileDto에 담아서 전달한다.
			dto.setTitle(keyword);
			dto.setOrgFileName(keyword);
			//제목+파일명 검색일때 호출하는 메소드를 이용해서 목록 얻어오기
			list=FileDao.getInstance().getListTF(dto);
			//제목+파일명 검색일때 호출하는 메소드를 이용해서 row의 갯수 얻어오기
			totalRow=FileDao.getInstance().getCountTF(dto);
		}else if(condition.equals("title")){// 제목 검색인 경우
			dto.setTitle(keyword);
			list=FileDao.getInstance().getListT(dto);
			totalRow=FileDao.getInstance().getCountT(dto);
		}else if(condition.equals("writer")){// 작성자 검색인 경우
			dto.setWriter(keyword);
			list=FileDao.getInstance().getListW(dto);
			totalRow=FileDao.getInstance().getCountW(dto);
		}//다른 검색 조건을 추가 하고 싶다면 아래에 else if()를 계속 추가하면 된다.
		
	}else{//검색 키워드가 넘어오지 않는다면
		//키워드가 없을때 호출하는 메소드를 이용해서 파일 목록을 얻어온다.
		list=FileDao.getInstance().getList(dto);
		//키워드가 없을때 호출하는 메소드를 이용해서 전체 row의 갯수를 얻어온다.
		totalRow=FileDao.getInstance().getCount();	
	
	}
	
	
	
	int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	

	
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum>totalPageCount){
		endPageNum=totalPageCount; //보정해준다.
	}
	/*
		아래의 내용을 EL과 JSTL로 모두 바꾸기 위해서는 필요한 값이 request 영역에
		저장되어 있어야 한다.
		지금은 jsp 페이지에서 request 영역에 담지만
		앞으로 배울 MVC(Model View Controller) 패턴에서는
		서블릿 단에서 위의 로직을 처리하고
		결과 데이터값을 request 영역에 담고
		해당(여기서는 list2.jsp) jsp 페이지로 forward 이동해서 응답하는 형태로 구현하게 된다.
	
	*/
	//EL, JSTL로 바꾸기 위해 필요한 것들 아래에 코딩
	request.setAttribute("list", list);
	request.setAttribute("pageNum", pageNum);
	request.setAttribute("startPageNum", startPageNum);
	request.setAttribute("endPageNum", endPageNum);
	request.setAttribute("totalPageCount", totalPageCount);
	request.setAttribute("condition", condition);
	request.setAttribute("keyword", keyword);
	request.setAttribute("encodedK", encodedK);
	request.setAttribute("totalRow", totalRow);
	
	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/list2.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp">
	<jsp:param value="file" name="thisPage"/>
</jsp:include>
<div class="container">
	<nav>
		<ul class="breadcrumb">
			<li class="breadcrumb-item">
				<a href="${pageContext.request.contextPath }/">Home</a>
			</li>
			<li class="breadcrumb-item active">자료실목록</li>
		</ul>
	</nav>
	<a href="private/upload_form.jsp">업로드 하러가기</a>
	<h1>자료실 목록 입니다.</h1>
	<table class="table table-striped">
		<thead class="table-dark">
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목(설명)</th>
				<th>파일명</th>
				<th>크기</th>
				<th>등록일</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="tmp" items="${requestScope.list}" >
			<tr>
				<td>${tmp.num}</td>
				<td>${tmp.writer}</td>
				<td>${tmp.title}</td>
				<td><a href="download.jsp?num=${tmp.num}">${tmp.orgFileName}</a></td>
				<td>${tmp.fileSize}</td>
				<td>${tmp.regdate}</td>
				<td>
					<c:if test="${tmp.writer eq sessionScope.id}">
						<a href="javascript:deleteConfirm(${tmp.num})">삭제</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<nav>
	  <ul class="pagination justify-content-center">
	  	<c:choose>
	  		<c:when test="${startPageNum ne 1}">
	  			<li class="page-item">
		  			<a class="page-link"href="list2.jsp?pageNum=${startPageNum-1}&condition=${condition}&keyword=${encodedK}">Prev</a>
		  		</li>
	  		</c:when>
	  		<c:otherwise>
	  			<li class="page-item disabled">
		  			<a class="page-link" href="javascript:">Prev</a>
		  		</li>
	  		</c:otherwise>
	  	</c:choose>
	  	<c:forEach var="i" begin="${startPageNum }" end="${endPageNum }">
	  		<c:choose>
	  			<c:when test="${i eq pageNum}">
	  				<li class="page-item active">
		    			<a class="page-link" href="list2.jsp?pageNum=${i }&condition=${condition }&keyword=${encodedK}">${i}</a>
		    		</li>	
	  			</c:when>
	  			<c:otherwise>
	  				<li class="page-item">
		    			<a class="page-link" href="list2.jsp?pageNum=${i }&condition=${condition }&keyword=${encodedK}">${i}</a>
		    		</li>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:forEach>
	  	<c:choose>
	  		<c:when test="${endPageNum lt totalPageCount }">
	  			 <li class="page-item">
		    		<a class="page-link" href="list2.jsp?pageNum=${endPageNum+1 }&condition=${condition }&keyword=${encodedK}">Next</a>
		    	</li>
	  		</c:when>
	  		<c:otherwise>
	  			<li class="page-item disabled">
		    		<a class="page-link" href="javascript:">Next</a>
		    	</li>
	  		</c:otherwise>
	  	</c:choose>
	  </ul>
	</nav>
	<form action="list2.jsp" method="get">
		<label for="condition">검색조건</label>
		<select name="condition" id="condition">
			<option value="title_filename" ${condition eq 'title_filename'?'selected':''}>제목+파일명</option>
			<option value="title"${condition eq 'title'?'selected':''}>제목</option>
			<option value="writer"${condition eq 'writer'?'selected':''}>작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어..." value="${keyword}">
		<button type="submit">검색</button>
	</form>
	<%-- 만일 검색 키워드가 존재한다면 몇개의 글이 검색 되었는지 알려준다. --%>
	<c:if test="${not empty keyword}">
		<div class="alert alert-success" style="width:275px">
			<strong>${totalRow }</strong> 개의 자료가 검색 되었습니다.
		</div>	
	</c:if>
</div>
<script>
	function deleteConfirm(num){
		let isDelete=confirm(num+"번 파일을 삭제 하시겠습니까?");
		if(isDelete){
			location.href="private/delete.jsp?num="+num;
		}	
	}
</script>
</body>
</html>