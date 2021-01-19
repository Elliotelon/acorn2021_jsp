<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.1.1">
<title>#HashTag</title>
<link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/blog/">
<!-- Bootstrap core CSS -->
<jsp:include page="include/resource.jsp"></jsp:include>
<jsp:include page="include/blogcss.jsp"></jsp:include>
<!-- Custom styles for this template -->
<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
<style>
	.carousel-inner .carousel-item{
		height:15rem;
	}
	#mid{
		height:72rem;
	}
	.blog-footer{
		
	}
</style>
</head>
<body>
<div class="container">
	<header class="blog-header py-3">
   	<div class="row flex-nowrap justify-content-between align-items-center">
      	<div class="col-4 pt-1">
        	<a class="text-muted" href="#"></a>
      	</div>
      	<div class="col-4 text-center">
        	<a class="blog-header-logo text-dark" href="${pageContext.request.contextPath}/index.jsp">#HashTag</a>
      	</div>
      	<div class="col-4 d-flex justify-content-end align-items-center">
        	<a class="text-muted" href="#" aria-label="Search">
          	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
        	</a>
			<c:choose>
				<c:when test="${not empty sessionScope.id }">
					<a class="btn btn-sm btn-outline-dark" href="${pageContext.request.contextPath}/users/private/info.jsp">개인정보</a>
					<a class="btn btn-sm btn-outline-secondary ml-1" href="${pageContext.request.contextPath}/users/logout.jsp">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a>
        			<a class="btn btn-sm btn-outline-dark ml-1" href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a>
				</c:otherwise>
			</c:choose>
	    </div>
    </div>
	</header>

	<div class="nav-scroller py-1 mb-2">
	    <nav class="nav d-flex justify-content-between">
	      <a class="p-2 text-muted" href="all/list.jsp">ALL</a>
	      <a class="p-2 text-muted" href="#">OUTER</a>
	      <a class="p-2 text-muted" href="#">TOP</a>
	      <a class="p-2 text-muted" href="#">BOTTOM</a>
	      <a class="p-2 text-muted" href="#">ESSENTIAL</a>
	      <a class="p-2 text-muted" href="#">LOOKBOOK</a>
	      <a class="p-2 text-muted" href="#">About</a>
	      <a class="p-2 text-muted" href="#">Review</a>
	      <a class="p-2 text-muted" href="#">Personal Pay</a>
	      <a class="p-2 text-muted" href="#">Q&A</a>
	      <a class="p-2 text-muted" href="#">Order</a>
	    </nav>
	</div>	

	<div class="jumbotron p-4 p-md-5 text-white rounded bg-dark">
	    <div class="col-md-12">
	    	<div id="carouselExampleFade" class="img-wrapper carousel slide carousel-fade" data-ride="carousel">
			  <div class="carousel-inner img-wrapper ">
			    <div class="carousel-item img-wrapper active">
			      <img src="images/o1.jpeg" class="d-block w-100 h-100  " >
			    </div>
			    <div class="carousel-item img-wrapper">
			      <img src="images/o2.jpg" class="d-block w-100 h-100" >
			    </div>
			    <div class="carousel-item img-wrapper">
			      <img src="images/o3.jpg" class="d-block w-100 h-100">
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
	    </div>
	</div>

	<div class="row mb-2">
	    <div class="col-md-6">
	      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
	        <div class="col p-4 d-flex flex-column position-static">
	          <strong class="d-inline-block mb-2 text-primary">New</strong>
	          <h3 class="mb-0">card holder</h3>
	          <ul class="card-text mt-3">
	          	<li>Fabrics:Calfskin 100%</li>
	          	<li>Color:Black</li>
	          	<li>Care instructions:Dry Clean</li> 
	          </ul>
	        </div>
	        <div class="col-md-4 d-none d-lg-block img-wrapper">
	          	<img class="card-img-top" src="images/inbag.png"/>
	        </div>
	      </div>
	    </div>
		<div class="col-md-6">
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			  	<div class="col p-4 d-flex flex-column position-static">
			    	<strong class="d-inline-block mb-2 text-danger">Hot</strong>
			    	<h3 class="mb-0">Shoes</h3>
			    	<ul class="card-text mt-3">
			        	<li>Fabrics:real cowskin 100%</li>
			          	<li>Color:Black</li>
			          	<li>Care instructions: Washing Machine</li> 
			       	</ul>
			  	</div>
			  	<div class="col-md-4 d-none d-lg-block img-wrapper">
	          		<img class="card-img-top" src="images/inshoe.png"/>
	        	</div>
			</div>
		</div>
  	</div>
</div>
<div class="container">
	<div class="jumbotron p-4 p-md-5 text-white rounded bg-dark" id="mid">
		<div class="col-md-12" id="mid2">
			<img src="images/inpic.png" class="d-block w-100 h-100" >
			<img src="images/inpic2.png" class="d-block w-100 h-100" >
		</div>
	</div>
	<jsp:include page="include/blogfooter.jsp"></jsp:include>
</div>
</body>
</html>