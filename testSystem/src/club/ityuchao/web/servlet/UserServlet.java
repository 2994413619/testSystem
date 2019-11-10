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
 * @author 喻超
 * @date 2018年11月30日
 * @Description 显示主页信息、老师、学生注册登录
 *
 */
@WebServlet("/User")
public class UserServlet extends BaseServlet {
	
	/**
	 * @Description 老师注册：老师用户注册
	 * @date 2018年11月30日
	 */
	public void teacherRegister(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		//1、数据封装
		Map<String, String[]> parameterMap = request.getParameterMap();
		Teacher teacher = new Teacher();
		
		//1.1自定义转换器——字符串转化为date日期
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
		
		//1.2判断用户是否已注册过，防止用户在注册成功提示页面重复刷新
		UserService userService = new UserService();
		Teacher isEixstTeacher = userService.getTeacherByUserName(teacher.getUserName());
		response.setContentType("text/html;charset=UTF-8");
		if(isEixstTeacher!=null) {
			response.getWriter().write("<script>alert('该用户已注册，请到"+teacher.getEmail()+"激活用户')</script>");
			return ;
		}
		
		//1.3封装前端未传来的数据
		teacher.setUserType(1);//用户类型
		teacher.setStatus(0);//用户未激活
		teacher.setCode(UUID.randomUUID().toString());//激活码
		teacher.setRootPermit(0);//管理员未审核
		teacher.setIsLock(0);//用户未锁定
		teacher.setRegisterTime(new Date());//用户注册时间
		
		//2.把封装好的teacher传递到service层
		boolean isSuccess = userService.teacherRegister(teacher);
		
		//3根据结果给前台提示信息
		if(isSuccess) {
			response.getWriter().write("<script>alert('恭喜你，注册成功，请到"+teacher.getEmail()+"激活用户')</script>");
			
			//4、发送邮件激活用户
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String registerTime = format.format(teacher.getRegisterTime());
				String subject = "考试系统，老师用户激活";
				String emailMsg = "您在"+registerTime+",注册了testSystem的教师用户，点击这里激活该用户："
						+ "<a href='http://localhost:8080/testSystem/User?"
						+ "method=actionTeacher&code="+teacher.getCode()+"&userName="+teacher.getUserName()+"'>激活</a>";
				MailUtils.sendMail(teacher.getEmail(), subject, emailMsg);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
		} else {
			response.getWriter().write("<script>alert('注册失败！请联系管理员')</script>");
		}
		
	}
	
	/**
	 * @Description 老师注册：检查老师用户名是否存在
	 * @date 2018年12月2日 下午1:07:20
	 */
	public void existTeacherUsername(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1、从request中获取用户名
		String userName = request.getParameter("userName");
		//2、把用户名传递到service层
		UserService userService = new UserService();
		boolean isSuccess = userService.existTeacherUsername(userName);
		//3、把检查结果响应给前台，true表示用户名可用，false不可用
		response.getWriter().write(isSuccess+"");
	}
	
	/**
	 * @Description 老师注册：邮箱激活老师用户
	 * @date 2018年12月2日 下午2:48:51
	 */
	public void actionTeacher(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1、数据封装，从request中获取code和userName
		String code = request.getParameter("code");
		String userName = request.getParameter("userName");
		Teacher teacher = new Teacher();
		teacher.setCode(code);
		teacher.setUserName(userName);
		//2、传递到service层
		UserService userService = new UserService();
		boolean isSuccess = userService.actionTeacher(teacher);
		//3、跟据结果给前台信息并处理
		response.setContentType("text/html;charset=UTF-8");
		if(isSuccess) {
			response.getWriter().write("<script>alert('恭喜你，激活成功！等待管理员审核，5秒后跳转到登录界面');"
					+ "setTimeout(function(){location.href='http://localhost:8080/testSystem/login.jsp';},5000)</script>");
		} else {
			response.getWriter().write("<script>alert('激活失败！')</script>");
		}
	}
	
	
	/**
	 * @Description 注册：检测验证码
	 * @date 2018年12月2日 下午12:34:07
	 */
	public void getVcode(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		//1、从session中获得验证码word
		HttpSession session = request.getSession();
		Object word = session.getAttribute("word");
		//2、把验证码响应给前台
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(word.toString());
	}
	
	
	/**
	 * 
	 * @Description 学生注册：检测老师编号是否存在
	 * @date 2018年12月2日 下午5:58:29
	 */
	public void existTeacherId(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1、从request中获取老师编号teacherId
		String teacherId = request.getParameter("teacherId");
		//2、把teacherId传递到service层
		UserService userService = new UserService();
		boolean isExist = userService.existTeacherId(teacherId);
		//3、响应结果给前台
		response.getWriter().write(""+isExist);
	}
	
	/**
	 * @Description 学生注册：检测学生用户名是否存在
	 * @date 2018年12月2日 下午6:28:14
	 */
	public void existStudentUsername(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1、从request中获取用户名
		String userName = request.getParameter("userName");
		//2、把用户名传递到service层
		UserService userService = new UserService();
		boolean isSuccess = userService.existStudentUsername(userName);
		//3、把检查结果响应给前台，true表示用户名可用，false不可用
		response.getWriter().write(isSuccess+"");
	}
	
	/**
	 * 
	 * @Description 学生注册：学生用户注册
	 * @date 2018年12月2日 下午6:54:44
	 */
	public void studentRegister(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		request.setCharacterEncoding("UTF-8");
		//1、数据封装
		Map<String, String[]> parameterMap = request.getParameterMap();
		Student student = new Student();
		
		//1.1自定义转换器——字符串转化为date日期
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
		
		//1.2判断用户是否已注册过，防止用户在注册成功提示页面重复刷新
		UserService userService = new UserService();
		Student isEixstStudent = userService.getStudentByUserName(student.getUserName());
		response.setContentType("text/html;charset=UTF-8");
		if(isEixstStudent!=null) {
			response.getWriter().write("<script>alert('该用户已注册，请到"+student.getEmail()+"激活用户')</script>");
			return ;
		}
		
		//1.3封装前端未传来的数据
		student.setUserType(0);//用户类型
		student.setStatus(0);//用户未激活
		student.setCode(UUID.randomUUID().toString());//激活码
		student.setIsLock(0);//用户未锁定
		student.setRegisterTime(new Date());//用户注册时间
		
		//2.把封装好的teacher传递到service层
		boolean isSuccess = userService.studentRegister(student);
		
		//3根据结果给前台提示信息
		if(isSuccess) {
			response.getWriter().write("<script>alert('恭喜你，注册成功，请到"+student.getEmail()+"激活用户')</script>");
			
			//4、发送邮件激活用户
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String registerTime = format.format(student.getRegisterTime());
				String subject = "考试系统，学生用户激活";
				String emailMsg = "您在"+registerTime+",注册了testSystem的学生用户，点击这里激活该用户："
						+ "<a href='http://localhost:8080/testSystem/User?"
						+ "method=actionStudent&code="+student.getCode()+"&userName="+student.getUserName()+"'>激活</a>";
				MailUtils.sendMail(student.getEmail(), subject, emailMsg);
			} catch (AddressException e) {
				e.printStackTrace();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
		} else {
			response.getWriter().write("<script>alert('注册失败！请联系管理员')</script>");
		}
		
	}
	
	/**
	 * 
	 * @Description 学生注册：邮箱激活学生用户
	 * @date 2018年12月2日 下午7:01:42
	 */
	public void actionStudent(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1、数据封装，从request中获取code和userName
		String code = request.getParameter("code");
		String userName = request.getParameter("userName");
		Student student = new Student();
		student.setCode(code);
		student.setUserName(userName);
		//2、传递到service层
		UserService userService = new UserService();
		boolean isSuccess = userService.actionStudent(student);
		//3、跟据结果给前台信息并处理
		response.setContentType("text/html;charset=UTF-8");
		if(isSuccess) {
			response.getWriter().write("<script>alert('恭喜你，激活成功！5秒后跳转到登录界面');"
					+ "setTimeout(function(){location.href='http://localhost:8080/testSystem/login.jsp';},5000)</script>");
		} else {
			response.getWriter().write("<script>alert('激活失败！')</script>");
		}
	}
	
	/**
	 * @Description 学生登录
	 * @date 2018年12月2日 下午9:05:38
	 */
	public void studentLogin(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1、从request中获取用户名密码，进行封装
		Student student = new Student();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		student.setUserName(userName);
		student.setPassword(password);
		
		//2、将数据传递到service层
		UserService userService = new UserService();
		int loginStatus= userService.studentLogin(student);
		
		//3、成功登录
		if(loginStatus == 0) {
			//3.1将student对象写入session中
			student = userService.getStudentByUserName(userName);
			HttpSession session = request.getSession();
			User user = new User();
			user.setStudent(student);
			session.setAttribute("user", user);
			
			//3.2判断是否自动登录
			String autoLogin = request.getParameter("autoLogin");
			if("autoLogin".equals(autoLogin)) {
				//3.2.1用户类型
				Cookie userTypeIdCookie = new Cookie("userType", student.getUserType()+"");
				userTypeIdCookie.setMaxAge(604800);
				//3.2.2用户名
				Cookie userNameCookie = new Cookie("userName", student.getUserName());
				userNameCookie.setMaxAge(604800);
				//3.2.3密码
				Cookie passwordCookie = new Cookie("password", student.getPassword());
				passwordCookie.setMaxAge(604800);
				//将cookie添加到response中
				response.addCookie(userTypeIdCookie);
				response.addCookie(userNameCookie);
				response.addCookie(passwordCookie);
			}
		}
		
		//4、将数据响应到前端：0可登录，1用户不存在，2密码错误
		response.getWriter().write(loginStatus+"");
		
	}
	
	/**
	 * @Description 老师登录
	 * @date 2018年12月2日 下午9:15:11
	 */
	public void teacherLogin(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1、从request中获取用户名密码，进行封装
		Teacher teacher = new Teacher();
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		teacher.setUserName(userName);
		teacher.setPassword(password);
		
		//2、将数据传递到service层
		UserService userService = new UserService();
		int loginStatus= userService.teacherLogin(teacher);
		
		//3、成功登录
		if(loginStatus == 0) {
			//3.1将teacher对象写入session中
			teacher = userService.getTeacherByUserName(userName);
			HttpSession session = request.getSession();
			User user = new User();
			user.setTeacher(teacher);
			session.setAttribute("user", user);
			
			//3.2判断是否自动登录
			String autoLogin = request.getParameter("autoLogin");
			if("autoLogin".equals(autoLogin)) {
				//3.2.1用户类型
				Cookie userTypeIdCookie = new Cookie("userType", teacher.getUserType()+"");
				userTypeIdCookie.setMaxAge(604800);
				//3.2.2用户名
				Cookie userNameCookie = new Cookie("userName", teacher.getUserName());
				userNameCookie.setMaxAge(604800);
				//3.2.3密码
				Cookie passwordCookie = new Cookie("password", teacher.getPassword());
				passwordCookie.setMaxAge(604800);
				//将cookie添加到response中
				response.addCookie(userTypeIdCookie);
				response.addCookie(userNameCookie);
				response.addCookie(passwordCookie);
			}
		}
		
		//4、将数据响应到前端：0可登录，1用户不存在，2密码错误
		response.getWriter().write(loginStatus+"");
		
	}
	
	/**
	 * 
	 * @Description 学生用户注销
	 * @date 2018年12月2日 下午11:53:27
	 */
	public void logoutStudent(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1.从session删除student
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		//2.删除cookie，用空字符串覆盖
		//2.1用户类型
		Cookie userTypeIdCookie = new Cookie("userTypeId", "");
		userTypeIdCookie.setMaxAge(0);
		//2.2用户名
		Cookie userNameCookie = new Cookie("userName", "");
		userNameCookie.setMaxAge(0);
		//2.3密码
		Cookie passwordCookie = new Cookie("password", "");
		passwordCookie.setMaxAge(0);
		//2.4将cookie添加到response中
		response.addCookie(userTypeIdCookie);
		response.addCookie(userNameCookie);
		response.addCookie(passwordCookie);
		
		//3.跳转到主页
		response.sendRedirect(request.getContextPath()+"/Index?method=index");
	}

	/**
	 * 
	 * @Description 老师用户注销
	 * @date 2018年12月3日 上午12:01:01
	 */
	public void logoutTeacher(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1.从session删除student
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		
		//2.删除cookie，用空字符串覆盖
		//2.1用户类型
		Cookie userTypeIdCookie = new Cookie("userTypeId", "");
		userTypeIdCookie.setMaxAge(0);
		//2.2用户名
		Cookie userNameCookie = new Cookie("userName", "");
		userNameCookie.setMaxAge(0);
		//2.3密码
		Cookie passwordCookie = new Cookie("password", "");
		passwordCookie.setMaxAge(0);
		//2.4将cookie添加到response中
		response.addCookie(userTypeIdCookie);
		response.addCookie(userNameCookie);
		response.addCookie(passwordCookie);
		
		//3.跳转到主页
		response.sendRedirect(request.getContextPath()+"/Index?method=index");
	}

	/**
	 * 
	 * @Description 获得用户信息
	 * @date 2018年12月27日 上午8:58:05
	 */
	/*public void getUser(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1.获得用户类型和用户Id
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
