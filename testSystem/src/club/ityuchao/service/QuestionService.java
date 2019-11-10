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
 * @author ����
 * @date 2018��12��7��
 * @Description ��ʦ������Ŀservice
 *
 */
public class QuestionService {

	/**
	 * 
	 * @Description indexҳ������
	 * @date 2018��12��8�� ����5:40:11
	 * @return ��ȷ����͵�10�����⼯��
	 */
	public List<Question> getAccuracyList() {
		List<Question> accuracyList = null;
		QuestionDao questionDao = new QuestionDao();
		try {
			accuracyList = questionDao.getAccuracyList();
			//����questionCategoryID���questionCategoryName
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
	 * @Description indexҳ������
	 * @date 2018��12��8�� ����5:50:50
	 * @return �Ѷ�level��ߵ�10�����⼯��
	 */
	public List<Question> getaddDateList() {
		List<Question> levelList = null;
		QuestionDao questionDao = new QuestionDao();
		try {
			levelList = questionDao.getaddDateList();
			//����questionCategoryID���questionCategoryName
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
	 * @Description ��ʦ�����Ŀǰ����׼����Ŀ����
	 * @date 2018��12��7�� ����8:45:26
	 * @return ������Ŀ���༯��
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
	 * @Description ��ӵ�ѡ����ѡ������� ����Ϊ��ѡ�����ʹ�����񣩣��жϡ����ۣ���������
	 * @date 2018��12��7�� ����10:00:24
	 * @param question �������
	 * @return ��ӳɹ�true��ʧ��false
	 */
	public boolean addQuestion(Question question) {
		QuestionDao questionDao = new QuestionDao();
		boolean flag = true;
		//1�ж����ͣ��жϺ����۲������ѡ��
		if(question.getType() == 3 || question.getType() == 5) {
			//2����ж�J������S
			try {
				flag = questionDao.addQuestionJS(question);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else {
			//3��ӵ�ѡ����ѡ�����
			try {
				//3.1����ʼ����ͬʱ�������������ѡ��
				DataSourceUtil.startTransaction();
				
				//3.2�����Ŀ
				flag = questionDao.addQuestion(question);
				
				//3.3��������Ŀ�ɹ������ѡ��
				if(flag) {
					for(QuestionOption option : question.getQuestionOptions()) {
						questionDao.addQuestionOption(option);
					}
				} else {
					DataSourceUtil.rollback();
				}
				
			} catch (SQLException e) {
				//��sql�쳣��ִ��ʧ�ܣ�����ع�
				try {
					DataSourceUtil.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				flag = false;
				e.printStackTrace();
			} finally {
				//����ʧ�ܳɹ����ύ����
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
	 * @Description ��ʦ��������ҳ����÷�ҳ����
	 * @date 2018��12��9�� ����7:24:59
	 * @param currentPage ��ǰҳ
	 * @param pageSize ÿҳ��ʾ����
	 * @param tableName Ҫ��ѯ�ı���
	 * @param type 
	 * @param questionCategoryID 
	 * @param order 
	 * @return PageBean����
	 */
	public PageBean getQuestionManagePageBean(int currentPage, int pageSize,int teacherID, String order, String questionCategoryID, String type) {
		QuestionDao questionDao = new QuestionDao();
		PageBean pageBean = new PageBean();
		
		//���õ�ǰҳ
		pageBean.setCurrentPage(currentPage);
		
		//����ÿҳ��ʾ����
		pageBean.setPageSize(pageSize);
		
		//�����������question���ܼ�¼��
		int totalCount = 0;
		try {
			totalCount = questionDao.getTotalCountByTableName(teacherID,order,questionCategoryID,type);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//�����ܼ�¼��
		pageBean.setTotalCount(totalCount);
		
		//������ҳ��
		int totalPage = (int) Math.ceil((Double.parseDouble(totalCount + ""))/pageSize);
		//������ҳ��
		pageBean.setTotalPage(totalPage);
		
		//�����ǰҳ-1��,�����һҳ
		if(currentPage == -1) {
			pageBean.setCurrentPage(totalPage);
		}
		
		return pageBean;
	}

	/**
	 * 
	 * @Description ��ʦ����ҳ����ҳ��ʾȫ������
	 * @date 2018��12��9�� ����8:02:13
	 * @param pageBean ��ҳ����
	 * @param order �������
	 * @param questionCategoryID ����Id
	 * @param type ��Ŀ���ͣ�1~5��
	 * @return 
	 */
	public List<Question> getQuestions(PageBean pageBean,int teacherID, String order, String questionCategoryID, String type) {
		QuestionDao questionDao = new QuestionDao();
		List<Question> questionList = null;
		try {
			questionList = questionDao.getQuestions(pageBean, teacherID, order, questionCategoryID, type);
			
			for(Question question : questionList) {
				
				//����questionCategoryID���questionCategoryName
				int CategoryID = question.getCategory().getQuestionCategoryID();
				QuestionCategory category = questionDao.getCategoryByID(CategoryID);
				question.setCategory(category);
				
				//��õ�ѡ����ѡ����յ�ѡ��
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
	 * @Description ɾ������question
	 * @date 2018��12��10�� ����1:35:40
	 * @param questionId
	 * @return
	 */
	public boolean deleteQuestionById(String questionId) {
		QuestionDao questionDao = new QuestionDao();
		int delete = 0;
		try {
			//1��������
			DataSourceUtil.startTransaction();
			//2ɾ��ѡ��
			questionDao.deleteQuestionOptions(questionId);
			//3ɾ������
			delete = questionDao.deleteQuestionById(questionId);
		} catch (SQLException e) {
			//����ع�
			try {
				DataSourceUtil.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			//�����ύ
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
	 * @Description ���ص���question
	 * @date 2018��12��10�� ����9:01:38
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
	 * @Description ��������question
	 * @date 2018��12��10�� ����9:06:12
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
	 * @Description ��������question
	 * @date 2018��12��10�� ����10:05:27
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
	 * @Description ��������question
	 * @date 2018��12��10�� ����10:38:11
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
	 * @Description ����ɾ��question
	 * @date 2018��12��10�� ����10:47:52
	 * @param questionIds
	 * @return
	 */
	public int batchDelete(String[] questionIds) {
		QuestionDao questionDao = new QuestionDao();
		int update = 0,i = 0;
		for(String questionId : questionIds) {
			try {
				//1��������
				DataSourceUtil.startTransaction();
				//2ɾ��ѡ��
				questionDao.deleteQuestionOptions(questionId);
				//3ɾ������
				i = questionDao.deleteQuestionById(questionId);
			} catch (SQLException e) {
				//����ع�
				try {
					DataSourceUtil.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				e.printStackTrace();
			} finally {
				//�����ύ
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
	 * @Description �޸�����ǰ�Ȼ�����Ⲣ��ʾ   ����ҳ�������
	 * @date 2018��12��12�� ����12:53:55
	 * @param questionId
	 * @return
	 */
	public Question getQuestionById(String questionId) {
		QuestionDao questionDao = new QuestionDao();
		Question question = null;
		try {
			//�������
			question = questionDao.getQuestionById(questionId);
			//����������
			QuestionCategory category = questionDao.getCategoryByID(question.getCategory().getQuestionCategoryID());
			question.setCategory(category);
			//��õ�ѡ����ѡ����յ�ѡ��
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
	 * @Description ������Ŀ
	 * @date 2018��12��14�� ����2:38:46
	 * @param question
	 * @return
	 */
	public boolean updateQuestion(Question question) {
		QuestionDao questionDao = new QuestionDao();
		boolean flag = true;
		//1�ж����ͣ��жϺ����۲������ѡ��
		if(question.getType() == 3 || question.getType() == 5) {
			//2�޸��ж�Judge������Subjective
			try {
				flag = questionDao.updateQuestionJS(question);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else {
			//3�޸ĵ�ѡ����ѡ�����
			try {
				//3.1����ʼ����ͬʱ�������������ѡ��
				DataSourceUtil.startTransaction();
				
				//3.2�޸���Ŀ
				flag = questionDao.updateQuestion(question);
				
				//3.3����޸���Ŀ�ɹ����޸�ѡ��
				if(flag) {
					//ɾ������ȫ��ѡ��
					questionDao.deleteQuestionOptions(question.getQuestionId()+"");
					//������Ӹ����ѡ��
					for(QuestionOption option : question.getQuestionOptions()) {
						questionDao.addQuestionOption(option);
					}
				} else {
					DataSourceUtil.rollback();
				}
				
			} catch (SQLException e) {
				//��sql�쳣��ִ��ʧ�ܣ�����ع�
				try {
					DataSourceUtil.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				flag = false;
				e.printStackTrace();
			} finally {
				//����ʧ�ܳɹ����ύ����
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
	 * @param isDo ��Ŀɸѡ���Ƿ�����2�����ޣ�1��������0��δ����
	 * @param pageSize ÿҳ��ʾ����
	 * @param currentPage ��ǰҳ
	 * @param userType �û�����0ѧ����1��ʦ
	 * @param userId �û�id
	 * @Description �����ϰҳ��ʾ�����б�
	 * @date 2018��12��24�� ����2:38:24
	 * @return pageBean����
	 */
	public PageBean getQuestionAccessPageBean(int currentPage, int pageSize, String isDo, int userId, int userType) {
		PageBean pageBean = new PageBean();
		//1���õ�ǰҳ
		pageBean.setCurrentPage(currentPage);
		//2����ÿҳ��ʾ������
		pageBean.setPageSize(pageSize);
		//3��ȡ�ܼ�¼��
		QuestionDao questionDao = new QuestionDao();
		//3.1��ȡquestion�ܼ�¼��
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
		
		//4������ҳ��
		int totalPage = (int) Math.ceil((Double.parseDouble(totalCount + ""))/pageSize);
		pageBean.setTotalPage(totalPage);
		return pageBean;
	}

	/**
	 * 
	 * @Description ��������ʾҳ�����questionList�ͱ�ʾ�Ƿ��������飨2��ʾ����1��ʾ��ȷ��0��ʾδ����
	 * @date 2018��12��25�� ����9:41:35
	 * @param pageBean ��ҳ����
	 * @param isDo �Ƿ���(2���ޣ�1������0δ��)
	 * @param userId ��ʦѧ��Id
	 * @param userType �û����ͣ�0ѧ����1��ʦ��
	 * @return
	 */
	public QuestionAndIsDo getQuestionAndIsDo(PageBean pageBean, String isDo, int userId, int userType) {
		QuestionDao questionDao = new QuestionDao();
		QuestionAndIsDo questionAndIsDo = new QuestionAndIsDo();
		//1���questionList
		List<Question> questionList = null;
		try {
			questionList = questionDao.getQuestionList(pageBean,isDo,userId,userType);
			
			if(questionList != null) {
				for (Question question : questionList) {
					//1.1��ȡ��Ŀ���ȡ���Ϊ��ҳ����ʾ���ۣ�����20
					int endIndex = 20;
					if(question.getQuestionContent().length() <= 20) {
						endIndex = question.getQuestionContent().length();
					}
					question.setQuestionContent(question.getQuestionContent().substring(0, endIndex));
					//1.2��÷�������
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
		
		//2�����ж���Ŀ���û��Ƿ���
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
	 * @Description ����û�����ֵ
	 * @date 2019��1��11�� ����4:43:40
	 * @return
	 */
	public QuestionAnswerOfUser getQuestionAnswer(String questionId, int type, int userType, int userId) {
		QuestionDao questionDao = new QuestionDao();
		QuestionAnswerOfUser answerOfUser = null;
		try {
			//����û������
			answerOfUser = questionDao.getQuestionAnswer(questionId, userType, userId);
			//��������ѡ��
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
	 * @Description �����һ������
	 * @date 2019��1��12�� ����6:25:08
	 * @param currentQuestionId
	 * @return
	 */
	public Question previousQuestion(String currentQuestionId) {
		QuestionDao questionDao = new QuestionDao();
		Question question = null;
		try {
			//�������
			question = questionDao.previousQuestion(currentQuestionId);
			//����������
			QuestionCategory category = questionDao.getCategoryByID(question.getCategory().getQuestionCategoryID());
			question.setCategory(category);
			//��õ�ѡ����ѡ����յ�ѡ��
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
	 * @Description �����һ��
	 * @date 2019��1��12�� ����6:34:32
	 * @param currentQuestionId
	 * @return
	 */
	public Question nextQuestion(String currentQuestionId) {
		QuestionDao questionDao = new QuestionDao();
		Question question = null;
		try {
			//�������
			question = questionDao.nextQuestion(currentQuestionId);
			//����������
			QuestionCategory category = questionDao.getCategoryByID(question.getCategory().getQuestionCategoryID());
			question.setCategory(category);
			//��õ�ѡ����ѡ����յ�ѡ��
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
