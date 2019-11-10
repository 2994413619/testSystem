package club.ityuchao.dao;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;import com.sun.media.jfxmedia.events.NewFrameEvent;
import com.sun.org.apache.bcel.internal.generic.NEW;

import club.ityuchao.domain.PageBean;
import club.ityuchao.domain.Question;
import club.ityuchao.domain.QuestionAnswerItem;
import club.ityuchao.domain.QuestionAnswerOfUser;
import club.ityuchao.domain.QuestionCategory;
import club.ityuchao.domain.QuestionOption;
import club.ityuchao.utils.DataSourceUtil;

/**
 * 
 * @author 喻超
 * @date 2018年12月7日
 * @Description 管理题库
 *
 */
public class QuestionDao {

	/**
	 * 
	 * @Description index数据
	 * @date 2018年12月8日 下午5:48:32
	 * @return 真确率最低的10个问题
	 */
	public List<Question> getAccuracyList() throws SQLException, IllegalAccessException, InvocationTargetException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "(select * from question where answerPeople!=0 order by accuracy asc) " + 
				"UNION DISTINCT " + 
				"(select * from question) LIMIT 0,10";
		
		List<Question> accuracyList = new ArrayList<Question>();
		
		//1因为question对象中不会questionCategoryId而是QuestionCategory对象，所以：
		List<Map<String,Object>> query = runner.query(sql, new MapListHandler());
		
		//2遍历list封装数据
		for(Map map : query) {
			//2,1封装question
			Question question = new Question();
			BeanUtils.populate(question, map);
			
			//2,2封装questionCategoryId
			QuestionCategory questionCategory = new QuestionCategory();
			BeanUtils.populate(questionCategory, map);
			question.setCategory(questionCategory);
			
			//2,3.把question添加到accuracyList中
			accuracyList.add(question);
		}
		return accuracyList;
	}

	/**
	 * 
	 * @Description index数据
	 * @date 2018年12月8日 下午5:52:08
	 * @return 最新加入的10个问题
	 */
	public List<Question> getaddDateList() throws SQLException, IllegalAccessException, InvocationTargetException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question order by addDate desc limit 0,10;";
		
		List<Question> addDateList = new ArrayList<Question>();
		
		//1因为question对象中不会questionCategoryId而是QuestionCategory对象，所以：
		List<Map<String,Object>> query = runner.query(sql, new MapListHandler());
		
		//2遍历list封装数据
		for(Map map : query) {
			//2.1封装question
			Question question = new Question();
			BeanUtils.populate(question, map);
			
			//2.2封装questionCategoryId
			QuestionCategory questionCategory = new QuestionCategory();
			BeanUtils.populate(questionCategory, map);
			question.setCategory(questionCategory);
			//2.3把question添加到accuracyList中
			addDateList.add(question);
		}
		return addDateList;
	}

	/**
	 * 
	 * @Description 根据questionCategoryID获得questionCategory
	 * @date 2018年12月8日 下午6:34:20
	 * @param questionCategoryID
	 * @return QuestionCategory对象
	 */
	public QuestionCategory getCategoryByID(int questionCategoryID) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question_category where questionCategoryID = ?";
		QuestionCategory category = runner.query(sql, new BeanHandler<QuestionCategory>(QuestionCategory.class), questionCategoryID);
		return category;
	}
	
	
	/**
	 * 
	 * @return 
	 * @throws SQLException 
	 * @Description 添加题目前准备工作：获得全部题目分类
	 * @date 2018年12月7日 下午8:47:44
	 */
	public List<QuestionCategory> getQuestionCategory() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question_category";
		List<QuestionCategory> questionCategoryList = null;
		questionCategoryList = runner.query(sql, new BeanListHandler<QuestionCategory>(QuestionCategory.class));
		return questionCategoryList;
	}

	/**
	 * 
	 * @Description 添加题目
	 * @date 2018年12月7日 下午10:18:09
	 * @param question 题目对象
	 * @return 成功true，错误false
	 */
	public boolean addQuestion(Question question) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into question values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int update = runner.update(DataSourceUtil.getCurrentConnetcion(), sql, question.getQuestionId(),
				question.getType(),question.getCategory().getQuestionCategoryID(),
				question.getQuestionContent(),question.getAnswerPeople(),
				question.getAnswer(),question.getQuestionExplain(),question.getAddDate(),
				question.getIsPublic(),question.getScore(),question.getAverageScore(),
				question.getAccuracy(),question.getLevel(),question.getTeacher().getTeacherId());
		return update==0?false:true;
	}

	/**
	 * 
	 * @Description 添加题目选项：单选、多选选项，填空答案
	 * @date 2018年12月7日 下午10:26:26
	 * @param option 选项对象
	 */
	public void addQuestionOption(QuestionOption option) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into question_option values (?,?,?,?)";
		runner.update(DataSourceUtil.getCurrentConnetcion(), sql, option.getQuestionOptionId(),
				option.getQuestionId(),option.getOptionIndex(),option.getOptionContent());
	}

	/**
	 * 
	 * @Description 添加判断、主观题目
	 * @date 2018年12月8日 下午4:37:10
	 * @param question 问题对象
	 * @return 成功true，错误false
	 */
	public boolean addQuestionJS(Question question) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "insert into question values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int update = runner.update(sql, question.getQuestionId(),
				question.getType(),question.getCategory().getQuestionCategoryID(),
				question.getQuestionContent(),question.getAnswerPeople(),
				question.getAnswer(),question.getQuestionExplain(),question.getAddDate(),
				question.getIsPublic(),question.getScore(),question.getAverageScore(),
				question.getAccuracy(),question.getLevel(),question.getTeacher().getTeacherId());
		return update==0?false:true;
	}

	/**
	 * 
	 * @Description 老师管理页： 根据条件获得question表记录数
	 * @date 2018年12月9日 下午7:43:22
	 * @param tableName
	 * @param order
	 * @param questionCategoryID
	 * @param type
	 * @return
	 * @throws SQLException 
	 */
	public int getTotalCountByTableName(int teacherID, String order, String questionCategoryID, String type) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from question where teacherID = ?";
		
		//拼接where条件：题型、分类
		if(questionCategoryID != null && !"0".equals(questionCategoryID)) {
			sql += " and questionCategoryID = " + questionCategoryID;
		}
		if(type != null && !"0".equals(type)) {
			sql += " and type = " + type;
		}
		
		//拼接排序
		if(order != null) {
			sql += " " + order;
		}
		
		//查询总数
		long query = (long) runner.query(sql, new ScalarHandler(),teacherID);
		return (int)query;
	}

	/**
	 * 
	 * @Description 老师管理页：分页显示全部问题
	 * @date 2018年12月9日 下午8:04:05
	 * @param pageBean
	 * @param order
	 * @param questionCategoryID
	 * @param type
	 * @return 
	 */
	public List<Question> getQuestions(PageBean pageBean, int teacherID, String order, String questionCategoryID, String type) throws SQLException, IllegalAccessException, InvocationTargetException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question where teacherID =?";
		
		//拼接where条件：题型、分类
		if(questionCategoryID != null && !"0".equals(questionCategoryID)) {
			sql += " and questionCategoryID = " + questionCategoryID;
		}
		if(type != null && !"0".equals(type)) {
			sql += " and type = " + type;
		}
		
		//拼接排序
		if(order != null) {
			sql += " " + order;
		}
		
		//limit拼接
		sql += " limit ?,?";
		
		List<Question> questionList = new ArrayList<Question>();
		
		//因为question对象中不会questionCategoryId而是QuestionCategory对象，所以：
		List<Map<String,Object>> query = runner.query(sql, new MapListHandler(),teacherID,
				(pageBean.getCurrentPage() - 1)*pageBean.getPageSize(),pageBean.getPageSize());
		
		//遍历list封装数据
		for(Map map : query) {
			//2.1封装question
			Question question = new Question();
			BeanUtils.populate(question, map);
			
			//2.2封装questionCategoryId
			QuestionCategory questionCategory = new QuestionCategory();
			BeanUtils.populate(questionCategory, map);
			question.setCategory(questionCategory);
			//2.3把question添加到accuracyList中
			questionList.add(question);
		}
		return questionList;
	}

	/**
	 * 
	 * @Description 根据questionId获得题目选项
	 * @date 2018年12月9日 下午10:22:57
	 * @param questionId
	 * @return
	 * @throws SQLException 
	 */
	public QuestionOption[] getOpionsByQuestionId(int questionId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question_option where questionId = ?";
		List<QuestionOption> query = runner.query(sql, new BeanListHandler<QuestionOption>(QuestionOption.class), questionId);
		QuestionOption[] options = new QuestionOption[query.size()];
		query.toArray(options);
		return options;
	}

	/**
	 * 
	 * @Description 删除单个question
	 * @date 2018年12月10日 下午1:37:07
	 * @param questionId
	 * @return
	 */
	public int deleteQuestionById(String questionId) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from question where questionId=?";
		int update = runner.update(DataSourceUtil.getCurrentConnetcion(), sql, questionId);
		return update;
	}

	/**
	 * 
	 * @Description 删除问题选项
	 * @date 2018年12月10日 下午1:56:59
	 * @param questionId
	 */
	public void deleteQuestionOptions(String questionId) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from question_option where questionId=?";
		runner.update(DataSourceUtil.getCurrentConnetcion(), sql, questionId);
	}

	/**
	 * 
	 * @Description 隐藏单个question
	 * @date 2018年12月10日 下午9:02:42
	 * @param questionId
	 * @return
	 */
	public int hiddenQuestion(String questionId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update question set isPublic=1 where questionId=?";
		int update = runner.update(sql, questionId);
		return update;
	}

	/**
	 * 
	 * @Description 公开单个question
	 * @date 2018年12月10日 下午9:06:37
	 * @param questionId
	 * @return
	 */
	public int publicQuestion(String questionId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update question set isPublic=0 where questionId=?";
		int update = runner.update(sql, questionId);
		return update;
	}

	/**
	 * 
	 * @Description 修改问题前先获得问题并显示
	 * @date 2018年12月12日 下午12:56:47
	 * @param questionId
	 * @return
	 */
	public Question getQuestionById(String questionId) throws SQLException, IllegalAccessException, InvocationTargetException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question where questionId=?";
		
		Map<String, Object> map = runner.query(sql, new MapHandler(), questionId);
		//1.封装Question
		Question question = new Question();
		BeanUtils.populate(question, map);
		//2.封装QuestionCategoryId
		QuestionCategory questionCategory = new QuestionCategory();
		BeanUtils.populate(questionCategory, map);
		question.setCategory(questionCategory);
		
		return question;
	}

	/**
	 * 
	 * @Description 修改判断、主观题
	 * @date 2018年12月14日 下午2:45:51
	 * @param question
	 * @return
	 */
	public boolean updateQuestionJS(Question question) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "update question set questionCategoryID=?,questionContent=?,"
				+ "answer=?,questionExplain=?,score=?,level=? where questionId=?";
		int update = runner.update(sql, question.getCategory().getQuestionCategoryID(),question.getQuestionContent(),
				question.getAnswer(),question.getQuestionExplain(),question.getScore(),
				question.getLevel(),question.getQuestionId());
		return update==0?false:true;
	}

	/**
	 * 
	 * @Description 修改单选、多选、填空
	 * @date 2018年12月14日 下午2:54:39
	 * @param question
	 * @return
	 */
	public boolean updateQuestion(Question question) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "update question set questionCategoryID=?,questionContent=?,"
				+ "answer=?,questionExplain=?,score=?,level=? where questionId=?";
		int update = runner.update(DataSourceUtil.getCurrentConnetcion(),sql, question.getCategory().getQuestionCategoryID(),question.getQuestionContent(),
				question.getAnswer(),question.getQuestionExplain(),question.getScore(),
				question.getLevel(),question.getQuestionId());
		return update==0?false:true;
	}

	/**
	 * 
	 * @Description 获取question总记录数
	 * @date 2018年12月24日 下午4:13:09
	 */
	public int getTotalQuestion() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from question";
		long query = (long) runner.query(sql, new ScalarHandler());
		return (int)query;
	}

	/**
	 * 
	 * @Description 获取用户答题数
	 * @date 2018年12月24日 下午4:24:17
	 * @param userId 用户id
	 * @param userType 用户类型0学生；1老师
	 * @return
	 */
	public int getAnswerCount(int userId, int userType) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from question_answer_of_user where userId=? and userType=?";
		long query = (long) runner.query(sql, new ScalarHandler(),userId,userType);
		return (int)query;
	}

	/**
	 * 
	 * @Description 题库答题主页：获取问题集合
	 * @date 2018年12月25日 上午9:57:52
	 * @param pageBean 分页对象
	 * @param userType 用户类型（0学生；1老师）
	 * @param userId （用户id）
	 * @param isDo (2不限；1已做；未做)
	 * @return
	 */
	public List<Question> getQuestionList(PageBean pageBean, String isDo, int userId, int userType) throws SQLException, IllegalAccessException, InvocationTargetException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		
		//根据是否做，这一条件改变sql,获得不同的结果
		List<Map<String, Object>> query = null;
		if("2".equals(isDo)) {
			String sql = "select * from question where isPublic=0 limit ?,?";
			query = runner.query(sql, new MapListHandler(), (pageBean.getCurrentPage() - 1)*pageBean.getPageSize(),pageBean.getPageSize());
		} else if("1".equals(isDo)) {
			String sql = "select * from question where questionId in "
					+ "(select questionId from question_answer_of_user where isPublic=0 and userType=? and userId=?)"
					+ " limit ?,?";
			query = runner.query(sql, new MapListHandler(), userType, userId, 
					(pageBean.getCurrentPage() - 1)*pageBean.getPageSize(), pageBean.getPageSize());
		} else if("0".equals(isDo)) {
			String sql = "select * from question where questionId not in "
					+ "(select questionId from question_answer_of_user where isPublic=0 and userType=? and userId=?)"
					+ " limit ?,?";
			query = runner.query(sql, new MapListHandler(), userType, userId, 
					(pageBean.getCurrentPage() - 1)*pageBean.getPageSize(), pageBean.getPageSize());
		}
		
		//2.封装结果，由于问题分类是对象，所以采取mapList的方法封装categoryId
		List<Question> questionList = new ArrayList<>();
		for (Map<String, Object> map : query) {
			//封装question
			Question question = new Question();
			BeanUtils.populate(question, map);
			//封装categoryId
			QuestionCategory questionCategory = new QuestionCategory();
			BeanUtils.populate(questionCategory, map);
			//讲category对象封装到question中
			question.setCategory(questionCategory);
			//将question添加到集合中
			questionList.add(question);
		}
		return questionList;
	}

	/**
	 * 
	 * @Description 判断用户是否做题，是否做对
	 * @date 2018年12月26日 下午8:03:40
	 * @param questionId
	 * @return 2表示错误；1表示正确；0表示未做
	 */
	public int userIsDoQuestion(int questionId, int userType, int userId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question_answer_of_user where questionId=? and userType=? and userId=?";
		QuestionAnswerOfUser query = runner.query(sql, new BeanHandler<QuestionAnswerOfUser>(QuestionAnswerOfUser.class),questionId,userType,userId);
		int isRight = 0;
		if(query == null) {
			isRight = 0;
		} else {
			if(query.getIsRight() == 0) {
				isRight = 2;
			} else if(query.getIsRight() == 1) {
				isRight = 1;
			}
		}
		return isRight;
	}

	/**
	 * 
	 * @Description 获取用户答题信息
	 * @date 2019年1月11日 下午5:10:43
	 * @param questionId
	 * @param userType
	 * @param userId
	 * @return
	 */
	public QuestionAnswerOfUser getQuestionAnswer(String questionId, int userType, int userId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question_answer_of_user where questionId=? and userType=? and userId=?";
		QuestionAnswerOfUser query = runner.query(sql, new BeanHandler<QuestionAnswerOfUser>(QuestionAnswerOfUser.class), questionId, userType, userId);
		return query;
	}

	/**
	 * 
	 * @Description 获取用户填空题答案
	 * @date 2019年1月11日 下午5:13:49
	 * @param userQuestionId
	 * @return
	 */
	public ArrayList<QuestionAnswerItem> questionAnswerGapfillingItem(int userQuestionId) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question_answer_gapfilling_item where userQuestionId=?";
		ArrayList<QuestionAnswerItem> query = (ArrayList<QuestionAnswerItem>) runner.query(sql, new BeanListHandler<QuestionAnswerItem>(QuestionAnswerItem.class), userQuestionId);
		return query;
	}

	/**
	 * 
	 * @Description 获得上一个问题
	 * @date 2019年1月12日 下午6:27:03
	 * @param currentQuestionId
	 * @return
	 */
	public Question previousQuestion(String currentQuestionId) throws SQLException, IllegalAccessException, InvocationTargetException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question where questionId<? limit 1";
		Map<String, Object> map = runner.query(sql, new MapHandler(), currentQuestionId);
		//1.封装Question
		Question question = new Question();
		BeanUtils.populate(question, map);
		//2.封装QuestionCategoryId
		QuestionCategory questionCategory = new QuestionCategory();
		BeanUtils.populate(questionCategory, map);
		question.setCategory(questionCategory);
		
		return question;
	}

	/**
	 * 
	 * @Description 获得下一题
	 * @date 2019年1月12日 下午6:35:00
	 * @param currentQuestionId
	 * @return
	 */
	public Question nextQuestion(String currentQuestionId) throws SQLException, IllegalAccessException, InvocationTargetException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question where questionId>? limit 1";
		Map<String, Object> map = runner.query(sql, new MapHandler(), currentQuestionId);
		//1.封装Question
		Question question = new Question();
		BeanUtils.populate(question, map);
		//2.封装QuestionCategoryId
		QuestionCategory questionCategory = new QuestionCategory();
		BeanUtils.populate(questionCategory, map);
		question.setCategory(questionCategory);
		
		return question;
	}

	

}
