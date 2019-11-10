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
	 * @Description ��ʦע�᣺��ʦ�û�ע��
	 * @date 2018��12��1�� ����10:49:59
	 * @param teacher ��ʦ����
	 * @return �Ƿ�ע��ɹ�
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
	 * @Description ��ʦע�᣺���ע����û����Ƿ����
	 * @date 2018��12��2�� ����1:12:38
	 * @return true��ʾ���ã�false��ʾ�û����Ѵ���
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
	 * @Description ��ʦע�᣺���伤����ʦ�û�
	 * @date 2018��12��2�� ����3:08:54
	 * @param teacher
	 * @return true��ʾ����ɹ���falseʧ��
	 */
	public boolean actionTeacher(Teacher teacher) {
		boolean isSuccess = false;
		UserDao userDao = new UserDao();
		try {
			//1����ѯ�û��Ƿ���ڣ��������Ƿ���ȷ
			boolean flag = userDao.findTeacherWithCode(teacher);
			if(flag) {
				//2���޸���ʦ�û�status�ֶΣ���Ϊ1,��ʾ�Ѽ���
				isSuccess = userDao.actionTeacher(teacher.getUserName());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	
	/**
	 * 
	 * @Description ѧ��ע�᣺�����ʦ����Ƿ����
	 * @date 2018��12��2�� ����6:06:21
	 * @param teacherId ��ʦ���
	 * @return true��Ŵ��ڣ�false��Ų�����
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
	 * @Description ѧ��ע�᣺���ѧ���û����Ƿ����
	 * @date 2018��12��2�� ����6:29:26
	 * @param userName ѧ���û���
	 * @return true��ʾ���ã�false��ʾ�û����Ѵ���
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
	 * @Description ѧ��ע�᣺ѧ���û�ע��
	 * @date 2018��12��2�� ����7:02:30
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
	 * @Description ѧ��ע�᣺���伤����ʦ�û�
	 * @date 2018��12��2�� ����7:14:55
	 * @param student ѧ������
	 * @return true��ʾ����ɹ���falseʧ��
	 */
	public boolean actionStudent(Student student) {
		boolean isSuccess = false;
		UserDao userDao = new UserDao();
		try {
			//1����ѯ�û��Ƿ���ڣ��������Ƿ���ȷ
			boolean flag = userDao.findStudentWithCode(student);
			if(flag) {
				//2���޸�ѧ���û�status�ֶΣ���Ϊ1,��ʾ�Ѽ���
				isSuccess = userDao.actionStudent(student.getUserName());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isSuccess;
	}


	/**
	 * 
	 * @Description ѧ����¼
	 * @date 2018��12��2�� ����9:23:07
	 * @param student ѧ������
	 * @return 0�ɵ�¼��1�û������ڣ�2�������
	 */
	public int studentLogin(Student student) {
		int loginStatus = 2;
		try {
			UserDao userDao = new UserDao();
			//1���ж��û����Ƿ���ȷ
			boolean flag = userDao.studentLogin(student);
			if(flag) {
				//2���û�����ȷ������0
				loginStatus = 0;
			} else {
				//3���û������벻ƥ�䣬�ж��û��Ƿ����
				boolean flag2 = userDao.existStudentByUserName(student.getUserName());
				if(flag2) {
					//3.1�û�����
					loginStatus = 2;
				} else {
					//3.1�������
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
	 * @Description ѧ����¼��ͨ���û������ѧ������
	 * @date 2018��12��2�� ����11:05:55
	 * @param userName �û���
	 * @return student����
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
	 * @Description ��ʦ��¼
	 * @date 2018��12��2�� ����10:16:01
	 * @param teacher ��ʦ����
	 * @return 0�ɵ�¼��1�û������ڣ�2�������
	 */
	public int teacherLogin(Teacher teacher) {
		int loginStatus = 2;
		try {
			UserDao userDao = new UserDao();
			//1���ж��û����Ƿ���ȷ
			boolean flag = userDao.teacherLogin(teacher);
			if(flag) {
				//2���û�����ȷ������0
				loginStatus = 0;
			} else {
				//3���û������벻ƥ�䣬�ж��û��Ƿ����
				boolean flag2 = userDao.existTeacherByUserName(teacher.getUserName());
				if(flag2) {
					//3.1�û�����
					loginStatus = 2;
				} else {
					//3.1�������
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
	 * @Description ��ʦ��¼��ͨ���û��������ʦ����
	 * @date 2018��12��2�� ����11:12:27
	 * @param userName ��ʦ�û���
	 * @return teacher����
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
	 * @Description ������ʦ��ѧ����Ϣ
	 * @date 2018��12��30�� ����11:50:48
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
	 * @Description ���ѧ������
	 * @date 2018��12��30�� ����12:59:36
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
	 * @Description �����ʦ����
	 * @date 2018��12��30�� ����1:05:51
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
