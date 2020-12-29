package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/test/save")
public class SaveServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		//폼 전송되는 닉네임 읽어오기
		String nick=req.getParameter("nick");
		//session scope에 저장하기
		HttpSession session=req.getSession(); //HttpServletRequest 객체를 이용해서 얻어온다.
		session.setAttribute("nick", nick);
		//응답하기
		PrintWriter pw=resp.getWriter();
		pw.println("nick save ok!");
		pw.close();
	}
	
}
