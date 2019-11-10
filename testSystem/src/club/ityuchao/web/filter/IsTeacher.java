package club.ityuchao.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import club.ityuchao.domain.Teacher;
import club.ityuchao.domain.User;

@WebFilter(filterName="/IsTeacher",urlPatterns="/teacher/*")
public class IsTeacher implements Filter {

    public IsTeacher() {
    }

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		Teacher teacher = null;
		if(user != null) {
			teacher = user.getTeacher();
		}
		if(teacher == null) {
			String contextPath = req.getServletContext().getContextPath();
			resp.sendRedirect(contextPath+"/welcome.jsp");
		} else {
			chain.doFilter(request, response);
		}
	}
	
}
