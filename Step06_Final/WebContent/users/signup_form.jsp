<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>회원 가입 폼 입니다.</h1>
	<form action="signup.jsp" method="post" id="myForm">
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id"/>
			<div class="invalid-feedback">사용할수 없는 아이디 입니다.</div>
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd"/>
			<div class="invalid-feedback">비밀번호를 확인 하세요.</div>
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2"/>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="email" name="email" id="email"/>
		</div>
		<button class="btn btn-outline-primary" type="submit">가입</button>
	</form>
</div>
<script>
	//폼에 submit 이벤트가 일어났을때 jquery를 활용해서 폼에 입력한 내용 검증하기
	
	//id가 myForm 인 요소에 submit 이벤트가 일어 났을때 실행할 함수 등록
	$("#myForm").on("submit",function(){
		//입력한 두 비밀번호를 읽어와서 다르게 입력했으면 폼 전송 막기
		let pwd1=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		if(pwd1!=pwd2){
			alert("비밀 번호를 확인 하세요!");
			return false; //폼 전송 막기 (jquery)
		}
		
	});
	
	// id가 pwd와 pwd2 인 요소에 input(입력) 이벤트가 일어 났을때 실행할 함수 등록
	$("#pwd, #pwd2").on("input", function(){
		//input 이벤트가 언제 일어나는지 확인 요망!
		//console.log("input!!");
		
		//입력한 두 비밀번호를 읽어온다.
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		//일단 모든 검증 클래스를 제거하고
		$("#pwd").removeClass("is-valid is-invalid");
		
		//두 비밀번호가 같은지 확인해서
		if(pwd==pwd2){//만일 같으면
			//유효하다는 클래스 추가
			$("#pwd").addClass("is-valid");
		}else{//다르면
			//유효하지 않다는 클래스 추가
			$("#pwd").addClass("is-invalid");
		}
	
	});
	
	//아이디 입력란에 입력했을때 실행할 함수 등록
	$("#id").on("input",function(){
		//1.입력한 아이디 읽어와서
		let inputId=$("#id").val();
		//2. 서버에 ajax 요청으로 보내서 사용 가능 여부를 응답 받아서 반응을 보여준다.
		//일단 모든 검증 클래스를 제거하고
		$("#id").removeClass("is-valid is-invalid");
		$.ajax({
			url:"checkid.jsp",
			method:"GET",
			data:"inputId="+inputId,
			success:function(responseData){
				//console.log(responseData.isExist);	
				/*
					checkid.jsp 페이지에서 응답할때
					contentType="application/json" 이라고 설정하면
					함수의 인자로 전달되는 responseData는 object 이다.
					{isExist:true} or {isExist:false}
					형식의 object 이기 떄문에 바로 사용 할 수 있다.
				
				*/
				if(responseData.isExist){//이미 존재하는 아이디인 경우
					$("#id").addClass("is-invalid");
				}else{//존재하지 않는 아이디 즉 사용가능한 아이디인 경우
					$("#id").addClass("is-valid");
				}
			}
		});	
	});
</script>
</body>
</html>