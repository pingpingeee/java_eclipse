package examples;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HelloWorld2")
public class HelloWorld2 extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// text/html : text/html 내용으로 응답을 함
		resp.setContentType("text/html");
		// 객체 생성(out 객체는 웹 브라우저에 출력할 수 있음)
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<head>");
		out.println("<title>");
		out.println("<Hello>");
		out.println("</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<h1>testadfasdfasdf</h1>");
		out.println("</body>");
		out.println("</html>");
	}
}
