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
 * @author ����
 * @date 2018��12��7��
 * @Description �������
 *
 */
public class QuestionDao {

	/**
	 * 
	 * @Description index����
	 * @date 2018��12��8�� ����5:48:32
	 * @return ��ȷ����͵�10������
	 */
	public List<Question> getAccuracyList() throws SQLException, IllegalAccessException, InvocationTargetException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "(select * from question where answerPeople!=0 order by accuracy asc) " + 
				"UNION DISTINCT " + 
				"(select * from question) LIMIT 0,10";
		
		List<Question> accuracyList = new ArrayList<Question>();
		
		//1��Ϊquestion�����в���questionCategoryId����QuestionCategory�������ԣ�
		List<Map<String,Object>> query = runner.query(sql, new MapListHandler());
		
		//2����list��װ����
		for(Map map : query) {
			//2,1��װquestion
			Question question = new Question();
			BeanUtils.populate(question, map);
			
			//2,2��װquestionCategoryId
			QuestionCategory questionCategory = new QuestionCategory();
			BeanUtils.populate(questionCategory, map);
			question.setCategory(questionCategory);
			
			//2,3.��question��ӵ�accuracyList��
			accuracyList.add(question);
		}
		return accuracyList;
	}

	/**
	 * 
	 * @Description index����
	 * @date 2018��12��8�� ����5:52:08
	 * @return ���¼����10������
	 */
	public List<Question> getaddDateList() throws SQLException, IllegalAccessException, InvocationTargetException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question order by addDate desc limit 0,10;";
		
		List<Question> addDateList = new ArrayList<Question>();
		
		//1��Ϊquestion�����в���questionCategoryId����QuestionCategory�������ԣ�
		List<Map<String,Object>> query = runner.query(sql, new MapListHandler());
		
		//2����list��װ����
		for(Map map : query) {
			//2.1��װquestion
			Question question = new Question();
			BeanUtils.populate(question, map);
			
			//2.2��װquestionCategoryId
			QuestionCategory questionCategory = new QuestionCategory();
			BeanUtils.populate(questionCategory, map);
			question.setCategory(questionCategory);
			//2.3��question��ӵ�accuracyList��
			addDateList.add(question);
		}
		return addDateList;
	}

	/**
	 * 
	 * @Description ����questionCategoryID���questionCategory
	 * @date 2018��12��8�� ����6:34:20
	 * @param questionCategoryID
	 * @return QuestionCategory����
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
	 * @Description �����Ŀǰ׼�����������ȫ����Ŀ����
	 * @date 2018��12��7�� ����8:47:44
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
	 * @Description �����Ŀ
	 * @date 2018��12��7�� ����10:18:09
	 * @param question ��Ŀ����
	 * @return �ɹ�true������false
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
	 * @Description �����Ŀѡ���ѡ����ѡѡ���մ�
	 * @date 2018��12��7�� ����10:26:26
	 * @param option ѡ�����
	 */
	public void addQuestionOption(QuestionOption option) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "insert into question_option values (?,?,?,?)";
		runner.update(DataSourceUtil.getCurrentConnetcion(), sql, option.getQuestionOptionId(),
				option.getQuestionId(),option.getOptionIndex(),option.getOptionContent());
	}

	/**
	 * 
	 * @Description ����жϡ�������Ŀ
	 * @date 2018��12��8�� ����4:37:10
	 * @param question �������
	 * @return �ɹ�true������false
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
	 * @Description ��ʦ����ҳ�� �����������question���¼��
	 * @date 2018��12��9�� ����7:43:22
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
		
		//ƴ��where���������͡�����
		if(questionCategoryID != null && !"0".equals(questionCategoryID)) {
			sql += " and questionCategoryID = " + questionCategoryID;
		}
		if(type != null && !"0".equals(type)) {
			sql += " and type = " + type;
		}
		
		//ƴ������
		if(order != null) {
			sql += " " + order;
		}
		
		//��ѯ����
		long query = (long) runner.query(sql, new ScalarHandler(),teacherID);
		return (int)query;
	}

	/**
	 * 
	 * @Description ��ʦ����ҳ����ҳ��ʾȫ������
	 * @date 2018��12��9�� ����8:04:05
	 * @param pageBean
	 * @param order
	 * @param questionCategoryID
	 * @param type
	 * @return 
	 */
	public List<Question> getQuestions(PageBean pageBean, int teacherID, String order, String questionCategoryID, String type) throws SQLException, IllegalAccessException, InvocationTargetException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question where teacherID =?";
		
		//ƴ��where���������͡�����
		if(questionCategoryID != null && !"0".equals(questionCategoryID)) {
			sql += " and questionCategoryID = " + questionCategoryID;
		}
		if(type != null && !"0".equals(type)) {
			sql += " and type = " + type;
		}
		
		//ƴ������
		if(order != null) {
			sql += " " + order;
		}
		
		//limitƴ��
		sql += " limit ?,?";
		
		List<Question> questionList = new ArrayList<Question>();
		
		//��Ϊquestion�����в���questionCategoryId����QuestionCategory�������ԣ�
		List<Map<String,Object>> query = runner.query(sql, new MapListHandler(),teacherID,
				(pageBean.getCurrentPage() - 1)*pageBean.getPageSize(),pageBean.getPageSize());
		
		//����list��װ����
		for(Map map : query) {
			//2.1��װquestion
			Question question = new Question();
			BeanUtils.populate(question, map);
			
			//2.2��װquestionCategoryId
			QuestionCategory questionCategory = new QuestionCategory();
			BeanUtils.populate(questionCategory, map);
			question.setCategory(questionCategory);
			//2.3��question��ӵ�accuracyList��
			questionList.add(question);
		}
		return questionList;
	}

	/**
	 * 
	 * @Description ����questionId�����Ŀѡ��
	 * @date 2018��12��9�� ����10:22:57
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
	 * @Description ɾ������question
	 * @date 2018��12��10�� ����1:37:07
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
	 * @Description ɾ������ѡ��
	 * @date 2018��12��10�� ����1:56:59
	 * @param questionId
	 */
	public void deleteQuestionOptions(String questionId) throws SQLException {
		QueryRunner runner = new QueryRunner();
		String sql = "delete from question_option where questionId=?";
		runner.update(DataSourceUtil.getCurrentConnetcion(), sql, questionId);
	}

	/**
	 * 
	 * @Description ���ص���question
	 * @date 2018��12��10�� ����9:02:42
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
	 * @Description ��������question
	 * @date 2018��12��10�� ����9:06:37
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
	 * @Description �޸�����ǰ�Ȼ�����Ⲣ��ʾ
	 * @date 2018��12��12�� ����12:56:47
	 * @param questionId
	 * @return
	 */
	public Question getQuestionById(String questionId) throws SQLException, IllegalAccessException, InvocationTargetException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question where questionId=?";
		
		Map<String, Object> map = runner.query(sql, new MapHandler(), questionId);
		//1.��װQuestion
		Question question = new Question();
		BeanUtils.populate(question, map);
		//2.��װQuestionCategoryId
		QuestionCategory questionCategory = new QuestionCategory();
		BeanUtils.populate(questionCategory, map);
		question.setCategory(questionCategory);
		
		return question;
	}

	/**
	 * 
	 * @Description �޸��жϡ�������
	 * @date 2018��12��14�� ����2:45:51
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
	 * @Description �޸ĵ�ѡ����ѡ�����
	 * @date 2018��12��14�� ����2:54:39
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
	 * @Description ��ȡquestion�ܼ�¼��
	 * @date 2018��12��24�� ����4:13:09
	 */
	public int getTotalQuestion() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select count(*) from question";
		long query = (long) runner.query(sql, new ScalarHandler());
		return (int)query;
	}

	/**
	 * 
	 * @Description ��ȡ�û�������
	 * @date 2018��12��24�� ����4:24:17
	 * @param userId �û�id
	 * @param userType �û�����0ѧ����1��ʦ
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
	 * @Description ��������ҳ����ȡ���⼯��
	 * @date 2018��12��25�� ����9:57:52
	 * @param pageBean ��ҳ����
	 * @param userType �û����ͣ�0ѧ����1��ʦ��
	 * @param userId ���û�id��
	 * @param isDo (2���ޣ�1������δ��)
	 * @return
	 */
	public List<Question> getQuestionList(PageBean pageBean, String isDo, int userId, int userType) throws SQLException, IllegalAccessException, InvocationTargetException {
		
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		
		//�����Ƿ�������һ�����ı�sql,��ò�ͬ�Ľ��
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
		
		//2.��װ�����������������Ƕ������Բ�ȡmapList�ķ�����װcategoryId
		List<Question> questionList = new ArrayList<>();
		for (Map<String, Object> map : query) {
			//��װquestion
			Question question = new Question();
			BeanUtils.populate(question, map);
			//��װcategoryId
			QuestionCategory questionCategory = new QuestionCategory();
			BeanUtils.populate(questionCategory, map);
			//��category�����װ��question��
			question.setCategory(questionCategory);
			//��question��ӵ�������
			questionList.add(question);
		}
		return questionList;
	}

	/**
	 * 
	 * @Description �ж��û��Ƿ����⣬�Ƿ�����
	 * @date 2018��12��26�� ����8:03:40
	 * @param questionId
	 * @return 2��ʾ����1��ʾ��ȷ��0��ʾδ��
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
	 * @Description ��ȡ�û�������Ϣ
	 * @date 2019��1��11�� ����5:10:43
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
	 * @Description ��ȡ�û�������
	 * @date 2019��1��11�� ����5:13:49
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
	 * @Description �����һ������
	 * @date 2019��1��12�� ����6:27:03
	 * @param currentQuestionId
	 * @return
	 */
	public Question previousQuestion(String currentQuestionId) throws SQLException, IllegalAccessException, InvocationTargetException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question where questionId<? limit 1";
		Map<String, Object> map = runner.query(sql, new MapHandler(), currentQuestionId);
		//1.��װQuestion
		Question question = new Question();
		BeanUtils.populate(question, map);
		//2.��װQuestionCategoryId
		QuestionCategory questionCategory = new QuestionCategory();
		BeanUtils.populate(questionCategory, map);
		question.setCategory(questionCategory);
		
		return question;
	}

	/**
	 * 
	 * @Description �����һ��
	 * @date 2019��1��12�� ����6:35:00
	 * @param currentQuestionId
	 * @return
	 */
	public Question nextQuestion(String currentQuestionId) throws SQLException, IllegalAccessException, InvocationTargetException {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select * from question where questionId>? limit 1";
		Map<String, Object> map = runner.query(sql, new MapHandler(), currentQuestionId);
		//1.��װQuestion
		Question question = new Question();
		BeanUtils.populate(question, map);
		//2.��װQuestionCategoryId
		QuestionCategory questionCategory = new QuestionCategory();
		BeanUtils.populate(questionCategory, map);
		question.setCategory(questionCategory);
		
		return question;
	}

	

}
