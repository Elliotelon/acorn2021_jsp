package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/time")
public class TimeServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//응답 인코딩 설정
		resp.setCharacterEncoding("utf-8");
		//응답 컨텐츠 type 설정 (웹브라우저에 어떤 컨텐츠를 응답할것인지 알려서 준비를 시킨다)
		resp.setContentType("text/html;charset=utf-8");
		
		//클라이언트에게 출력할수 있는 객체의 참조값 얻어오기
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>현재 시간 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		//날짜 객체를 생성해서 
		Date d=new Date();
		//현재(service() 메소드가 호출되는 시점) 날짜시간 정보를 문자열로 얻어낸다.
		String info=d.toString();
		//얻어낸 문자열을 html 문서에 끼워넣어서 출력한다.
		pw.println("<p> 현재 시간 : "+info+" </p>");
		//상대경로로 /WebContent/images/kim1.png 출력하기 
		pw.println("<img src='images/kim1.png'/>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}











