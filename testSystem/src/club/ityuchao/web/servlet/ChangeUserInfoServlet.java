package club.ityuchao.web.servlet;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import club.ityuchao.domain.Student;
import club.ityuchao.domain.Teacher;
import club.ityuchao.domain.User;
import club.ityuchao.service.UserService;

/**
 * 
 * @author 喻超
 * @date 2018年12月30日
 * @Description 修改老师学生信息
 *
 */
@WebServlet("/student/userInfo")
public class ChangeUserInfoServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	/**
	 * 
	 * @Description 修改老师学生信息
	 * @date 2018年12月30日 上午11:08:31
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FileItemFactory fif = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new ServletFileUpload(fif);
		//1.获得数据
		List<FileItem> list = null;
		try {
			list = fileUpload.parseRequest(request);
		} catch (FileUploadException e1) {
			e1.printStackTrace();
		}
		int userType = 0;
		int userId = 0;
		String realName = null;
		Date birthday = null;
		String telephone = null;
		int gender = 0;
		String signature = null;
		String headImage = null;
		for(FileItem item:list) {
			if(item.isFormField()) {
				if("userType".equals(item.getFieldName())) {
					userType = Integer.parseInt(item.getString("utf-8"));
				} else if("userId".equals(item.getFieldName())) {
					userId = Integer.parseInt(item.getString("utf-8"));
				} else if("realName".equals(item.getFieldName())) {
					realName = item.getString("utf-8");
				} else if("birthday".equals(item.getFieldName())) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					try {
						birthday = format.parse(item.getString("utf-8"));
					} catch (ParseException e) {
						e.printStackTrace();
					}
				} else if("telephone".equals(item.getFieldName())) {
					telephone = item.getString("utf-8");
				} else if("gender".equals(item.getFieldName())) {
					gender = Integer.parseInt(item.getString("utf-8"));
				} else if("signature".equals(item.getFieldName())) {
					signature = item.getString("utf-8");
				}
				
			} else {
				String path = this.getServletContext().getRealPath("/headImg");
				if(!"".equals(item.getName())) {
					String imgName = UUID.randomUUID().toString()+item.getName().substring(item.getName().lastIndexOf("."));
					try {
						item.write(new File(path,imgName));
					} catch (Exception e) {
						e.printStackTrace();
					}
					headImage = "headImg/"+imgName;
				} else {
					HttpSession session = request.getSession();
					User user = (User) session.getAttribute("user");
					if(userType == 1) {
						headImage = user.getTeacher().getHeadImage();
					} else if(userType == 0) {
						headImage = user.getStudent().getHeadImage();
					}
				}
				
			}
		}
		
		//2.数据封装
		User user = new User();
		if(userType == 0) {
			Student student = new Student();
			student.setStudentId(userId);
			student.setUserType(userType);
			student.setRealName(realName);
			student.setBirthday(birthday);
			student.setTelephone(telephone);
			student.setGender(gender);
			student.setSignature(signature);
			student.setHeadImage(headImage);
			user.setStudent(student);
		} else if(userType == 1) {
			Teacher teacher = new Teacher();
			teacher.setTeacherId(userId);
			teacher.setUserType(userType);
			teacher.setRealName(realName);
			teacher.setBirthday(birthday);
			teacher.setTelephone(telephone);
			teacher.setGender(gender);
			teacher.setSignature(signature);
			teacher.setHeadImage(headImage);
			user.setTeacher(teacher);
		}
		
		//3.更新user信息
		UserService userService = new UserService();
		Boolean isSuccess = userService.updateUserInfo(user);
		
		//4.更具结果控制流向
		if(isSuccess) {
			//4.1更新session中的user
			HttpSession session = request.getSession();
			User newUser = new User();
			if(userType == 0) {
				newUser.setStudent(userService.getStudentByUserId(userId));
			} else if(userType == 1) {
				newUser.setTeacher(userService.getTeacherByUserId(userId));
			}
			session.setAttribute("user", newUser);
			//4.2跳转到用户信息页
			response.sendRedirect(request.getContextPath() + "/userInformation.jsp");
		} else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('修改失败，请联系管理员！！！')</script>");
		}
	}
}
