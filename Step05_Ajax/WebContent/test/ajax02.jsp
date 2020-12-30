<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test/ajax02.jsp</title>
</head>
<body>
	<input type="text" id="inputmsg" placeholder="서버에 전송할 문자열 입력..." />
	<button id="sendBtn">전송</button>
	<script>
		document.querySelector("#sendBtn").addEventListener("click",function(){
			//입력한 문자열 읽어오기
			let msg=document.querySelector("#inputmsg").value;
			//fetch() 함수를 호출하면서 GET 방식 파라미터로 전달하기
			fetch("send.jsp?msg="+msg)
			.then(function(response){
				return response.text();
			})
			.then(function(data){
				console.log(data);
			});
		});
	
	</script>
	
</body>
</html>