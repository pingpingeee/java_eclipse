package examples;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/QueryString")
public class QueryString extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		String id="", name="", vclass="", phone1="", phone2="", phone3="";
		id = request.getParameter("id");
		name = request.getParameter("name");
		vclass = request.getParameter("class");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		out.println("<h1>get방식일 때 호출됨</h1>");
		
//		변수를 이용해서 아래 태그에 값들을 배치
		out.println("<html>");
		out.println("<head>");
		out.println("<body>");
		out.println("당신이 입력한 정보(get)입니다.<br> 아이디 : <b>");
		out.println(id);
		out.println("</b><br> 이름 : <b>");
		out.println(name);
		out.println("</b><br> 구분 : <b>");
		out.println(vclass);
		out.println("</b><br> 전화번호 : ");
		out.println(phone1);
		out.println("-");
		out.println(phone2);
		out.println("-");
		out.println(phone3);
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
	}
}
