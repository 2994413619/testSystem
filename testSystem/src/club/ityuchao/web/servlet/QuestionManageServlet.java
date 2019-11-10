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
 * @author 喻超
 * @date 2018年12月7日
 * @Description 权限：老师用户；管理题库：添加、修改、查看、删除
 *
 */
@WebServlet("/teacher/question")
public class QuestionManageServlet extends BaseServlet {

	/**
	 * 
	 * @Description 获得题目分类
	 * @date 2018年12月7日 下午8:33:36
	 */
	public void getQuestionCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、获得题目分类
		QuestionService questionService = new QuestionService();
		List<QuestionCategory> questionCategoryList = questionService.getQuestionCategory();
		
		//2、把题目分类集合存入request域中
		request.setAttribute("questionCategoryList", questionCategoryList);
		
		//3、根据type跳转到不同添加题目的页面
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
	 * @Description 单选题添加
	 * @date 2018年12月7日 下午9:05:45
	 */
	public void addQuestionChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装questionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
		
		//1.5封装A、B、C、D选项信息
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
		
		//1.6封装其他前台没有传来的信息
		question.setType(1);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//老师ID（此处直接封装老师对象）
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('添加失败！请联系网站维护人员')</script>");
		}
	}

	/**
	 * 
	 * @Description 多选题添加
	 * @date 2018年12月7日 下午11:02:41
	 */
	public void addQuestionMultiChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装questionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
		
		//1.5封装A、B、C、D...选项信息
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
		//1.6封装答案
		String[] rightChooses = request.getParameterValues("rightChoose");
		String answer = "";
		for(String choose : rightChooses) {
			answer += choose;
		}
		question.setAnswer(answer);
		
		//1.7封装其他前台没有传来的信息
		question.setType(2);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//老师ID（此处直接封装老师对象）
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('添加失败！请联系网站维护人员')</script>");
		}
	}

	/**
	 * 
	 * @Description 判断题添加
	 * @date 2018年12月8日 下午4:30:57
	 */
	public void addQuestionJudge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装questionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
				
		//1.5封装其他前台没有传来的信息
		question.setType(3);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//老师ID（此处直接封装老师对象）
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('添加失败！请联系网站维护人员')</script>");
		}
	}
	
	/**
	 * 
	 * @Description 填空题添加
	 * @date 2018年12月8日 下午4:04:50
	 */
	public void addQuestionGapFilling(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装questionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
		
		//1.5封装1、2、3、4...选项信息
		int optionCount = Integer.parseInt(request.getParameter("optionCount"));
		QuestionOption[] questionOption = new QuestionOption[optionCount];
		for(int i = 1; i <= optionCount; i++) {
			questionOption[i - 1] = new QuestionOption();
			questionOption[i - 1].setOptionIndex(i+"");
			questionOption[i - 1].setOptionContent(request.getParameter(i+""));
			questionOption[i - 1].setQuestionId(questionId);
		}
		question.setQuestionOptions(questionOption);
		
		//1.6封装题干，用____i____表示填空的空
		String questionContent = "";
		for(int i = 0; i <= optionCount; i++) {
			if(i == 0) {
				questionContent += request.getParameter("questionStep"+i);
			} else {
				String thisC = request.getParameter("questionStep"+i);
				//如果该题干为空，则变为空格
				if("".equals(thisC)) {
					thisC = " ";
				}
				questionContent += "____" + i + "____" + thisC;
			}
		}
		question.setQuestionContent(questionContent);
		
		//1.7封装答案个数
		question.setAnswer(optionCount+"");
		
		//1.8封装其他前台没有传来的信息
		question.setType(4);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//老师ID（此处直接封装老师对象）
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('添加失败！请联系网站维护人员')</script>");
		}
	}
	
	/**
	 * 
	 * @Description 主观题添加
	 * @date 2018年12月8日 下午4:41:56
	 */
	public void addQuestionSubjective(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装questionId
		int questionId = GetQuestionId.getId();
		question.setQuestionId(questionId);
				
		//1.5封装其他前台没有传来的信息
		question.setType(5);
		question.setAnswerPeople(0);
		question.setIsPublic(0);
		question.setAverageScore(0);
		question.setAccuracy(0);
		//老师ID（此处直接封装老师对象）
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		question.setTeacher(user.getTeacher());
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.addQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=-1");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('添加失败！请联系网站维护人员')</script>");
		}
	}
	
	/**
	 * 
	 * @Description 根据条件分页显示题目
	 * @date 2018年12月9日 下午6:54:56
	 */
	public void getQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、获得前台数据
		//1.1获得当前页
		String currentPageS= request.getParameter("currentPage");
		int currentPage = 1;//默认当前页为第一页
		if(currentPageS != null && !"".equals(currentPageS)) {
			currentPage = Integer.parseInt(currentPageS);
		}
		
		//1.2获得排序条件
		String order = request.getParameter("order");
		//1.3获得分类条件
		String questionCategoryID = request.getParameter("questionCategoryID");
		//1.4获得题型条件
		String type = request.getParameter("type");
		
		QuestionService questionService = new QuestionService();
		
		//2.获得老师Id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int teacherID = user.getTeacher().getTeacherId();
		
		//3、获得pageBean
		PageBean pageBean = questionService.getQuestionManagePageBean(currentPage,10,teacherID,order,questionCategoryID,type);
		
		//4.获得questionList
		List<Question> questionList = questionService.getQuestions(pageBean,teacherID,order,questionCategoryID,type);
		
		//4.获得QuestionCategoryList
		List<QuestionCategory> questionCategoryList = questionService.getQuestionCategory();
		
		//5.数据存入request中
		//5.1存入QuestionCategoryList
		request.setAttribute("questionCategoryList", questionCategoryList);
		//5.2存入questionList
		request.setAttribute("questionList", questionList);
		//5.3存入条件
		request.setAttribute("order", order);
		request.setAttribute("questionCategoryID", questionCategoryID);
		request.setAttribute("type", type);
		//5.4存入分页对象
		request.setAttribute("pageBean", pageBean);
		
		//转发到/questionBankManage.jsp
		request.getRequestDispatcher("/questionBankManage.jsp").forward(request, response);
	}
	
	/**
	 * 
	 * @Description 删除单个question
	 * @date 2018年12月10日 下午12:57:16
	 */
	public void deleteQuestionById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得问题Id
		String questionId = request.getParameter("questionId");
		//传递questionId到service层，删除单个question
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.deleteQuestionById(questionId);
		//返回删除状态
		response.getWriter().write(isSuccess+"");
	}
	
	/**
	 * 
	 * @Description 隐藏单个question
	 * @date 2018年12月10日 下午2:28:04
	 */
	public void hiddenQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得问题Id
		String questionId = request.getParameter("questionId");
		//传递questionId到service层，隐藏单个question
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.hiddenQuestion(questionId);
		//返回隐藏状态
		response.getWriter().write(isSuccess+"");
	}
	
	/**
	 * 
	 * @Description 公开单个question
	 * @date 2018年12月10日 下午2:28:48
	 */
	public void publicQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得问题Id
		String questionId = request.getParameter("questionId");
		//传递questionId到service层，公开单个question
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.publicQuestion(questionId);
		//返回公开状态
		response.getWriter().write(isSuccess+"");
	}

	/**
	 * 
	 * @Description 批量公开question
	 * @date 2018年12月10日 下午10:00:27
	 */
	public void batchPublic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得问题Id数组
		String[] questionIds = request.getParameterValues("questionIds");
		//传递questionIds到service层，批量公开question
		QuestionService questionService = new QuestionService();
		int update = questionService.batchPublic(questionIds);
		//返回公开问题的个数
		response.getWriter().write(update+"");
	}
	
	/**
	 * 
	 * @Description 批量隐藏question
	 * @date 2018年12月10日 下午10:36:37
	 */
	public void batchHidden(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得问题Id数组
		String[] questionIds = request.getParameterValues("questionIds");
		//传递questionIds到service层，批量隐藏question
		QuestionService questionService = new QuestionService();
		int update = questionService.batchHidden(questionIds);
		//返回公开问题的个数
		response.getWriter().write(update+"");
	}
	
	/**
	 * 
	 * @Description 批量删除question
	 * @date 2018年12月10日 下午10:46:35
	 */
	public void batchDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得问题Id数组
		String[] questionIds = request.getParameterValues("questionIds");
		//传递questionIds到service层，批量删除question
		QuestionService questionService = new QuestionService();
		int update = questionService.batchDelete(questionIds);
		//返回公开问题的个数
		response.getWriter().write(update+"");
	}
	
	/**
	 * 
	 * @Description 修改问题前先获得问题并显示
	 * @date 2018年12月12日 下午12:17:30
	 */
	public void getQuestionById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1获得questionId
		String questionId = request.getParameter("questionId");
		//2获得question对象
		QuestionService questionService = new QuestionService();
		Question question = questionService.getQuestionById(questionId);
		//3获得题目分类列表
		List<QuestionCategory> questionCategoryList = questionService.getQuestionCategory();
		//4将question对象和分类列表存入request域中
		request.setAttribute("questionCategoryList", questionCategoryList);
		request.setAttribute("question", question);
		//5获取当前页并存入request域中，用于修改问题后跳转到题目管理页面
		String currentPage = request.getParameter("currentPage");
		request.setAttribute("currentPage", currentPage);
		//6根据题目类型不同跳转到不同页
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
			//填空题，把题干转换为字符串数组数组，方便jsp页面显示
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
	 * @Description 修改单选
	 * @date 2018年12月14日 下午2:25:43
	 */
	public void updateChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装A、B、C、D选项信息
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
		
		//1.5封装类型
		question.setType(1);
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			//获得但前页，跳转到该题的那一页面
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('修改失败！请联系网站维护人员')</script>");
		}
	}
	
	/**
	 * 
	 * @Description 修改多选
	 * @date 2018年12月14日 下午3:16:01
	 */
	public void updateMultiChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装A、B、C、D...选项信息
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
		//1.5封装答案
		String[] rightChooses = request.getParameterValues("rightChoose");
		String answer = "";
		for(String choose : rightChooses) {
			answer += choose;
		}
		question.setAnswer(answer);
		
		//1.6封装类型
		question.setType(2);
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			//获得但前页，跳转到该题的那一页面
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('修改失败！请联系网站维护人员')</script>");
		}
	}
	
	/**
	 * 
	 * @Description 修改判断
	 * @date 2018年12月14日 下午3:24:25
	 */
	public void updateJudge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.6封装类型
		question.setType(3);
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			//获得但前页，跳转到该题的那一页面
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('修改失败！请联系网站维护人员')</script>");
		}
	}
	
	/**
	 * 
	 * @Description 修改填空
	 * @date 2018年12月14日 下午3:30:26
	 */
	public void updateGapFilling(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装1、2、3、4...选项信息
		int optionCount = Integer.parseInt(request.getParameter("optionCount"));
		QuestionOption[] questionOption = new QuestionOption[optionCount];
		for(int i = 1; i <= optionCount; i++) {
			questionOption[i - 1] = new QuestionOption();
			questionOption[i - 1].setOptionIndex(i+"");
			questionOption[i - 1].setOptionContent(request.getParameter(i+""));
			questionOption[i - 1].setQuestionId(question.getQuestionId());
		}
		question.setQuestionOptions(questionOption);
		
		//1.5封装题干，用____i____表示填空的空
		String questionContent = "";
		for(int i = 0; i <= optionCount; i++) {
			if(i == 0) {
				questionContent += request.getParameter("questionStep"+i);
			} else {
				String thisC = request.getParameter("questionStep"+i);
				//如果该题干为空，则变为空格
				if("".equals(thisC)) {
					thisC = " ";
				}
				questionContent += "____" + i + "____" + thisC;
			}
		}
		question.setQuestionContent(questionContent);
		
		//1.6封装答案个数
		question.setAnswer(optionCount+"");
		
		//1.7封装题目类型——填空
		question.setType(4);
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			//获得但前页，跳转到该题的那一页面
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('修改失败！请联系网站维护人员')</script>");
		}
	}

	/**
	 * 
	 * @Description 修改主观
	 * @date 2018年12月14日 下午3:38:41
	 */
	public void updateSubjective(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、数据封装
		request.setCharacterEncoding("UTF-8");
		
		//1.1获得全部前台数据
		Map<String, String[]> map = request.getParameterMap();
		
		//1.2封装前台传来除选项、题目分类Id外其他信息
		Question question = new Question();
		try {
			BeanUtils.populate(question, map);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		//1.3封装题目分类Id
		int questionCategoryID =  Integer.parseInt(request.getParameter("questionCategoryID"));
		question.getCategory().setQuestionCategoryID(questionCategoryID);
		
		//1.4封装题目类型——主观
		question.setType(5);
		
		//2数据传递到service层
		QuestionService questionService = new QuestionService();
		boolean isSuccess = questionService.updateQuestion(question);
		
		//3根据添加结果控制流向
		if(isSuccess) {
			//获得但前页，跳转到该题的那一页面
			String currentPage = request.getParameter("currentPage");
			response.sendRedirect(request.getContextPath()+"/teacher/question?method=getQuestions&currentPage=" + currentPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write("<script>alert('修改失败！请联系网站维护人员')</script>");
		}
	}
	
}
