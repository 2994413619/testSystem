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
	 * @Description 老师注册：老师用户注册
	 * @date 2018年12月1日 下午10:49:42
	 * @param teacher 老师用户
	 * @return 是否注册成功
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
	 * @Description 老师注册：检查注册的用户名是否存在
	 * @date 2018年12月2日 下午1:19:53
	 * @return true表示可用，false表示用户名已存在
	 */
	public boolean existTeacherUsername(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where userName = ?";
		long query = (long)runner.query(sql,new ScalarHandler() , userName);
		return query==0?true:false;
	}

	/**
	 * 
	 * @Description 老师注册：老师用户激活1、查找是否存在老师用户，并且code匹配
	 * @date 2018年12月2日 下午3:14:21
	 * @param teacher 老师对象
	 * @return fasle表示不存在，true表示存在
	 */
	public boolean findTeacherWithCode(Teacher teacher) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where userName=? and code=?";
		long query = (long)runner.query(sql,new ScalarHandler() , teacher.getUserName(),teacher.getCode());
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description 老师注册：老师用户激活2、修改老师用户status字段，改为1,表示已激活
	 * @date 2018年12月2日 下午3:17:00
	 * @param userName 老师用户名
	 * @return false表示激活失败，true成功
	 */
	public boolean actionTeacher(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update teacher set status = 1 where userName = ?";
		int update = runner.update(sql, userName);
		return update==0?false:true;
	}

	
	/**
	 * 
	 * @Description 学生注册：检测老师编号是否存在
	 * @date 2018年12月2日 下午6:07:34
	 * @param teacherId 老师编号
	 * @return true编号存在，false编号不存在
	 */
	public boolean existTeacherId(String teacherId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where teacherId=?";
		Long query = (Long)runner.query(sql, new ScalarHandler(), teacherId);
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description 学生注册：检测学生用户名是否存在
	 * @date 2018年12月2日 下午6:32:01
	 * @param userName 学生用户名
	 * @return true表示可用，false表示不可用
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
	 * @Description 学生注册：学生用户注册
	 * @date 2018年12月2日 下午7:03:20
	 * @param student 学生对象
	 * @return true注册成功，false失败
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
	 * @Description 学生注册：学生用户激活1、查找是否存在学生用户，并且code匹配
	 * @date 2018年12月2日 下午7:18:00
	 * @param student 学生对象
	 * @return fasle表示不存在，true表示存在
	 */
	public boolean findStudentWithCode(Student student) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from student where userName=? and code=?";
		long query = (long)runner.query(sql,new ScalarHandler() , student.getUserName(),student.getCode());
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description 学生注册：老师用户激活2、修改学生用户status字段，改为1,表示已激活
	 * @date 2018年12月2日 下午7:19:47
	 * @param userName 学生用户名
	 * @return false表示激活失败，true成功
	 */
	public boolean actionStudent(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update student set status = 1 where userName = ?";
		int update = runner.update(sql, userName);
		return update==0?false:true;
	}

	
	/**
	 * 
	 * @Description 学生登录：判断用户名是否匹配
	 * @date 2018年12月2日 下午9:30:32
	 * @param student 学生对象
	 * @return true表示匹配，false不匹配
	 */
	public boolean studentLogin(Student student) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from student where userName=? and password=?";
		long query = (long)runner.query(sql, new ScalarHandler(), student.getUserName(),student.getPassword());
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description 学生登录：根据用户名判断用户是否存在
	 * @date 2018年12月2日 下午9:33:46
	 * @param userName 用户名
	 * @return true存在，false不存在
	 */
	public boolean existStudentByUserName(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from student where userName=?";
		long query = (long)runner.query(sql, new ScalarHandler(), userName);
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description 老师登录：判断用户名是否匹配
	 * @date 2018年12月2日 下午10:16:54
	 * @param teacher 老师对象
	 * @return true表示匹配，false不匹配
	 */
	public boolean teacherLogin(Teacher teacher) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where userName=? and password=?";
		long query = (long)runner.query(sql, new ScalarHandler(), teacher.getUserName(),teacher.getPassword());
		return query==0?false:true;
	}
	
	/**
	 * 
	 * @Description 学生登录：通过用户名获取学生对象
	 * @date 2018年12月2日 下午11:07:52
	 * @param userName 用户名
	 * @return 学生对象
	 */
	public Student getStudentByUserName(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from student where userName=?";
		Student student = runner.query(sql, new BeanHandler<Student>(Student.class), userName);
		return student;
	}

	/**
	 * 
	 * @Description 老师登录：根据用户名判断用户是否存在
	 * @date 2018年12月2日 下午10:17:59
	 * @param userName 老师用户名
	 * @return true存在，false不存在
	 */
	public boolean existTeacherByUserName(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from teacher where userName=?";
		long query = (long)runner.query(sql, new ScalarHandler(), userName);
		return query==0?false:true;
	}

	/**
	 * 
	 * @Description 老师登录：根据用户名获得老师对象
	 * @date 2018年12月2日 下午11:13:42
	 * @param userName 老师用户名
	 * @return teacher对象
	 */
	public Teacher getTeacherByUserName(String userName) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from teacher where userName=?";
		Teacher teacher = runner.query(sql, new BeanHandler<Teacher>(Teacher.class), userName);
		return teacher;
	}

	/**
	 * 
	 * @Description 修改学生信息
	 * @date 2018年12月30日 下午12:50:03
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
	 * @Description 修改老师信息
	 * @date 2018年12月30日 下午12:55:40
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
	 * @Description 通过Id获得学生对象
	 * @date 2018年12月30日 下午1:00:57
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
	 * @Description 通过Id获得老师对象
	 * @date 2018年12月30日 下午1:06:34
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
