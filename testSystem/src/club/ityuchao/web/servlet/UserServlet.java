package club.ityuchao.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.omg.PortableInterceptor.RequestInfoOperations;

import club.ityuchao.domain.Question;
import club.ityuchao.domain.Student;
import club.ityuchao.domain.Teacher;
import club.ityuchao.domain.User;
import club.ityuchao.service.UserService;
import club.ityuchao.service.QuestionService;
import club.ityuchao.utils.MailUtils;

/**
 * 
 * @author ����
 * @date 2018��11��30��
 * @Description ��ʾ��ҳ��Ϣ����ʦ��ѧ��ע���¼
 *
 */
@WebServlet("/User")
public class UserServlet extends BaseServlet {
	
	/**
	 * @Description ��ʦע�᣺��ʦ�û�ע��
	 * @date 2018��11��30��
	 */
	public void teacherRegister(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		//1�����ݷ�װ
		Map<String, String[]> parameterMap = request.getParameterMap();
		Teacher teacher = new Teacher();
		
		//1.1�Զ���ת���������ַ���ת��Ϊdate����
		ConvertUtils.register(new Converter() {
			
			@Override
			public Object convert(Class clazz, Object value) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date parse = null;
				try {
					parse = simpleDateFormat.parse(value.toString());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return parse;
			}
		}, Date.class);
		try {
			BeanUtils.populate(teacher, parameterMap);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.2�ж��û��Ƿ���ע�������ֹ�û���ע��ɹ���ʾҳ���ظ�ˢ��
		UserService userService = new UserService();
		Teacher isEixstTeacher = userService.getTeacherByUserName(teacher.getUserName());
		response.setContentType("text/html;charset=UTF-8");
		if(isEixstTeacher!=null) {
			response.getWriter().write("<script>alert('���û���ע�ᣬ�뵽"+teacher.getEmail()+"�����û�')</script>");
			return ;
		}
		
		//1.3��װǰ��δ����������
		teacher.setUserType(1);//�û�����
		teacher.setStatus(0);//�û�δ����
		teacher.setCode(UUID.randomUUID().toString());//������
		teacher.setRootPermit(0);//����Աδ���
		teacher.setIsLock(0);//�û�δ����
		teacher.setRegisterTime(new Date());//�û�ע��ʱ��
		
		//2.�ѷ�װ�õ�teacher���ݵ�service��
		boolean isSuccess = userService.teacherRegister(teacher);
		
		//3���ݽ����ǰ̨��ʾ��Ϣ
		if(isSuccess) {
			response.getWriter().write("<script>alert('��ϲ�㣬ע��ɹ����뵽"+teacher.getEmail()+"�����û�')</script>");
			
			//4�������ʼ������û�
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String registerTime = format.format(teacher.getRegisterTime());
				String subject = "����ϵͳ����ʦ�û�����";
				String emailMsg = "����"+registerTime+",ע����testSystem�Ľ�ʦ�û���������Ｄ����û���"
						+ "<a href='http://localhost:8080/testSystem/User?"
						+ "method=actionTeacher&code="+teacher.getCode()+"&userName="+teacher.getUserName()+"'>����</a>";
				MailUtils.sendMail(teacher.getEmail(), subject, emailMsg);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
		} else {
			response.getWriter().write("<script>alert('ע��ʧ�ܣ�����ϵ����Ա')</script>");
		}
		
	}
	
	/**
	 * @Description ��ʦע�᣺�����ʦ�û����Ƿ����
	 * @date 2018��12��2�� ����1:07:20
	 */
	public void existTeacherUsername(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1����request�л�ȡ�û���
		String userName = request.getParameter("userName");
		//2�����û������ݵ�service��
		UserService userService = new UserService();
		boolean isSuccess = userService.existTeacherUsername(userName);
		//3���Ѽ������Ӧ��ǰ̨��true��ʾ�û������ã�false������
		response.getWriter().write(isSuccess+"");
	}
	
	/**
	 * @Description ��ʦע�᣺���伤����ʦ�û�
	 * @date 2018��12��2�� ����2:48:51
	 */
	public void actionTeacher(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1�����ݷ�װ����request�л�ȡcode��userName
		String code = request.getParameter("code");
		String userName = request.getParameter("userName");
		Teacher teacher = new Teacher();
		teacher.setCode(code);
		teacher.setUserName(userName);
		//2�����ݵ�service��
		UserService userService = new UserService();
		boolean isSuccess = userService.actionTeacher(teacher);
		//3�����ݽ����ǰ̨��Ϣ������
		response.setContentType("text/html;charset=UTF-8");
		if(isSuccess) {
			response.getWriter().write("<script>alert('��ϲ�㣬����ɹ����ȴ�����Ա��ˣ�5�����ת����¼����');"
					+ "setTimeout(function(){location.href='http://localhost:8080/testSystem/login.jsp';},5000)</script>");
		} else {
			response.getWriter().write("<script>alert('����ʧ�ܣ�')</script>");
		}
	}
	
	
	/**
	 * @Description ע�᣺�����֤��
	 * @date 2018��12��2�� ����12:34:07
	 */
	public void getVcode(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		//1����session�л����֤��word
		HttpSession session = request.getSession();
		Object word = session.getAttribute("word");
		//2������֤����Ӧ��ǰ̨
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(word.toString());
	}
	
	
	/**
	 * 
	 * @Description ѧ��ע�᣺�����ʦ����Ƿ����
	 * @date 2018��12��2�� ����5:58:29
	 */
	public void existTeacherId(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1����request�л�ȡ��ʦ���teacherId
		String teacherId = request.getParameter("teacherId");
		//2����teacherId���ݵ�service��
		UserService userService = new UserService();
		boolean isExist = userService.existTeacherId(teacherId);
		//3����Ӧ�����ǰ̨
		response.getWriter().write(""+isExist);
	}
	
	/**
	 * @Description ѧ��ע�᣺���ѧ���û����Ƿ����
	 * @date 2018��12��2�� ����6:28:14
	 */
	public void existStudentUsername(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1����request�л�ȡ�û���
		String userName = request.getParameter("userName");
		//2�����û������ݵ�service��
		UserService userService = new UserService();
		boolean isSuccess = userService.existStudentUsername(userName);
		//3���Ѽ������Ӧ��ǰ̨��true��ʾ�û������ã�false������
		response.getWriter().write(isSuccess+"");
	}
	
	/**
	 * 
	 * @Description ѧ��ע�᣺ѧ���û�ע��
	 * @date 2018��12��2�� ����6:54:44
	 */
	public void studentRegister(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		//1�����ݷ�װ
		Map<String, String[]> parameterMap = request.getParameterMap();
		Student student = new Student();
		
		//1.1�Զ���ת���������ַ���ת��Ϊdate����
		ConvertUtils.register(new Converter() {
			
			@Override
			public Object convert(Class clazz, Object value) {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date parse = null;
				try {
					parse = simpleDateFormat.parse(value.toString());
				} catch (ParseException e) {
					e.printStackTrace();
				}
				return parse;
			}
		}, Date.class);
		try {
			BeanUtils.populate(student, parameterMap);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.2�ж��û��Ƿ���ע�������ֹ�û���ע��ɹ���ʾҳ���ظ�ˢ��
		UserService userService = new UserService();
		Student isEixstStudent = userService.getStudentByUserName(student.getUserName());
		response.setContentType("text/html;charset=UTF-8");
		if(isEixstStudent!=null) {
			response.getWriter().write("<script>alert('���û���ע�ᣬ�뵽"+student.getEmail()+"�����û�')</script>");
			return ;
		}
		
		//1.3��װǰ��δ����������
		student.setUserType(0);//�û�����
		student.setStatus(0);//�û�δ����
		student.setCode(UUID.randomUUID().toString());//������
		student.setIsLock(0);//�û�δ����
		student.setRegisterTime(new Date());//�û�ע��ʱ��
		
		//2.�ѷ�װ�õ�teacher���ݵ�service��
		boolean isSuccess = userService.studentRegister(student);
		
		//3���ݽ����ǰ̨��ʾ��Ϣ
		if(isSuccess) {
			response.getWriter().write("<script>alert('��ϲ�㣬ע��ɹ����뵽"+student.getEmail()+"�����û�')</script>");
			
			//4�������ʼ������û�
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String registerTime = format.format(student.getRegisterTime());
				String subject = "����ϵͳ��ѧ���û�����";
				String emailMsg = "����"+registerTime+",ע����testSystem��ѧ���û���������Ｄ����û���"
						+ "<a href='http://localhost:8080/testSystem/User?"
						+ "method=actionStudent&code="+student.getCode()+"&userName="+student.getUserName()+"'>����</a>";
				MailUtils.sendMail(student.getEmail(), subject, emailMsg);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
		} else {
			response.getWriter().write("<script>alert('ע��ʧ�ܣ�����ϵ����Ա')</script>");
		}
		
	}
	
	/**
	 * 
	 * @Description ѧ��ע�᣺���伤��ѧ���û�
	 * @date 2018��12��2�� ����7:01:42
	 */
	public void actionStudent(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1�����ݷ�װ����request�л�ȡcode��userName
		String code = request.getParameter("code");
		String userName = request.getParameter("userName");
		Student student = new Student();
		student.setCode(code);
		student.setUserName(userName);
		//2�����ݵ�service��
		UserService userService = new UserService();
		boolean isSuccess = userService.actionStudent(student);
		//3�����ݽ����ǰ̨��Ϣ������
		response.setContentType("text/html;charset=UTF-8");
		if(isSuccess) {
			response.getWriter().write("<script>alert('��ϲ�㣬����ɹ���5�����ת����¼����');"
					+ "setTimeout(function(){location.href='http://localhost:8080/testSystem/login.jsp';},5000)</script>");
		} else {
			response.getWriter().write("<script>alert('����ʧ�ܣ�')</script>");
		}
	}
	
	/**
	 * @Description ѧ����¼
	 * @date 2018��12��2�� ����9:05:38
	 */
	public void studentLogin(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1����request�л�ȡ�û������룬���з�װ
		Student student = new Student();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		student.setUserName(userName);
		student.setPassword(password);
		
		//2�������ݴ��ݵ�service��
		UserService userService = new UserService();
		int loginStatus= userService.studentLogin(student);
		
		//3���ɹ���¼
		if(loginStatus == 0) {
			//3.1��student����д��session��
			student = userService.getStudentByUserName(userName);
			HttpSession session = request.getSession();
			User user = new User();
			user.setStudent(student);
			session.setAttribute("user", user);
			
			//3.2�ж��Ƿ��Զ���¼
			String autoLogin = request.getParameter("autoLogin");
			if("autoLogin".equals(autoLogin)) {
				//3.2.1�û�����
				Cookie userTypeIdCookie = new Cookie("userType", student.getUserType()+"");
				userTypeIdCookie.setMaxAge(604800);
				//3.2.2�û���
				Cookie userNameCookie = new Cookie("userName", student.getUserName());
				userNameCookie.setMaxAge(604800);
				//3.2.3����
				Cookie passwordCookie = new Cookie("password", student.getPassword());
				passwordCookie.setMaxAge(604800);
				//��cookie��ӵ�response��
				response.addCookie(userTypeIdCookie);
				response.addCookie(userNameCookie);
				response.addCookie(passwordCookie);
			}
		}
		
		//4����������Ӧ��ǰ�ˣ�0�ɵ�¼��1�û������ڣ�2�������
		response.getWriter().write(loginStatus+"");
		
	}
	
	/**
	 * @Description ��ʦ��¼
	 * @date 2018��12��2�� ����9:15:11
	 */
	public void teacherLogin(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1����request�л�ȡ�û������룬���з�װ
		Teacher teacher = new Teacher();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		teacher.setUserName(userName);
		teacher.setPassword(password);
		
		//2�������ݴ��ݵ�service��
		UserService userService = new UserService();
		int loginStatus= userService.teacherLogin(teacher);
		
		//3���ɹ���¼
		if(loginStatus == 0) {
			//3.1��teacher����д��session��
			teacher = userService.getTeacherByUserName(userName);
			HttpSession session = request.getSession();
			User user = new User();
			user.setTeacher(teacher);
			session.setAttribute("user", user);
			
			//3.2�ж��Ƿ��Զ���¼
			String autoLogin = request.getParameter("autoLogin");
			if("autoLogin".equals(autoLogin)) {
				//3.2.1�û�����
				Cookie userTypeIdCookie = new Cookie("userType", teacher.getUserType()+"");
				userTypeIdCookie.setMaxAge(604800);
				//3.2.2�û���
				Cookie userNameCookie = new Cookie("userName", teacher.getUserName());
				userNameCookie.setMaxAge(604800);
				//3.2.3����
				Cookie passwordCookie = new Cookie("password", teacher.getPassword());
				passwordCookie.setMaxAge(604800);
				//��cookie��ӵ�response��
				response.addCookie(userTypeIdCookie);
				response.addCookie(userNameCookie);
				response.addCookie(passwordCookie);
			}
		}
		
		//4����������Ӧ��ǰ�ˣ�0�ɵ�¼��1�û������ڣ�2�������
		response.getWriter().write(loginStatus+"");
		
	}
	
	/**
	 * 
	 * @Description ѧ���û�ע��
	 * @date 2018��12��2�� ����11:53:27
	 */
	public void logoutStudent(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1.��sessionɾ��student
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		//2.ɾ��cookie���ÿ��ַ�������
		//2.1�û�����
		Cookie userTypeIdCookie = new Cookie("userTypeId", "");
		userTypeIdCookie.setMaxAge(0);
		//2.2�û���
		Cookie userNameCookie = new Cookie("userName", "");
		userNameCookie.setMaxAge(0);
		//2.3����
		Cookie passwordCookie = new Cookie("password", "");
		passwordCookie.setMaxAge(0);
		//2.4��cookie��ӵ�response��
		response.addCookie(userTypeIdCookie);
		response.addCookie(userNameCookie);
		response.addCookie(passwordCookie);
		
		//3.��ת����ҳ
		response.sendRedirect(request.getContextPath()+"/Index?method=index");
	}

	/**
	 * 
	 * @Description ��ʦ�û�ע��
	 * @date 2018��12��3�� ����12:01:01
	 */
	public void logoutTeacher(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1.��sessionɾ��student
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		//2.ɾ��cookie���ÿ��ַ�������
		//2.1�û�����
		Cookie userTypeIdCookie = new Cookie("userTypeId", "");
		userTypeIdCookie.setMaxAge(0);
		//2.2�û���
		Cookie userNameCookie = new Cookie("userName", "");
		userNameCookie.setMaxAge(0);
		//2.3����
		Cookie passwordCookie = new Cookie("password", "");
		passwordCookie.setMaxAge(0);
		//2.4��cookie��ӵ�response��
		response.addCookie(userTypeIdCookie);
		response.addCookie(userNameCookie);
		response.addCookie(passwordCookie);
		
		//3.��ת����ҳ
		response.sendRedirect(request.getContextPath()+"/Index?method=index");
	}

	/**
	 * 
	 * @Description ����û���Ϣ
	 * @date 2018��12��27�� ����8:58:05
	 */
	/*public void getUser(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1.����û����ͺ��û�Id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int userId = 0;
		int userType = 0;
		if(user != null) {
			if(user.getStudent() == null) {
				userId = user.getTeacher().getTeacherId();
				userType = 1;
			} else {
				userId = user.getStudent().getStudentId();
			}
		}
		
		//2.
		UserService userService = new UserService();
		useruserService.getUser(userType, userId);
		
	}*/
	
}
