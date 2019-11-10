package club.ityuchao.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import club.ityuchao.domain.Student;
import club.ityuchao.domain.Teacher;
import club.ityuchao.domain.User;
import club.ityuchao.service.UserService;

@WebFilter(filterName="AutoLogin", urlPatterns = "/*")
public class AutoLogin implements Filter {

    public AutoLogin() {
    }

	public void destroy() {
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession();
		Cookie[] cookies = req.getCookies();
		
		//1、判断是否登录:未登录执行自动登录操作
		if(session.getAttribute("user") == null && cookies != null) {
			
			String userType = null;
			String userName = null;
			String password = null;
			
			//2、遍历cookie，获得其中的值
			for (Cookie cookie : cookies) {
				if("userType".equals(cookie.getName())) {
					userType = cookie.getValue();
				}
				if("userName".equals(cookie.getName())) {
					userName = cookie.getValue();
				}
				if("password".equals(cookie.getName())) {
					password = cookie.getValue();
				}
			}
			
			//3、是否可以自动登录（cookie中有user信息）
			if(userType != null && userName != null && password != null) {
				
				UserService userService = new UserService();
				
				if("0".equals(userType)) {
					//学生用户自动登录
					Student student = userService.getStudentByUserName(userName);
					
					if(student != null && password.equals(student.getPassword())) {
						User user = new User();
						user.setStudent(student);
						session.setAttribute("user", user);
					}
					
				} else if("1".equals(userType)) {
					//老师用户自动登录
					Teacher teacher = userService.getTeacherByUserName(userName);
					
					if(teacher != null && password.equals(teacher.getPassword())) {
						User user = new User();
						user.setTeacher(teacher);
						session.setAttribute("user", user);
					}
				}
			}
		}
		
		//无论是否登录，用不用自动登录都“放行”。
		chain.doFilter(request, response);
		
	}
	
}
