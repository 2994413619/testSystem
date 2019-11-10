package club.ityuchao.service;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import club.ityuchao.dao.UserDao;
import club.ityuchao.dao.QuestionDao;
import club.ityuchao.domain.PageBean;
import club.ityuchao.domain.Question;
import club.ityuchao.domain.QuestionAndIsDo;
import club.ityuchao.domain.QuestionAnswerItem;
import club.ityuchao.domain.QuestionAnswerOfUser;
import club.ityuchao.domain.QuestionCategory;
import club.ityuchao.domain.QuestionOption;
import club.ityuchao.utils.DataSourceUtil;

/**
 * 
 * @author 喻超
 * @date 2018年12月7日
 * @Description 老师管理题目service
 *
 */
public class QuestionService {

	/**
	 * 
	 * @Description index页面数据
	 * @date 2018年12月8日 下午5:40:11
	 * @return 真确率最低的10个问题集合
	 */
	public List<Question> getAccuracyList() {
		List<Question> accuracyList = null;
		QuestionDao questionDao = new QuestionDao();
		try {
			accuracyList = questionDao.getAccuracyList();
			//根据questionCategoryID获得questionCategoryName
			for(Question question : accuracyList) {
				int questionCategoryID = question.getCategory().getQuestionCategoryID();
				QuestionCategory category = questionDao.getCategoryByID(questionCategoryID);
				question.setCategory(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return accuracyList;
	}

	/**
	 * 
	 * @Description index页面数据
	 * @date 2018年12月8日 下午5:50:50
	 * @return 难度level最高的10个问题集合
	 */
	public List<Question> getaddDateList() {
		List<Question> levelList = null;
		QuestionDao questionDao = new QuestionDao();
		try {
			levelList = questionDao.getaddDateList();
			//根据questionCategoryID获得questionCategoryName
			for(Question question : levelList) {
				int questionCategoryID = question.getCategory().getQuestionCategoryID();
				QuestionCategory category = questionDao.getCategoryByID(questionCategoryID);
				question.setCategory(category);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return levelList;
	}
	
	
	/**
	 * 
	 * @Description 老师添加题目前，先准备题目分类
	 * @date 2018年12月7日 下午8:45:26
	 * @return 返回题目分类集合
	 */
	public List<QuestionCategory> getQuestionCategory() {
		List<QuestionCategory> questionCategoryList = null;
		QuestionDao questionDao = new QuestionDao();
		try {
			questionCategoryList = questionDao.getQuestionCategory();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questionCategoryList;
	}

	/**
	 * 
	 * @Description 添加单选、多选、填空题 （因为有选项，所以使用事务），判断、主观（不用事务）
	 * @date 2018年12月7日 下午10:00:24
	 * @param question 问题对象
	 * @return 添加成功true，失败false
	 */
	public boolean addQuestion(Question question) {
		QuestionDao questionDao = new QuestionDao();
		boolean flag = true;
		//1判断题型，判断和主观不用添加选项
		if(question.getType() == 3 || question.getType() == 5) {
			//2添加判断J、主观S
			try {
				flag = questionDao.addQuestionJS(question);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else {
			//3添加单选、多选、填空
			try {
				//3.1、开始事务，同时插入问题和问题选项
				DataSourceUtil.startTransaction();
				
				//3.2添加题目
				flag = questionDao.addQuestion(question);
				
				//3.3如果添加题目成功，添加选项
				if(flag) {
					for(QuestionOption option : question.getQuestionOptions()) {
						questionDao.addQuestionOption(option);
					}
				} else {
					DataSourceUtil.rollback();
				}
				
			} catch (SQLException e) {
				//抛sql异常，执行失败，事务回滚
				try {
					DataSourceUtil.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				flag = false;
				e.printStackTrace();
			} finally {
				//无论失败成功，提交事务
				try {
					DataSourceUtil.commit();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return flag;
	}

	/**
	 * 
	 * @Description 老师管理问题页：获得分页对象
	 * @date 2018年12月9日 下午7:24:59
	 * @param currentPage 当前页
	 * @param pageSize 每页显示个数
	 * @param tableName 要查询的表名
	 * @param type 
	 * @param questionCategoryID 
	 * @param order 
	 * @return PageBean对象
	 */
	public PageBean getQuestionManagePageBean(int currentPage, int pageSize,int teacherID, String order, String questionCategoryID, String type) {
		QuestionDao questionDao = new QuestionDao();
		PageBean pageBean = new PageBean();
		
		//设置当前页
		pageBean.setCurrentPage(currentPage);
		
		//设置每页显示个数
		pageBean.setPageSize(pageSize);
		
		//根据条件获的question的总记录数
		int totalCount = 0;
		try {
			totalCount = questionDao.getTotalCountByTableName(teacherID,order,questionCategoryID,type);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//设置总记录数
		pageBean.setTotalCount(totalCount);
		
		//计算总页数
		int totalPage = (int) Math.ceil((Double.parseDouble(totalCount + ""))/pageSize);
		//设置总页数
		pageBean.setTotalPage(totalPage);
		
		//如果当前页-1，,则最后一页
		if(currentPage == -1) {
			pageBean.setCurrentPage(totalPage);
		}
		
		return pageBean;
	}

	/**
	 * 
	 * @Description 老师管理页：分页显示全部问题
	 * @date 2018年12月9日 下午8:02:13
	 * @param pageBean 分页对象
	 * @param order 排序规则
	 * @param questionCategoryID 分类Id
	 * @param type 题目类型（1~5）
	 * @return 
	 */
	public List<Question> getQuestions(PageBean pageBean,int teacherID, String order, String questionCategoryID, String type) {
		QuestionDao questionDao = new QuestionDao();
		List<Question> questionList = null;
		try {
			questionList = questionDao.getQuestions(pageBean, teacherID, order, questionCategoryID, type);
			
			for(Question question : questionList) {
				
				//根据questionCategoryID获得questionCategoryName
				int CategoryID = question.getCategory().getQuestionCategoryID();
				QuestionCategory category = questionDao.getCategoryByID(CategoryID);
				question.setCategory(category);
				
				//获得单选、多选、填空的选项
				if(1 == question.getType() || 2 == question.getType() || 4 == question.getType()) {
					QuestionOption[] options = questionDao.getOpionsByQuestionId(question.getQuestionId());
					question.setQuestionOptions(options);
				}
			}
			
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questionList;
	}

	/**
	 * 
	 * @Description 删除单个question
	 * @date 2018年12月10日 下午1:35:40
	 * @param questionId
	 * @return
	 */
	public boolean deleteQuestionById(String questionId) {
		QuestionDao questionDao = new QuestionDao();
		int delete = 0;
		try {
			//1开启事务
			DataSourceUtil.startTransaction();
			//2删除选项
			questionDao.deleteQuestionOptions(questionId);
			//3删除问题
			delete = questionDao.deleteQuestionById(questionId);
		} catch (SQLException e) {
			//事务回滚
			try {
				DataSourceUtil.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			//事务提交
			try {
				DataSourceUtil.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return delete==0?false:true;
	}

	/**
	 * 
	 * @Description 隐藏单个question
	 * @date 2018年12月10日 下午9:01:38
	 * @param questionId
	 * @return
	 */
	public boolean hiddenQuestion(String questionId) {
		QuestionDao questionDao = new QuestionDao();
		int update = 0;
		try {
			update = questionDao.hiddenQuestion(questionId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update==0?false:true;
	}

	/**
	 * 
	 * @Description 公开单个question
	 * @date 2018年12月10日 下午9:06:12
	 * @param questionId
	 * @return
	 */
	public boolean publicQuestion(String questionId) {
		QuestionDao questionDao = new QuestionDao();
		int update = 0;
		try {
			update = questionDao.publicQuestion(questionId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return update==0?false:true;
	}

	/**
	 * 
	 * @Description 批量公开question
	 * @date 2018年12月10日 下午10:05:27
	 */
	public int batchPublic(String[] questionIds) {
		QuestionDao questionDao = new QuestionDao();
		int update = 0,i = 0;
		for(String questionId : questionIds) {
			try {
				i = questionDao.publicQuestion(questionId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			update += i;
		}
		return update;
	}

	/**
	 * 
	 * @Description 批量隐藏question
	 * @date 2018年12月10日 下午10:38:11
	 * @param questionIds
	 * @return
	 */
	public int batchHidden(String[] questionIds) {
		QuestionDao questionDao = new QuestionDao();
		int update = 0,i = 0;
		for(String questionId : questionIds) {
			try {
				i = questionDao.hiddenQuestion(questionId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			update += i;
		}
		return update;
	}

	/**
	 * 
	 * @Description 批量删除question
	 * @date 2018年12月10日 下午10:47:52
	 * @param questionIds
	 * @return
	 */
	public int batchDelete(String[] questionIds) {
		QuestionDao questionDao = new QuestionDao();
		int update = 0,i = 0;
		for(String questionId : questionIds) {
			try {
				//1开启事务
				DataSourceUtil.startTransaction();
				//2删除选项
				questionDao.deleteQuestionOptions(questionId);
				//3删除问题
				i = questionDao.deleteQuestionById(questionId);
			} catch (SQLException e) {
				//事务回滚
				try {
					DataSourceUtil.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				e.printStackTrace();
			} finally {
				//事务提交
				try {
					DataSourceUtil.commit();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			update += i;
		}
		return update;
	}

	/**
	 * 
	 * @Description 修改问题前先获得问题并显示   答题页获得问题
	 * @date 2018年12月12日 下午12:53:55
	 * @param questionId
	 * @return
	 */
	public Question getQuestionById(String questionId) {
		QuestionDao questionDao = new QuestionDao();
		Question question = null;
		try {
			//获得问题
			question = questionDao.getQuestionById(questionId);
			//获得问题分类
			QuestionCategory category = questionDao.getCategoryByID(question.getCategory().getQuestionCategoryID());
			question.setCategory(category);
			//获得单选、多选、填空的选项
			if(1 == question.getType() || 2 == question.getType() || 4 == question.getType()) {
				QuestionOption[] options = questionDao.getOpionsByQuestionId(question.getQuestionId());
				question.setQuestionOptions(options);
			}
		} catch (IllegalAccessException | InvocationTargetException | SQLException e) {
			e.printStackTrace();
		}
		return question;
	}

	/**
	 * 
	 * @Description 更新题目
	 * @date 2018年12月14日 下午2:38:46
	 * @param question
	 * @return
	 */
	public boolean updateQuestion(Question question) {
		QuestionDao questionDao = new QuestionDao();
		boolean flag = true;
		//1判断题型，判断和主观不用添加选项
		if(question.getType() == 3 || question.getType() == 5) {
			//2修改判断Judge、主观Subjective
			try {
				flag = questionDao.updateQuestionJS(question);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else {
			//3修改单选、多选、填空
			try {
				//3.1、开始事务，同时插入问题和问题选项
				DataSourceUtil.startTransaction();
				
				//3.2修改题目
				flag = questionDao.updateQuestion(question);
				
				//3.3如果修改题目成功，修改选项
				if(flag) {
					//删除该题全部选项
					questionDao.deleteQuestionOptions(question.getQuestionId()+"");
					//重新添加该题的选项
					for(QuestionOption option : question.getQuestionOptions()) {
						questionDao.addQuestionOption(option);
					}
				} else {
					DataSourceUtil.rollback();
				}
				
			} catch (SQLException e) {
				//抛sql异常，执行失败，事务回滚
				try {
					DataSourceUtil.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				flag = false;
				e.printStackTrace();
			} finally {
				//无论失败成功，提交事务
				try {
					DataSourceUtil.commit();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return flag;
	}

	/**
	 * 
	 * @param isDo 题目筛选，是否做（2：不限；1：已做；0：未做）
	 * @param pageSize 每页显示数量
	 * @param currentPage 当前页
	 * @param userType 用户类型0学生；1老师
	 * @param userId 用户id
	 * @Description 题库练习页显示问题列表
	 * @date 2018年12月24日 下午2:38:24
	 * @return pageBean对象
	 */
	public PageBean getQuestionAccessPageBean(int currentPage, int pageSize, String isDo, int userId, int userType) {
		PageBean pageBean = new PageBean();
		//1设置当前页
		pageBean.setCurrentPage(currentPage);
		//2设置每页显示多少条
		pageBean.setPageSize(pageSize);
		//3获取总记录数
		QuestionDao questionDao = new QuestionDao();
		//3.1获取question总记录数
		int totalCount = 0;
		try {
			totalCount = questionDao.getTotalQuestion();
			if(!"2".equals(isDo)) {
				int answerCount = questionDao.getAnswerCount(userId,userType);
				if("1".equals(isDo)) {
					totalCount = answerCount;
				} else if("0".equals(isDo)) {
					totalCount -= answerCount;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		pageBean.setTotalCount(totalCount);
		
		//4计算总页数
		int totalPage = (int) Math.ceil((Double.parseDouble(totalCount + ""))/pageSize);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	/**
	 * 
	 * @Description 题库答题显示页：获得questionList和表示是否做的数组（2表示错误；1表示正确；0表示未做）
	 * @date 2018年12月25日 上午9:41:35
	 * @param pageBean 分页对象
	 * @param isDo 是否做(2不限；1已做；0未做)
	 * @param userId 老师学生Id
	 * @param userType 用户类型（0学生，1老师）
	 * @return
	 */
	public QuestionAndIsDo getQuestionAndIsDo(PageBean pageBean, String isDo, int userId, int userType) {
		QuestionDao questionDao = new QuestionDao();
		QuestionAndIsDo questionAndIsDo = new QuestionAndIsDo();
		//1获得questionList
		List<Question> questionList = null;
		try {
			questionList = questionDao.getQuestionList(pageBean,isDo,userId,userType);
			
			if(questionList != null) {
				for (Question question : questionList) {
					//1.1截取题目长度——为了页面显示美观，长度20
					int endIndex = 20;
					if(question.getQuestionContent().length() <= 20) {
						endIndex = question.getQuestionContent().length();
					}
					question.setQuestionContent(question.getQuestionContent().substring(0, endIndex));
					//1.2获得分类名称
					QuestionCategory category = questionDao.getCategoryByID(question.getCategory().getQuestionCategoryID());
					question.setCategory(category);
				}
			}
		} catch (IllegalAccessException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (InvocationTargetException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		questionAndIsDo.setQuestionList(questionList);
		
		//2遍历判断题目该用户是否做
		int[] isdo = new int[questionList.size()];
		int index = 0;
		if(questionList != null) {
			for (Question question : questionList) {
				int i = 0;
				try {
					i = questionDao.userIsDoQuestion(question.getQuestionId(),userType,userId);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				isdo[index++] = i;
			}
		}
		questionAndIsDo.setIsDo(isdo);
		return questionAndIsDo;
	}

	/**
	 * 
	 * @param userId2 
	 * @Description 获得用户答题值
	 * @date 2019年1月11日 下午4:43:40
	 * @return
	 */
	public QuestionAnswerOfUser getQuestionAnswer(String questionId, int type, int userType, int userId) {
		QuestionDao questionDao = new QuestionDao();
		QuestionAnswerOfUser answerOfUser = null;
		try {
			//获得用户答题答案
			answerOfUser = questionDao.getQuestionAnswer(questionId, userType, userId);
			//获得填空题选项
			if(type == 4 && answerOfUser != null) {
				ArrayList<QuestionAnswerItem> gapfillingAnswers = questionDao.questionAnswerGapfillingItem(answerOfUser.getUserQuestionId());
				answerOfUser.setGapfillingAnswers(gapfillingAnswers);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return answerOfUser;
	}

	/**
	 * 
	 * @Description 获得上一个问题
	 * @date 2019年1月12日 下午6:25:08
	 * @param currentQuestionId
	 * @return
	 */
	public Question previousQuestion(String currentQuestionId) {
		QuestionDao questionDao = new QuestionDao();
		Question question = null;
		try {
			//获得问题
			question = questionDao.previousQuestion(currentQuestionId);
			//获得问题分类
			QuestionCategory category = questionDao.getCategoryByID(question.getCategory().getQuestionCategoryID());
			question.setCategory(category);
			//获得单选、多选、填空的选项
			if(1 == question.getType() || 2 == question.getType() || 4 == question.getType()) {
				QuestionOption[] options = questionDao.getOpionsByQuestionId(question.getQuestionId());
				question.setQuestionOptions(options);
			}
		} catch (IllegalAccessException | InvocationTargetException | SQLException e) {
			e.printStackTrace();
		}
		return question;
	}

	/**
	 * 
	 * @Description 获得下一题
	 * @date 2019年1月12日 下午6:34:32
	 * @param currentQuestionId
	 * @return
	 */
	public Question nextQuestion(String currentQuestionId) {
		QuestionDao questionDao = new QuestionDao();
		Question question = null;
		try {
			//获得问题
			question = questionDao.nextQuestion(currentQuestionId);
			//获得问题分类
			QuestionCategory category = questionDao.getCategoryByID(question.getCategory().getQuestionCategoryID());
			question.setCategory(category);
			//获得单选、多选、填空的选项
			if(1 == question.getType() || 2 == question.getType() || 4 == question.getType()) {
				QuestionOption[] options = questionDao.getOpionsByQuestionId(question.getQuestionId());
				question.setQuestionOptions(options);
			}
		} catch (IllegalAccessException | InvocationTargetException | SQLException e) {
			e.printStackTrace();
		}
		return question;
	}


}
