<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>promise/test01.jsp</title>
</head>
<body>
<h1>비동기 테스트</h1>
<script>
	//주어진 작업을 처리 하는 함수 (주어진 작업을 처리하는데 5초 걸린다고 가정하자)
	/*function work(job, callback){
		//5초 지연시켜서 함수 호출하기
		setTimeout(function(){
			console.log(job+" 을 수행 완료했습니다.")
			callback();
		},5000);
	}
	
	work("달리기",function(){
		work("쉬기",function(){
			work("물마시기",function(){
				
			});
		});
	});
	*/
	
	//1. Promise 객체를 생성해서 참조값을 p1에 담기
	let p1=new Promise(function(resolve){
		/*
			함수의 인자로 전달되는 resolve는 함수이다.
			resolve는 작업을 완료 했을때 호출 해야하는 함수
			resolve 함수가 호출되면 .then() 안에 있는 함수가 자동 호출된다.			
		
		*/
		resolve();
		console.log("resolve 함수를 호출 했습니다.");
	});
	//2. p1 Promise 가 resolve 되었을때 호출되는 함수
	p1.then(function(){
		console.log("then 안에 있는 함수가 호출되었습니다.")
	});
	
	console.log("bye!");
</script>
</body>
</html>