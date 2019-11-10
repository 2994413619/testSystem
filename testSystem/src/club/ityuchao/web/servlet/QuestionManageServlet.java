package club.ityuchao.web.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import club.ityuchao.domain.PageBean;
import club.ityuchao.domain.Question;
import club.ityuchao.domain.QuestionCategory;
import club.ityuchao.domain.QuestionOption;
import club.ityuchao.domain.User;
import club.ityuchao.service.QuestionService;
import club.ityuchao.utils.GetQuestionId;

/**
 * 
 * @author ����
 * @date 2018��12��7��
 * @Description Ȩ�ޣ���ʦ�û���������⣺��ӡ��޸ġ��鿴��ɾ��
 *
 */
@WebServlet("/teacher/question")
public class QuestionManageServlet extends BaseServlet {

	/**
	 * 
	 * @Description �����Ŀ����
	 * @date 2018��12��7�� ����8:33:36
	 */
	public void getQuestionCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�������Ŀ����
		QuestionService questionService = new QuestionService();
		List<QuestionCategory> questionCategoryList = questionService.getQuestionCategory();
		
		//2������Ŀ���༯�ϴ���request����
		request.setAttribute("questionCategoryList", questionCategoryList);
		
		//3������type��ת����ͬ�����Ŀ��ҳ��
		String type = request.getParameter("type");
		if("1".equals(type)) {
			request.getRequestDispatcher("/addQuestionChoose.jsp").forward(request, response);
		} else if("2".equals(type)) {
			request.getRequestDispatcher("/addQuestionMultiChoose.jsp").forward(request, response);
		} else if("3".equals(type)) {
			request.getRequestDispatcher("/addQuestionJudge.jsp").forward(request, response);
		} else if("4".equals(type)) {
			request.getRequestDispatcher("/addQuestionGapFilling.jsp").forward(request, response);
		} else if("5".equals(type)) {
			request.getRequestDispatcher("/addQuestionSubjective.jsp").forward(request, response);
		}
	}
	
	/**
	 * 
	 * @Description ��ѡ�����
	 * @date 2018��12��7�� ����9:05:45
	 */
	public void addQuestionChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װquestionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
		
		//1.5��װA��B��C��Dѡ����Ϣ
		QuestionOption[] questionOption = new QuestionOption[4];
		questionOption[0] = new QuestionOption();
		questionOption[0].setOptionIndex("A");
		questionOption[0].setOptionContent(request.getParameter("A"));
		questionOption[0].setQuestionId(questionId);
		
		questionOption[1] = new QuestionOption();
		questionOption[1].setOptionIndex("B");
		questionOption[1].setOptionContent(request.getParameter("B"));
		questionOption[1].setQuestionId(questionId);
		
		questionOption[2] = new QuestionOption();
		questionOption[2].setOptionIndex("C");
		questionOption[2].setOptionContent(request.getParameter("C"));
		questionOption[2].setQuestionId(questionId);
		
		questionOption[3] = new QuestionOption();
		questionOption[3].setOptionIndex("D");
		questionOption[3].setOptionContent(request.getParameter("D"));
		questionOption[3].setQuestionId(questionId);
		question.setQuestionOptions(questionOption);
		
		//1.6��װ����ǰ̨û�д�������Ϣ
		question.setType(1);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//��ʦID���˴�ֱ�ӷ�װ��ʦ����
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('���ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}

	/**
	 * 
	 * @Description ��ѡ�����
	 * @date 2018��12��7�� ����11:02:41
	 */
	public void addQuestionMultiChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װquestionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
		
		//1.5��װA��B��C��D...ѡ����Ϣ
		int optionCount = Integer.parseInt(request.getParameter("optionCount"));
		QuestionOption[] questionOption = new QuestionOption[optionCount];
		for(int i = 0; i < optionCount; i++) {
			char index = (char)(65 + i);
			questionOption[i] = new QuestionOption();
			questionOption[i].setOptionIndex(index+"");
			questionOption[i].setOptionContent(request.getParameter(index+""));
			questionOption[i].setQuestionId(questionId);
		}
		question.setQuestionOptions(questionOption);
		//1.6��װ��
		String[] rightChooses = request.getParameterValues("rightChoose");
		String answer = "";
		for(String choose : rightChooses) {
			answer += choose;
		}
		question.setAnswer(answer);
		
		//1.7��װ����ǰ̨û�д�������Ϣ
		question.setType(2);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//��ʦID���˴�ֱ�ӷ�װ��ʦ����
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('���ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}

	/**
	 * 
	 * @Description �ж������
	 * @date 2018��12��8�� ����4:30:57
	 */
	public void addQuestionJudge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װquestionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
				
		//1.5��װ����ǰ̨û�д�������Ϣ
		question.setType(3);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//��ʦID���˴�ֱ�ӷ�װ��ʦ����
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('���ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}
	
	/**
	 * 
	 * @Description ��������
	 * @date 2018��12��8�� ����4:04:50
	 */
	public void addQuestionGapFilling(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װquestionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
		
		//1.5��װ1��2��3��4...ѡ����Ϣ
		int optionCount = Integer.parseInt(request.getParameter("optionCount"));
		QuestionOption[] questionOption = new QuestionOption[optionCount];
		for(int i = 1; i <= optionCount; i++) {
			questionOption[i - 1] = new QuestionOption();
			questionOption[i - 1].setOptionIndex(i+"");
			questionOption[i - 1].setOptionContent(request.getParameter(i+""));
			questionOption[i - 1].setQuestionId(questionId);
		}
		question.setQuestionOptions(questionOption);
		
		//1.6��װ��ɣ���____i____��ʾ��յĿ�
		String questionContent = "";
		for(int i = 0; i <= optionCount; i++) {
			if(i == 0) {
				questionContent += request.getParameter("questionStep"+i);
			} else {
				String thisC = request.getParameter("questionStep"+i);
				//��������Ϊ�գ����Ϊ�ո�
				if("".equals(thisC)) {
					thisC = " ";
				}
				questionContent += "____" + i + "____" + thisC;
			}
		}
		question.setQuestionContent(questionContent);
		
		//1.7��װ�𰸸���
		question.setAnswer(optionCount+"");
		
		//1.8��װ����ǰ̨û�д�������Ϣ
		question.setType(4);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//��ʦID���˴�ֱ�ӷ�װ��ʦ����
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('���ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}
	
	/**
	 * 
	 * @Description ���������
	 * @date 2018��12��8�� ����4:41:56
	 */
	public void addQuestionSubjective(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װquestionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
				
		//1.5��װ����ǰ̨û�д�������Ϣ
		question.setType(5);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//��ʦID���˴�ֱ�ӷ�װ��ʦ����
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('���ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}
	
	/**
	 * 
	 * @Description ����������ҳ��ʾ��Ŀ
	 * @date 2018��12��9�� ����6:54:56
	 */
	public void getQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ǰ̨����
		//1.1��õ�ǰҳ
		String currentPageS= request.getParameter("currentPage");
		int currentPage = 1;//Ĭ�ϵ�ǰҳΪ��һҳ
		if(currentPageS != null && !"".equals(currentPageS)) {
			currentPage = Integer.parseInt(currentPageS);
		}
		
		//1.2�����������
		String order = request.getParameter("order");
		//1.3��÷�������
		String questionCategoryID = request.getParameter("questionCategoryID");
		//1.4�����������
		String type = request.getParameter("type");
		
		QuestionService questionService = new QuestionService();
		
		//2.�����ʦId
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int teacherID = user.getTeacher().getTeacherId();
		
		//3�����pageBean
		PageBean pageBean = questionService.getQuestionManagePageBean(currentPage,10,teacherID,order,questionCategoryID,type);
		
		//4.���questionList
		List<Question> questionList = questionService.getQuestions(pageBean,teacherID,order,questionCategoryID,type);
		
		//4.���QuestionCategoryList
		List<QuestionCategory> questionCategoryList = questionService.getQuestionCategory();
		
		//5.���ݴ���request��
		//5.1����QuestionCategoryList
		request.setAttribute("questionCategoryList", questionCategoryList);
		//5.2����questionList
		request.setAttribute("questionList", questionList);
		//5.3��������
		request.setAttribute("order", order);
		request.setAttribute("questionCategoryID", questionCategoryID);
		request.setAttribute("type", type);
		//5.4�����ҳ����
		request.setAttribute("pageBean", pageBean);
		
		//ת����/questionBankManage.jsp
		request.getRequestDispatcher("/questionBankManage.jsp").forward(request, response);
	}
	
	/**
	 * 
	 * @Description ɾ������question
	 * @date 2018��12��10�� ����12:57:16
	 */
	public void deleteQuestionById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�������Id
		String questionId = request.getParameter("questionId");
		//����questionId��service�㣬ɾ������question
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.deleteQuestionById(questionId);
		//����ɾ��״̬
		response.getWriter().write(isSuccess+"");
	}
	
	/**
	 * 
	 * @Description ���ص���question
	 * @date 2018��12��10�� ����2:28:04
	 */
	public void hiddenQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�������Id
		String questionId = request.getParameter("questionId");
		//����questionId��service�㣬���ص���question
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.hiddenQuestion(questionId);
		//��������״̬
		response.getWriter().write(isSuccess+"");
	}
	
	/**
	 * 
	 * @Description ��������question
	 * @date 2018��12��10�� ����2:28:48
	 */
	public void publicQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�������Id
		String questionId = request.getParameter("questionId");
		//����questionId��service�㣬��������question
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.publicQuestion(questionId);
		//���ع���״̬
		response.getWriter().write(isSuccess+"");
	}

	/**
	 * 
	 * @Description ��������question
	 * @date 2018��12��10�� ����10:00:27
	 */
	public void batchPublic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�������Id����
		String[] questionIds = request.getParameterValues("questionIds");
		//����questionIds��service�㣬��������question
		QuestionService questionService = new QuestionService();
		int update = questionService.batchPublic(questionIds);
		//���ع�������ĸ���
		response.getWriter().write(update+"");
	}
	
	/**
	 * 
	 * @Description ��������question
	 * @date 2018��12��10�� ����10:36:37
	 */
	public void batchHidden(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�������Id����
		String[] questionIds = request.getParameterValues("questionIds");
		//����questionIds��service�㣬��������question
		QuestionService questionService = new QuestionService();
		int update = questionService.batchHidden(questionIds);
		//���ع�������ĸ���
		response.getWriter().write(update+"");
	}
	
	/**
	 * 
	 * @Description ����ɾ��question
	 * @date 2018��12��10�� ����10:46:35
	 */
	public void batchDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�������Id����
		String[] questionIds = request.getParameterValues("questionIds");
		//����questionIds��service�㣬����ɾ��question
		QuestionService questionService = new QuestionService();
		int update = questionService.batchDelete(questionIds);
		//���ع�������ĸ���
		response.getWriter().write(update+"");
	}
	
	/**
	 * 
	 * @Description �޸�����ǰ�Ȼ�����Ⲣ��ʾ
	 * @date 2018��12��12�� ����12:17:30
	 */
	public void getQuestionById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1���questionId
		String questionId = request.getParameter("questionId");
		//2���question����
		QuestionService questionService = new QuestionService();
		Question question = questionService.getQuestionById(questionId);
		//3�����Ŀ�����б�
		List<QuestionCategory> questionCategoryList = questionService.getQuestionCategory();
		//4��question����ͷ����б����request����
		request.setAttribute("questionCategoryList", questionCategoryList);
		request.setAttribute("question", question);
		//5��ȡ��ǰҳ������request���У������޸��������ת����Ŀ����ҳ��
		String currentPage = request.getParameter("currentPage");
		request.setAttribute("currentPage", currentPage);
		//6������Ŀ���Ͳ�ͬ��ת����ͬҳ
		switch (question.getType()) {
		case 1:
			request.getRequestDispatcher("/questionUpdateChoose.jsp").forward(request, response);
			break;
		case 2:
			request.getRequestDispatcher("/questionUpdateMultiChoose.jsp").forward(request, response);
			break;
		case 3:
			request.getRequestDispatcher("/questionUpdateJudge.jsp").forward(request, response);
			break;
		case 4:
			//����⣬�����ת��Ϊ�ַ����������飬����jspҳ����ʾ
			int size = question.getQuestionOptions().length + 1;
			String[] con = question.getQuestionContent().split("____");
			String[] contentItems = new String[size];
			for(int i = 0; i < size; i++) {
				contentItems[i] = con[i * 2];
			}
			request.setAttribute("contentItems", contentItems);
			request.getRequestDispatcher("/questionUpdateGapFilling.jsp").forward(request, response);
			break;
		case 5:
			request.getRequestDispatcher("/questionUpdateSubjective.jsp").forward(request, response);
			break;
		default:
			break;
		}
		/*if(question.getType() == 1) {
			request.getRequestDispatcher("/questionUpdateChoose.jsp").forward(request, response);
		} else if(question.getType() == 2) {
			request.getRequestDispatcher("/questionUpdateMultiChoose.jsp").forward(request, response);
		} else if(question.getType() == 3) {
			request.getRequestDispatcher("/questionUpdateJudge.jsp").forward(request, response);
		} else if(question.getType() == 4) {
			request.getRequestDispatcher("/questionUpdateGapFilling.jsp").forward(request, response);
		} else if(question.getType() == 5) {
			request.getRequestDispatcher("/questionUpdateSubjective.jsp").forward(request, response);
		}*/
	}
	
	/**
	 * 
	 * @Description �޸ĵ�ѡ
	 * @date 2018��12��14�� ����2:25:43
	 */
	public void updateChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װA��B��C��Dѡ����Ϣ
		QuestionOption[] questionOption = new QuestionOption[4];
		questionOption[0] = new QuestionOption();
		questionOption[0].setOptionIndex("A");
		questionOption[0].setOptionContent(request.getParameter("A"));
		questionOption[0].setQuestionId(question.getQuestionId());
		
		questionOption[1] = new QuestionOption();
		questionOption[1].setOptionIndex("B");
		questionOption[1].setOptionContent(request.getParameter("B"));
		questionOption[1].setQuestionId(question.getQuestionId());
		
		questionOption[2] = new QuestionOption();
		questionOption[2].setOptionIndex("C");
		questionOption[2].setOptionContent(request.getParameter("C"));
		questionOption[2].setQuestionId(question.getQuestionId());
		
		questionOption[3] = new QuestionOption();
		questionOption[3].setOptionIndex("D");
		questionOption[3].setOptionContent(request.getParameter("D"));
		questionOption[3].setQuestionId(question.getQuestionId());
		question.setQuestionOptions(questionOption);
		
		//1.5��װ����
		question.setType(1);
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			//��õ�ǰҳ����ת���������һҳ��
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('�޸�ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}
	
	/**
	 * 
	 * @Description �޸Ķ�ѡ
	 * @date 2018��12��14�� ����3:16:01
	 */
	public void updateMultiChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װA��B��C��D...ѡ����Ϣ
		int optionCount = Integer.parseInt(request.getParameter("optionCount"));
		QuestionOption[] questionOption = new QuestionOption[optionCount];
		for(int i = 0; i < optionCount; i++) {
			char index = (char)(65 + i);
			questionOption[i] = new QuestionOption();
			questionOption[i].setOptionIndex(index+"");
			questionOption[i].setOptionContent(request.getParameter(index+""));
			questionOption[i].setQuestionId(question.getQuestionId());
		}
		question.setQuestionOptions(questionOption);
		//1.5��װ��
		String[] rightChooses = request.getParameterValues("rightChoose");
		String answer = "";
		for(String choose : rightChooses) {
			answer += choose;
		}
		question.setAnswer(answer);
		
		//1.6��װ����
		question.setType(2);
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			//��õ�ǰҳ����ת���������һҳ��
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('�޸�ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}
	
	/**
	 * 
	 * @Description �޸��ж�
	 * @date 2018��12��14�� ����3:24:25
	 */
	public void updateJudge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.6��װ����
		question.setType(3);
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			//��õ�ǰҳ����ת���������һҳ��
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('�޸�ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}
	
	/**
	 * 
	 * @Description �޸����
	 * @date 2018��12��14�� ����3:30:26
	 */
	public void updateGapFilling(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װ1��2��3��4...ѡ����Ϣ
		int optionCount = Integer.parseInt(request.getParameter("optionCount"));
		QuestionOption[] questionOption = new QuestionOption[optionCount];
		for(int i = 1; i <= optionCount; i++) {
			questionOption[i - 1] = new QuestionOption();
			questionOption[i - 1].setOptionIndex(i+"");
			questionOption[i - 1].setOptionContent(request.getParameter(i+""));
			questionOption[i - 1].setQuestionId(question.getQuestionId());
		}
		question.setQuestionOptions(questionOption);
		
		//1.5��װ��ɣ���____i____��ʾ��յĿ�
		String questionContent = "";
		for(int i = 0; i <= optionCount; i++) {
			if(i == 0) {
				questionContent += request.getParameter("questionStep"+i);
			} else {
				String thisC = request.getParameter("questionStep"+i);
				//��������Ϊ�գ����Ϊ�ո�
				if("".equals(thisC)) {
					thisC = " ";
				}
				questionContent += "____" + i + "____" + thisC;
			}
		}
		question.setQuestionContent(questionContent);
		
		//1.6��װ�𰸸���
		question.setAnswer(optionCount+"");
		
		//1.7��װ��Ŀ���͡������
		question.setType(4);
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			//��õ�ǰҳ����ת���������һҳ��
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('�޸�ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}

	/**
	 * 
	 * @Description �޸�����
	 * @date 2018��12��14�� ����3:38:41
	 */
	public void updateSubjective(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1�����ݷ�װ
		request.setCharacterEncoding("UTF-8");
		
		//1.1���ȫ��ǰ̨����
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2��װǰ̨������ѡ���Ŀ����Id��������Ϣ
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3��װ��Ŀ����Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4��װ��Ŀ���͡�������
		question.setType(5);
		
		//2���ݴ��ݵ�service��
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3������ӽ����������
		if(isSuccess) {
			//��õ�ǰҳ����ת���������һҳ��
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('�޸�ʧ�ܣ�����ϵ��վά����Ա')</script>");
		}
	}
	
}
