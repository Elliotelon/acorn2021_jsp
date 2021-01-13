<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//폼 전송되는 imagePath 와 caption을 추출해서 DB에 저장하고
	String imagePath=request.getParameter("imagePath");
	String caption=request.getParameter("caption");
	//업로드 아이디
	String id=(String)session.getAttribute("id");
	
	GalleryDto dto=new GalleryDto();
	dto.setImagePath(imagePath);
	dto.setCaption(caption);
	dto.setWriter(id);
	
	GalleryDao.getInstance().insert(dto);
	//목록보기 리다일렉트 이동
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/gallery/list.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/private/insert.jsp</title>
</head>
<body>

</body>
</html>