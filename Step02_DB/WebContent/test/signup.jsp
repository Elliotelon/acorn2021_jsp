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
	//만일 체크박스를 하나라도 체크 했다면 
	if(language != null){ 
		for(String tmp:language){
			System.out.println(tmp);
		}	
	}
	System.out.println("comment:"+comment);
%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
</head>
<body>
	<h1>폼에 입력한 내용</h1>
	<form action="signup.jsp" method="post">
		닉네임 <input type="text" name="nick" value="<%=nick %>"/><br/>
		이메일 수신 여부
		<label>
			<input type="radio" name="email" value="yes" checked="checked"/> 네
		</label>
		<label>
			<input type="radio" name="email" value="no"/> 아니요
		</label>
		<br/>
		관심사 
		<select name="concern">
			<option value="">선택</option>
			<option value="game">게임</option>
			<option value="movie">영화</option>
			<option value="etc">기타</option>
		</select>
		<br/>
		배우고 싶은 언어 체크
		<label>
			<input type="checkbox" name="language" value="Java"/> 자바
		</label>
		<label>
			<input type="checkbox" name="language" value="Python"/> 파이선
		</label>
		<label>
			<input type="checkbox" name="language" value="C++"/> C++
		</label>
		<br/>
		남기고 싶은 말
		<textarea name="comment" cols="30" rows="10"></textarea>
		<br/>
		<button type="submit">가입</button>
	</form>	
</body>
</html>




