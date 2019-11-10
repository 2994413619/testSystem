package club.ityuchao.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author ����
 * @date 2018��11��30��
 * @Description ����servlet����
 *
 */
public class BaseServlet extends HttpServlet {

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Class clazz = this.getClass();
		String methodName = req.getParameter("method");
		try {
			Method method = clazz.getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
			method.invoke(this, req, resp);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}
}
