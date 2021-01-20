<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제 경로 얻어오기
	String realPath=application.getRealPath("/upload");
	System.out.println("realPath:"+realPath);
	
	//해당 경로를 access 할 수 있는 파일 객체 생성
	File f=new File(realPath);
	if(!f.exists()){//만일 폴더가 존재하지 않으면
		f.mkdir();//upload 폴더 만들기
	}
	//최대 업로드 사이즈 설정
	int sizeLimit=1024*1024*50; // 50MByte
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
	//폼전송된 내용 추출하기
	String title=mr.getParameter("title");
	String orgFileName=mr.getOriginalFileName("myFile");
	String saveFileName=mr.getFilesystemName("myFile");
	long fileSize=mr.getFile("myFile").length();
	System.out.println("title:"+title);
	System.out.println("orgFileName:"+orgFileName);
	System.out.println("saveFileName:"+saveFileName);
	System.out.println("fileSize:"+fileSize);
	//작성자
	String writer=(String)session.getAttribute("id");
	
	//업로드된 파일의 정보를 FileDto에 담고
	FileDto dto=new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	//DB에 저장하고
	boolean isSuccess=FileDao.getInstance().insert(dto);
	//응답하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
<script>
<%if(isSuccess){
	
%>
	alert("업로드성공!");
	location.href="${pageContext.request.contextPath}/file/list.jsp";
<%}else{%>
	alert("업로드실패! 다시 업로드 해주세요!");
	location.href="upload_form.jsp"
<%}%>
</script>
</body>
</html>