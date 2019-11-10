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
		
		//1���ж��Ƿ��¼:δ��¼ִ���Զ���¼����
		if(session.getAttribute("user") == null && cookies != null) {
			
			String userType = null;
			String userName = null;
			String password = null;
			
			//2������cookie��������е�ֵ
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
			
			//3���Ƿ�����Զ���¼��cookie����user��Ϣ��
			if(userType != null && userName != null && password != null) {
				
				UserService userService = new UserService();
				
				if("0".equals(userType)) {
					//ѧ���û��Զ���¼
					Student student = userService.getStudentByUserName(userName);
					
					if(student != null && password.equals(student.getPassword())) {
						User user = new User();
						user.setStudent(student);
						session.setAttribute("user", user);
					}
					
				} else if("1".equals(userType)) {
					//��ʦ�û��Զ���¼
					Teacher teacher = userService.getTeacherByUserName(userName);
					
					if(teacher != null && password.equals(teacher.getPassword())) {
						User user = new User();
						user.setTeacher(teacher);
						session.setAttribute("user", user);
					}
				}
			}
		}
		
		//�����Ƿ��¼���ò����Զ���¼�������С���
		chain.doFilter(request, response);
		
	}
	
}
