package club.ityuchao.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.sun.org.apache.bcel.internal.generic.NEW;

import club.ityuchao.domain.Question;
import club.ityuchao.domain.QuestionCategory;
import club.ityuchao.domain.Student;
import club.ityuchao.domain.Teacher;
import club.ityuchao.domain.User;
import club.ityuchao.utils.DataSourceUtil;

public class UserDao {

	/**
	 * 
	 * @Description ��ʦע�᣺��ʦ�û�ע��
	 * @date 2018��12��1�� ����10:49:42
	 * @param teacher ��ʦ�û�
	 * @return �Ƿ�ע��ɹ�
	 */
	public boolean teacherRegister(Teacher teacher) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into teacher values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		SimpleDateFormat bir = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat reg = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int update = runner.update(sql, teacher.getTeacherId(),teacher.getUserType(),teacher.getUserName(),teacher.getPassword(),
				teacher.getRealName(),teacher.getEmail(),teacher.getBirthday()!=null?bir.format(teacher.getBirthday()):null,
				teacher.getTelephone(),teacher.getGender(),teacher.getSignature(),teacher.getHeadImage(),teacher.getStatus(),
				teacher.getCode(),teacher.getRootPermit(),reg.format(teacher.getRegisterTime()),teacher.getIsLock());
		return update>0?true:false;
	}

	/**
	 * 
	 * @Description ��ʦע�᣺���ע����û����Ƿ����
	 * @date 2018��12��2�� ����1:19:53
	 * @return true��ʾ���ã�false��ʾ�û����Ѵ���
	 */
	public boolean existTeacherUsername(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where userName = ?";
		long query = (long)runner.query(sql,new ScalarHandler() , userName);
		return query==0?true:false;
	}

	/**
	 * 
	 * @Description ��ʦע�᣺��ʦ�û�����1�������Ƿ������ʦ�û�������codeƥ��
	 * @date 2018��12��2�� ����3:14:21
	 * @param teacher ��ʦ����
	 * @return fasle��ʾ�����ڣ�true��ʾ����
	 */
	public boolean findTeacherWithCode(Teacher teacher) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where userName=? and code=?";
		long query = (long)runner.query(sql,new ScalarHandler() , teacher.getUserName(),teacher.getCode());
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description ��ʦע�᣺��ʦ�û�����2���޸���ʦ�û�status�ֶΣ���Ϊ1,��ʾ�Ѽ���
	 * @date 2018��12��2�� ����3:17:00
	 * @param userName ��ʦ�û���
	 * @return false��ʾ����ʧ�ܣ�true�ɹ�
	 */
	public boolean actionTeacher(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update teacher set status = 1 where userName = ?";
		int update = runner.update(sql, userName);
		return update==0?false:true;
	}

	
	/**
	 * 
	 * @Description ѧ��ע�᣺�����ʦ����Ƿ����
	 * @date 2018��12��2�� ����6:07:34
	 * @param teacherId ��ʦ���
	 * @return true��Ŵ��ڣ�false��Ų�����
	 */
	public boolean existTeacherId(String teacherId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where teacherId=?";
		Long query = (Long)runner.query(sql, new ScalarHandler(), teacherId);
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description ѧ��ע�᣺���ѧ���û����Ƿ����
	 * @date 2018��12��2�� ����6:32:01
	 * @param userName ѧ���û���
	 * @return true��ʾ���ã�false��ʾ������
	 * @throws SQLException 
	 */
	public boolean existStudentUsername(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from student where userName=?";
		long query = (long)runner.query(sql, new ScalarHandler(), userName);
		return query==0?true:false;
	}

	/**
	 * 
	 * @Description ѧ��ע�᣺ѧ���û�ע��
	 * @date 2018��12��2�� ����7:03:20
	 * @param student ѧ������
	 * @return trueע��ɹ���falseʧ��
	 */
	public boolean studentRegister(Student student) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into student values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		SimpleDateFormat bir = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat reg = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int update = runner.update(sql, student.getStudentId(),student.getUserType(),student.getUserName(),student.getPassword(),
				student.getRealName(),student.getEmail(),student.getBirthday()!=null?bir.format(student.getBirthday()):null,
				student.getTelephone(),student.getMyTeacherId(),student.getGender(),student.getSignature(),student.getHeadImage(),
				student.getStatus(),student.getCode(),reg.format(student.getRegisterTime()),student.getIsLock());
		return update>0?true:false;
	}

	/**
	 * 
	 * @Description ѧ��ע�᣺ѧ���û�����1�������Ƿ����ѧ���û�������codeƥ��
	 * @date 2018��12��2�� ����7:18:00
	 * @param student ѧ������
	 * @return fasle��ʾ�����ڣ�true��ʾ����
	 */
	public boolean findStudentWithCode(Student student) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from student where userName=? and code=?";
		long query = (long)runner.query(sql,new ScalarHandler() , student.getUserName(),student.getCode());
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description ѧ��ע�᣺��ʦ�û�����2���޸�ѧ���û�status�ֶΣ���Ϊ1,��ʾ�Ѽ���
	 * @date 2018��12��2�� ����7:19:47
	 * @param userName ѧ���û���
	 * @return false��ʾ����ʧ�ܣ�true�ɹ�
	 */
	public boolean actionStudent(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update student set status = 1 where userName = ?";
		int update = runner.update(sql, userName);
		return update==0?false:true;
	}

	
	/**
	 * 
	 * @Description ѧ����¼���ж��û����Ƿ�ƥ��
	 * @date 2018��12��2�� ����9:30:32
	 * @param student ѧ������
	 * @return true��ʾƥ�䣬false��ƥ��
	 */
	public boolean studentLogin(Student student) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from student where userName=? and password=?";
		long query = (long)runner.query(sql, new ScalarHandler(), student.getUserName(),student.getPassword());
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description ѧ����¼�������û����ж��û��Ƿ����
	 * @date 2018��12��2�� ����9:33:46
	 * @param userName �û���
	 * @return true���ڣ�false������
	 */
	public boolean existStudentByUserName(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from student where userName=?";
		long query = (long)runner.query(sql, new ScalarHandler(), userName);
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description ��ʦ��¼���ж��û����Ƿ�ƥ��
	 * @date 2018��12��2�� ����10:16:54
	 * @param teacher ��ʦ����
	 * @return true��ʾƥ�䣬false��ƥ��
	 */
	public boolean teacherLogin(Teacher teacher) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where userName=? and password=?";
		long query = (long)runner.query(sql, new ScalarHandler(), teacher.getUserName(),teacher.getPassword());
		return query==0?false:true;
	}
	
	/**
	 * 
	 * @Description ѧ����¼��ͨ���û�����ȡѧ������
	 * @date 2018��12��2�� ����11:07:52
	 * @param userName �û���
	 * @return ѧ������
	 */
	public Student getStudentByUserName(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from student where userName=?";
		Student student = runner.query(sql, new BeanHandler<Student>(Student.class), userName);
		return student;
	}

	/**
	 * 
	 * @Description ��ʦ��¼�������û����ж��û��Ƿ����
	 * @date 2018��12��2�� ����10:17:59
	 * @param userName ��ʦ�û���
	 * @return true���ڣ�false������
	 */
	public boolean existTeacherByUserName(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where userName=?";
		long query = (long)runner.query(sql, new ScalarHandler(), userName);
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description ��ʦ��¼�������û��������ʦ����
	 * @date 2018��12��2�� ����11:13:42
	 * @param userName ��ʦ�û���
	 * @return teacher����
	 */
	public Teacher getTeacherByUserName(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from teacher where userName=?";
		Teacher teacher = runner.query(sql, new BeanHandler<Teacher>(Teacher.class), userName);
		return teacher;
	}

	/**
	 * 
	 * @Description �޸�ѧ����Ϣ
	 * @date 2018��12��30�� ����12:50:03
	 * @param student
	 */
	public boolean updateStudent(Student student) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update student set realName=?,birthday=?,telephone=?,gender=?,signature=?,headImage=? where studentId=?";
		String birthday = new SimpleDateFormat("yyyy-MM-dd").format(student.getBirthday());
		int update = runner.update(sql, student.getRealName(), birthday, student.getTelephone(), student.getGender(), 
				student.getSignature(), student.getHeadImage(), student.getStudentId());
		return update == 0 ? false : true;
	}

	/**
	 * 
	 * @Description �޸���ʦ��Ϣ
	 * @date 2018��12��30�� ����12:55:40
	 * @param teacher
	 * @return
	 */
	public boolean updateTeacher(Teacher teacher) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update teacher set realName=?,birthday=?,telephone=?,gender=?,signature=?,headImage=? where teacherId=?";
		String birthday = new SimpleDateFormat("yyyy-MM-dd").format(teacher.getBirthday());
		int update = runner.update(sql, teacher.getRealName(), birthday, teacher.getTelephone(), teacher.getGender(), 
				teacher.getSignature(), teacher.getHeadImage(), teacher.getTeacherId());
		return update == 0 ? false : true;
	}

	/**
	 * 
	 * @Description ͨ��Id���ѧ������
	 * @date 2018��12��30�� ����1:00:57
	 * @param userId
	 * @return
	 */
	public Student getStudentByUserId(int userId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from student where studentId=?";
		Student student = runner.query(sql, new BeanHandler<Student>(Student.class), userId);
		return student;
	}

	/**
	 * 
	 * @Description ͨ��Id�����ʦ����
	 * @date 2018��12��30�� ����1:06:34
	 * @param userId
	 * @return
	 */
	public Teacher getTeacherByUserId(int userId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from teacher where teacherId=?";
		Teacher teacher = runner.query(sql, new BeanHandler<Teacher>(Teacher.class), userId);
		return teacher;
	}


}
