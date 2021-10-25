package exercises1_2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ExercisesServlet2
 */
@WebServlet("/exercises2")
public class ExercisesServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String value1 = request.getParameter("value1");
		String value2 = request.getParameter("value2");

		String disp;

		/*
		 * else { disp = "値が不正です。数値を入力してください。";
		 *
		 * }
		 */
		// disp = a + "足す" + b + "は" + c + "です。";

		if (value1.isEmpty() || value2.isEmpty()) { // パラメーターが存在するかのチェック
			disp = "両方のテキストとボックスに値を入れてください。";
		} else {
			int intValue1 = Integer.parseInt(value1);
			int intValue2 = Integer.parseInt(value2);
			disp =  intValue1 + "足す" +  intValue2 + "は" + ( intValue1 +  intValue2) + "です。";
		}

		// レスポンス処理
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE html>");
		out.println("<html lang=\"ja\">");
		out.println("<head>");
		out.println("<meta charset=\"UTF-8\">");
		out.println("<title>計算結果を表示する</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<main>");
		out.println("<header><h1>計算結果を表示する</h1></header>");
		out.println("<main>");
		out.println("<hr>");
		out.println("<p>" + disp + "</p>");
		out.println("</main>");
		out.println("</body>");
		out.println("</html>");
		out.close();

	}

}
