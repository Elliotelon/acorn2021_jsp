<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//업로드된 정보를 DB에 저장하고
	
	// /gallery/list.jsp 페이지로 리다일렉트 이동해서 업로드된 이미지 목록을
	// 보여주는 프로그래밍을 해 보세요
	
	//Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제 경로 얻어오기
	String realPath=application.getRealPath("/upload");
	System.out.println("realPath:"+realPath);
	
	//해당 경로를 access 할 수 있는 파일 객체 생성
	File f=new File(realPath);
	if(!f.exists()){//만일 폴더가 존재하지 않으면
		f.mkdir();//upload 폴더 만들기
	}
	//최대 업로드 사이즈 설정
	int sizeLimit=1024*1024*10; // 10MByte
	/*
		WEB-INF/lin/cos.jar 라이브러리가 있으면 아래의 객체를 생성할 수 있다.
		
		new MultipartRequest(HttpServletRequest 객체,
		업로드된 파일을 저장할 절대경로,
		최대 업로드 사이즈 제한,
		인코딩설정,
		DefaultFileRenamePolicy 객체)
		
		MultipartRequest 객체가 성공적으로 생성이 된다면 업로드된 파일에 대한 정보도
		추출할 수 있다.
	*/
	// <form enctype="multipart/form-data">로 전송된 값은 아래의 객체를 이용해서 추출한다.
	MultipartRequest mr=new MultipartRequest(request,
	realPath,
	sizeLimit,
	"utf-8",
	new DefaultFileRenamePolicy());
	//이미지설명
	String caption=mr.getParameter("caption");
	//원본 파일명
	String orgFileName=mr.getOriginalFileName("image");
	//upload 폴더에 저장된 파일명
	String saveFileName=mr.getFilesystemName("image");
	//작성자
	String writer=(String)session.getAttribute("id");
	
	//업로드된 파일의 정보를 GalleryDto에 담고
	GalleryDto dto=new GalleryDto();
	dto.setWriter(writer);
	dto.setCaption(caption);
	dto.setImagePath("/upload/"+saveFileName);
	//DB에 저장하고
	GalleryDao.getInstance().insert(dto);
	//응답하기
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/gallery/list.jsp");
%>
