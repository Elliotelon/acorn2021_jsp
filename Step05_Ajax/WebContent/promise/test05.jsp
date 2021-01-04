<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promise/test05.jsp</title>
</head>
<body>
<h1>Promise 테스트</h1>
<script>
	
	//Promise 객체를 리턴해주는 함수
	function getPromise(){
		let p1=new Promise(function(resolve,reject){
			//비동기 작업의 결과 데이터가 있다면
			let data={num:1, name:"김구라"};
			//resolve() 함수를 호출하면서 전달할 수 있다.
			resolve(data);
			console.log("resolve() 호출됨");
		});
		return p1;
	}
	
	
	//Promise 객체를 리턴해주는 함수를 호출해서 사용하기
	getPromise()
	.then(function(result){
		//resolve() 함수에 전달된 값이 then() 안에 있는 함수의 인자로 전달된다.
		console.log(result);
		console.log("then() 안에 있는 함수 호출됨");
	})
	.catch(function(){
		console.log("catch() 안에 있는 함수 호출됨");
	});
	
	console.log("bye!");
</script>
</body>
</html>