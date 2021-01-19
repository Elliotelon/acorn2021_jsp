<%@page import="test.mypic.dao.MypicDao"%>
<%@page import="test.mypic.dto.MypicDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 imagePath 와 caption을 추출해서 DB에 저장하고
	String imagePath=request.getParameter("imagePath");
	String caption=request.getParameter("caption");
	//업로드 아이디
	String id=(String)session.getAttribute("id");
	
	MypicDto dto=new MypicDto();
	dto.setImagePath(imagePath);
	dto.setCaption(caption);
	dto.setWriter(id);
	
	MypicDao.getInstance().insert(dto);
	//목록보기 리다일렉트 이동
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/all/list.jsp");
%>
