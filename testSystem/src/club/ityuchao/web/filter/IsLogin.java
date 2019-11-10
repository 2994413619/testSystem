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

import club.ityuchao.domain.User;

@WebFilter(filterName="/IsLogin", urlPatterns = {"/teacher/*","/student/*"})
public class IsLogin implements Filter {

    public IsLogin() {
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
		if(user == null) {
			String contextPath = req.getServletContext().getContextPath();
			resp.setContentType("text/html;charset=utf-8");
			resp.getWriter().write("<script>alert('ÇëÏÈµÇÂ¼£¡£¡£¡');location.href='"+contextPath+"/login.jsp';</script>");
		} else {
			chain.doFilter(request, response);
		}
	}
	
}
