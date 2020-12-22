<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/sub/fortune.jsp</title>
</head>
<body>
	<%!
		String[] list= {
				"동쪽으로 가면 2 동렬을 만나요",
				"서쪽으로 가면 3 동렬을 만나요",
				"남쪽으로 가면 4 동열을 만나요",
				"북쪽으로 가면 5 동렬을 만나요",
				"로또를 사면 2등이 당첨되요"
		};	
	%>
	<%
		//여기는 java coding 영역 입니다. 서블릿의 service() 메소드 안쪽이라고 생각하면 됩니다.
		Random ran=new Random();
		int index=ran.nextInt(5);
		String fortuneToday=list[index];
	%>
	<p>오늘의 운세 : <%=fortuneToday %></p>
</body>
</html>






