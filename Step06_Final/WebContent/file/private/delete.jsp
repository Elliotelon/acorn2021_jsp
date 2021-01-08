<%@page import="java.io.File"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET 방식 전달되는 삭제할 파일 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. DB 에서 해당 파일의 정보를 읽어 온다.
	FileDto dto=FileDao.getInstance().getData(num);
	String id=(String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)){
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일 지우면 혼난당!");
		return; //메소드 종료
	
	}
	//3. DB 에서 파일 정보를 삭제한다.
	FileDao.getInstance().delete(num);
	//4. 파일 시스템(upload 폴더)에 저장된 파일을 삭제한다.
	//삭제할 파일의 절대 경로
	/*
		Linux는 파일 경로 구분자가 슬레시(/) 이고
		window는 파일 경로 구분자가 역슬래시(\) 이다.
		File.separator로 운영체제에 맞게끔 알맞은 파일 구분자를 얻어낼수 있다.
	
	*/
	String path=application.getRealPath("/upload")+
		File.separator+dto.getSaveFileName();
	//삭제할 파일을 access 할 수 있는 File 객체 생성
	File file=new File(path);
	if(file.exists()){
		file.delete();
	}
	//5. 응답한다.(리다일렉트)
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");
%>