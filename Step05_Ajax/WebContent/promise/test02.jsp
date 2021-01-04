<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promise/test02.jsp</title>
</head>
<body>
<h1>Promise 테스트</h1>
<script>
	//1. Promise 객체를 생성해서 참조값을 p1에 담기
	let p1=new Promise(function(resolve, reject){
		/*
			함수의 인자로 전달되는 resolve, reject는 함수이다.
			resolve는 작업을 완료 했을때 호출 해야하는 함수
			reject는 작업이 실패했을때 호출 해야하는 함수
			resolve 함수가 호출되면 .then() 안에 있는 함수가 자동 호출된다.			
			reject 함수가 호출되면 .catch()안에 있는 함수가 자동 호출된다.
		*/
		//resolve();
		reject();
		console.log("reject 함수를 호출 했습니다.");
	});
	//2. p1 Promise 가 resolve 되었을때 호출되는 함수
	p1.then(function(){
		console.log("then 안에 있는 함수가 호출되었습니다.")
	});
	
	//3. p1 Promise 가 reject 되었을때 호출되는 함수
	p1.catch(function(){
		console.log("catch 안에 있는 함수가 호출되었습니다.")
		
	});
	
	console.log("bye!");
</script>
</body>
</html>