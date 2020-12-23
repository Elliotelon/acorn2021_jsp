<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 회원가입폼에 입력한 내용을 하나하나 모두 추출해서 콘솔창에 출력해 보세요.
	
	request.setCharacterEncoding("utf-8");
	
	// <input type="text" name="nick" /> 에 입력한 문자열
	String nick=request.getParameter("nick");
	
	// <input type="radio" name="email" value="yes or no" /> 에 선택값 값
	String email=request.getParameter("email");
	
	// <select name="concern" > 에  선택된 option 값
	String concern=request.getParameter("concern");
	
	// <input type="checkbox" name="language" value="Java or Python or C++"/>
	// 아무것도 check 하지 않았으면 null 이 리턴된다.
	String[] language=request.getParameterValues("language");
	
	// <textarea name="comment" > 에 입력한 문자열
	String comment=request.getParameter("comment");
	
	//콘솔창에 출력
	System.out.println("nick:"+nick);
	System.out.println("email:"+email);
	System.out.println("concern:"+concern);
	System.out.println("--- language ---");
	
	//체크박스의 value 를 저장할 ArrayList 객체 생성
	List<String> languageList=new ArrayList<>();
	
	//만일 체크박스를 하나라도 체크 했다면 
	if(language != null){ 
		for(String tmp:language){
			System.out.println(tmp);
			//ArrayList 객체에 value 를 담는다. 
			languageList.add(tmp);
		}	
	}
	System.out.println("comment:"+comment);
	
	//DB 에 저장하기
	
	//체크 박스에 체크된 내용을 DB 에 저장하기 위해서 가공하기
	String lan=null;
	if(language != null){
		//일단 빈 문자열을 넣어주고 
		lan="";
		for(int i=0; i<language.length; i++){
			//만일 i 가 배열의 마지막 인덱스가 아니라면
			if(i != language.length-1){
				// lan 에 문자열을 이어 붙이고 뒤에  , 를 붙인다.
				lan += language[i]+",";
			}else{
				//마지막 인덱스이면  lan 에 문자열을 이어 붙이고 뒤에 , 는 붙이지 않는다. 
				lan += language[i];
			}
		}
	}
	//1. 원래는 전송된 정보를 dto 에 넣은다음
	
	//2. Dao 를 이용해서 DB 에 저장
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	int flag = 0;
	try {
		conn = new DbcpBean().getConn();
		//실행할 insert, update, delete 문 구성
		String sql = "INSERT INTO form_test"
			+ " (nick, email, concern, lan, comm)"
			+ " VALUES(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		//? 에 바인딩할 내용이 있으면 바인딩한다.
		pstmt.setString(1, nick);
		pstmt.setString(2, email);
		pstmt.setString(3, concern);
		pstmt.setString(4, lan);
		pstmt.setString(5, comment);
		flag = pstmt.executeUpdate(); //sql 문 실행하고 변화된 row 갯수 리턴 받기
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
</head>
<body>
	<a href="info.jsp?nick=<%=nick%>">DB 에 저장된 내용 불러오기</a>
	<h1>폼에 입력한 내용</h1>
	<form action="signup.jsp" method="post">
		닉네임 <input type="text" name="nick" value="<%=nick %>"/><br/>
		이메일 수신 여부
		<%if(email.equals("yes")){ %>
			<label>
				<input type="radio" name="email" value="yes" checked/> 네
			</label>
			<label>
				<input type="radio" name="email" value="no"/> 아니요
			</label>
		<%}else{ %>
			<label>
				<input type="radio" name="email" value="yes" /> 네
			</label>
			<label>
				<input type="radio" name="email" value="no" checked/> 아니요
			</label>
		<%} %>
		<br/>
		이메일 수신 여부    
		<label>
			<input type="radio" name="email2" value="yes" 
				<%if(email.equals("yes")){ %>checked<%} %>/> 네
		</label>
		<label>
			<input type="radio" name="email2" value="no" 
				<%if(email.equals("no")){ %>checked<%} %>/> 아니요
		</label>
		<br/>	
		이메일 수신 여부   
		<label>
			<input type="radio" name="email3" value="yes" 
				<%=email.equals("yes") ? "checked" : "" %>/> 네
		</label>
		<label>
			<input type="radio" name="email3" value="no" 
				<%=email.equals("no") ? "checked" : "" %>/> 아니요
		</label>
		<br/>
		관심사 
		<select name="concern">
			<option value="">선택</option>
			<option value="game" <%=concern.equals("game") ? "selected" : "" %>>게임</option>
			<option value="movie" <%=concern.equals("movie") ? "selected" : "" %>>영화</option>
			<option value="etc" <%=concern.equals("etc") ? "selected" : "" %>>기타</option>
		</select>
		<br/>
		배우고 싶은 언어 체크
		<label>
			<input type="checkbox" name="language" value="Java" 
				<%=languageList.contains("Java") ? "checked" : "" %>/> 자바
		</label>
		<label>
			<input type="checkbox" name="language" value="Python"
				<%=languageList.contains("Python") ? "checked" : "" %>/> 파이선
		</label>
		<label>
			<input type="checkbox" name="language" value="C++" 
				<%=languageList.contains("C++") ? "checked" : "" %>/> C++
		</label>
		<br/>
		남기고 싶은 말
		<textarea name="comment" cols="30" rows="10"><%=comment %></textarea>
		<br/>
		<button type="submit">가입</button>
	</form>	
</body>
</html>




