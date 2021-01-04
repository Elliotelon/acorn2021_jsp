<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promise/test03.jsp</title>
</head>
<body>
<h1>Promise 테스트</h1>
<script>
	//아래와 같은 형식으로 작성할수도 있다.
	new Promise(function(resolve,reject){
		resolve();
		console.log("resolve() 호출됨");
	})
	.then(function(){
		console.log("then() 안에 있는 함수 호출됨");
	})
	.catch(function(){
		console.log("catch() 안에 있는 함수 호출됨");
	});
	
	console.log("bye!");
</script>
</body>
</html>