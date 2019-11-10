package club.ityuchao.service;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.mail.Flags.Flag;

import club.ityuchao.dao.UserDao;
import club.ityuchao.dao.QuestionDao;
import club.ityuchao.domain.Question;
import club.ityuchao.domain.QuestionCategory;
import club.ityuchao.domain.Student;
import club.ityuchao.domain.Teacher;
import club.ityuchao.domain.User;

public class UserService {

	/**
	 * 
	 * @Description 老师注册：老师用户注册
	 * @date 2018年12月1日 下午10:49:59
	 * @param teacher 老师对象
	 * @return 是否注册成功
	 */
	public boolean teacherRegister(Teacher teacher) {
		UserDao userDao = new UserDao();
		boolean isSuccess = false;
		try {
			isSuccess = userDao.teacherRegister(teacher);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	/**
	 * @Description 老师注册：检查注册的用户名是否存在
	 * @date 2018年12月2日 下午1:12:38
	 * @return true表示可用，false表示用户名已存在
	 */
	public boolean existTeacherUsername(String userName) {
		boolean flag = false;
		UserDao userDao = new UserDao();
		try {
			flag = userDao.existTeacherUsername(userName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 
	 * @Description 老师注册：邮箱激活老师用户
	 * @date 2018年12月2日 下午3:08:54
	 * @param teacher
	 * @return true表示激活成功，false失败
	 */
	public boolean actionTeacher(Teacher teacher) {
		boolean isSuccess = false;
		UserDao userDao = new UserDao();
		try {
			//1、查询用户是否存在，激活码是否正确
			boolean flag = userDao.findTeacherWithCode(teacher);
			if(flag) {
				//2、修改老师用户status字段，改为1,表示已激活
				isSuccess = userDao.actionTeacher(teacher.getUserName());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	
	/**
	 * 
	 * @Description 学生注册：检测老师编号是否存在
	 * @date 2018年12月2日 下午6:06:21
	 * @param teacherId 老师编号
	 * @return true编号存在，false编号不存在
	 */

	public boolean existTeacherId(String teacherId) {
		boolean isExist = false;
		UserDao userDao = new UserDao();
		try {
			isExist = userDao.existTeacherId(teacherId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isExist;
	}

	/**
	 * 
	 * @Description 学生注册：检测学生用户名是否存在
	 * @date 2018年12月2日 下午6:29:26
	 * @param userName 学生用户名
	 * @return true表示可用，false表示用户名已存在
	 */
	public boolean existStudentUsername(String userName) {
		boolean flag = false;
		UserDao userDao = new UserDao();
		try {
			flag = userDao.existStudentUsername(userName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	/**
	 * 
	 * @Description 学生注册：学生用户注册
	 * @date 2018年12月2日 下午7:02:30
	 * @param student
	 * @return
	 */
	public boolean studentRegister(Student student) {
		UserDao userDao = new UserDao();
		boolean isSuccess = false;
		try {
			isSuccess = userDao.studentRegister(student);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	/**
	 * 
	 * @Description 学生注册：邮箱激活老师用户
	 * @date 2018年12月2日 下午7:14:55
	 * @param student 学生对象
	 * @return true表示激活成功，false失败
	 */
	public boolean actionStudent(Student student) {
		boolean isSuccess = false;
		UserDao userDao = new UserDao();
		try {
			//1、查询用户是否存在，激活码是否正确
			boolean flag = userDao.findStudentWithCode(student);
			if(flag) {
				//2、修改学生用户status字段，改为1,表示已激活
				isSuccess = userDao.actionStudent(student.getUserName());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}


	/**
	 * 
	 * @Description 学生登录
	 * @date 2018年12月2日 下午9:23:07
	 * @param student 学生对象
	 * @return 0可登录，1用户不存在，2密码错误
	 */
	public int studentLogin(Student student) {
		int loginStatus = 2;
		try {
			UserDao userDao = new UserDao();
			//1、判断用户名是否正确
			boolean flag = userDao.studentLogin(student);
			if(flag) {
				//2、用户名正确，返回0
				loginStatus = 0;
			} else {
				//3、用户名密码不匹配，判断用户是否存在
				boolean flag2 = userDao.existStudentByUserName(student.getUserName());
				if(flag2) {
					//3.1用户存在
					loginStatus = 2;
				} else {
					//3.1密码错误
					loginStatus = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return loginStatus;
	}
	
	/**
	 * 
	 * @Description 学生登录：通过用户名获得学生对象
	 * @date 2018年12月2日 下午11:05:55
	 * @param userName 用户名
	 * @return student对象
	 */
	public Student getStudentByUserName(String userName) {
		Student student = null;
		UserDao userDao = new UserDao();
		try {
			student = userDao.getStudentByUserName(userName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return student;
	}

	/**
	 * 
	 * @Description 老师登录
	 * @date 2018年12月2日 下午10:16:01
	 * @param teacher 老师对象
	 * @return 0可登录，1用户不存在，2密码错误
	 */
	public int teacherLogin(Teacher teacher) {
		int loginStatus = 2;
		try {
			UserDao userDao = new UserDao();
			//1、判断用户名是否正确
			boolean flag = userDao.teacherLogin(teacher);
			if(flag) {
				//2、用户名正确，返回0
				loginStatus = 0;
			} else {
				//3、用户名密码不匹配，判断用户是否存在
				boolean flag2 = userDao.existTeacherByUserName(teacher.getUserName());
				if(flag2) {
					//3.1用户存在
					loginStatus = 2;
				} else {
					//3.1密码错误
					loginStatus = 1;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return loginStatus;
	}

	/**
	 * 
	 * @Description 老师登录：通过用户名获得老师对象
	 * @date 2018年12月2日 下午11:12:27
	 * @param userName 老师用户名
	 * @return teacher对象
	 */
	public Teacher getTeacherByUserName(String userName) {
		Teacher teacher = null;
		UserDao userDao = new UserDao();
		try {
			teacher = userDao.getTeacherByUserName(userName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return teacher;
	}

	/**
	 * 
	 * @Description 更新老师、学生信息
	 * @date 2018年12月30日 上午11:50:48
	 * @param user 
	 * @return
	 */
	public Boolean updateUserInfo(User user) {
		UserDao userDao = new UserDao();
		boolean isSuccess = false;
		try {
			if(user.getStudent() != null) {
				isSuccess= userDao.updateStudent(user.getStudent());
			} else if(user.getTeacher() != null) {
				isSuccess = userDao.updateTeacher(user.getTeacher());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return isSuccess;
	}

	/**
	 * 
	 * @Description 获得学生对象
	 * @date 2018年12月30日 下午12:59:36
	 * @param userId
	 * @return
	 */
	public Student getStudentByUserId(int userId) {
		UserDao userDao = new UserDao();
		Student student = null;
		try {
			student = userDao.getStudentByUserId(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return student;
	}

	/**
	 * 
	 * @Description 获得老师对象
	 * @date 2018年12月30日 下午1:05:51
	 * @param userId
	 * @return
	 */
	public Teacher getTeacherByUserId(int userId) {
		UserDao userDao = new UserDao();
		Teacher teacher = null;
		try {
			teacher = userDao.getTeacherByUserId(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return teacher;
	}


}
