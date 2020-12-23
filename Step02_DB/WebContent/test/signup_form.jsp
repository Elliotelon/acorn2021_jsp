<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup_form.jsp</title>
</head>
<body>
	<!-- 
		signup.jsp 페이지에서 폼 전송되는 내용을 아래의 테이블에 저장되는 기능을 구현해 보세요.
		
		lan 칼럼에는 선택하지 않으면 NULL 을 넣고
		Java 를 선택하면 Java
		Java 와 Python 을 선택하면  Java,Python
		Java 와 Python 과 C++ 를 선택하면 Java,Python,C++  
		문자열이 저장되도록 하세요. 
		
		CREATE TABLE form_test(
			nick VARCHAR2(20) PRIMARY KEY,
			email CHAR(3),
			concern VARCHAR2(10),
			lan VARCHAR2(30),
			comm CLOB 
		);
	 -->
	<h1>회원 가입 폼 입니다.</h1>
	<form action="signup.jsp" method="post">
		닉네임 <input type="text" name="nick" /><br/>
		이메일 수신 여부
		<label>
			<input type="radio" name="email" value="yes" checked/> 네
		</label>
		<label>
			<input type="radio" name="email" value="no" /> 아니요
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


