package test.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send")//3.
public class SendServlet extends HttpServlet{//1.
	//2.
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트가 요청과 함께 전송한 문자열을 추출하기
		String a=req.getParameter("msg");
		System.out.println("클라이언트가 전송한 문자열:"+a);
		//간단한 문자열 응답하기
		PrintWriter pw=resp.getWriter();
		pw.println("/send okay~");
		pw.close();
	}
}






