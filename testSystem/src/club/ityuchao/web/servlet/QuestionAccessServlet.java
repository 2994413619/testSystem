package club.ityuchao.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Test;

import com.sun.jmx.remote.util.OrderClassLoaders;

import club.ityuchao.domain.PageBean;
import club.ityuchao.domain.Question;
import club.ityuchao.domain.QuestionAndIsDo;
import club.ityuchao.domain.QuestionAnswerOfUser;
import club.ityuchao.domain.User;
import club.ityuchao.service.QuestionService;
import sun.print.resources.serviceui_es;

/**
 * 
 * @author 喻超
 * @date 2018年12月24日
 * @Description 访问权限：老师学生  功能：题库题目显示改分
 *
 */
@WebServlet("/student/question")
public class QuestionAccessServlet extends BaseServlet {

	/**
	 * 
	 * @Description 题库练习页显示问题列表
	 * @date 2018年12月24日 上午10:30:05
	 */
	public void getQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.数据封装
		//1.1获得当前页——默认第一页
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//1.2是否做——默认不限
		String isDo = "2";
		if(request.getParameter("isDo") != null) {
			isDo = request.getParameter("isDo");
		}
		
		//1.3获得页面大小
		int pageSize = 10;
		if(request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		
		//获得用户类型和用户Id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int userType = 0;
		int userId;
		if(user.getStudent() == null) {
			userType = 1;
			userId = user.getTeacher().getTeacherId();
		} else {
			userId = user.getStudent().getStudentId();
		}
		
		//2获得pageBean分页对象
		QuestionService questionService = new QuestionService();
		PageBean pageBean = questionService.getQuestionAccessPageBean(currentPage,pageSize,isDo,userId,userType);
		
		//获得questionList和表示是否做的数组（2表示错误；1表示正确；0表示未做）
		QuestionAndIsDo questionAndIsDo = questionService.getQuestionAndIsDo(pageBean,isDo,userId,userType);
		
		//3.跳转到显示页面
		request.setAttribute("questionAndIsDo", questionAndIsDo);
		request.setAttribute("isDo", isDo);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/questionBank.jsp").forward(request, response);
		
	}
	
	/**
	 * 
	 * @Description 问题列表获得问题详情，跳转到答题页面
	 * @date 2019年1月11日 下午4:12:29
	 */
	public void getQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得questionId
		String questionId = request.getParameter("questionId");
		//获得用户Id
		HttpSession session = request.getSession();
		User user = null;
		if(session != null) {
			user = (User) session.getAttribute("user");
		}
		//用户类型0学生，1老师
		int userType = 0;
		int userId = 0;
		if(user != null) {
			if(user.getStudent() != null) {
				userId = user.getStudent().getStudentId();
			} else {
				userId = user.getTeacher().getTeacherId();
				userType = 1;
			}
		}
		
		QuestionService questionService = new QuestionService();
		//或缺question
		Question question = questionService.getQuestionById(questionId);
		//获取用户答题答案
		QuestionAnswerOfUser answerOfUser = questionService.getQuestionAnswer(questionId, question.getType(), userType, userId);
		
		//处理填空题选项问题 <input type='text' class='form-control' autocomplete='off' required='required'>
		if(question.getType() == 4) {
			String questionContent = question.getQuestionContent();
			int answerCount = Integer.parseInt(question.getAnswer());
			for(int i = 1; i <= answerCount; i++) {
				String olds = "____" + i + "____";
				String news = "<input type='text' class='form-control' name='"+i+"' autocomplete='off' required='required'>";
				questionContent = questionContent.replace(olds, news);
			}
			question.setQuestionContent(questionContent);
		}
		
		request.setAttribute("question", question);
		request.setAttribute("answerOfUser", answerOfUser);
		
		//更具题型跳转到不同页面 type：1单选，2多选，3判断，4填空，5主观
		int type = question.getType();
		switch (type) {
		case 1:
			request.getRequestDispatcher("/questionChoose.jsp").forward(request, response);
			break;
		case 2:
			request.getRequestDispatcher("/questionMultiChoose.jsp").forward(request, response);
			break;
		case 3:
			request.getRequestDispatcher("/questionJudge.jsp").forward(request, response);
			break;
		case 4:
			request.getRequestDispatcher("/questionGapFilling.jsp").forward(request, response);
			break;
		case 5:
			request.getRequestDispatcher("/questionSubjective.jsp").forward(request, response);
			break;
		}
		
	}

	/**
	 * 
	 * @Description 获得上一题
	 * @date 2019年1月12日 下午6:17:29
	 */
	public void previousQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得questionId
		String currentQuestionId = request.getParameter("currentQuestionId");
		//获得用户Id
		HttpSession session = request.getSession();
		User user = null;
		if(session != null) {
			user = (User) session.getAttribute("user");
		}
		//用户类型0学生，1老师
		int userType = 0;
		int userId = 0;
		if(user != null) {
			if(user.getStudent() != null) {
				userId = user.getStudent().getStudentId();
			} else {
				userId = user.getTeacher().getTeacherId();
				userType = 1;
			}
		}
		
		QuestionService questionService = new QuestionService();
		//或缺上一个问题
		Question question = questionService.previousQuestion(currentQuestionId);
		//获取用户答题答案
		QuestionAnswerOfUser answerOfUser = questionService.getQuestionAnswer(question.getQuestionId()+"", question.getType(), userType, userId);
		
		//处理填空题选项问题 <input type='text' class='form-control' autocomplete='off' required='required'>
		if(question.getType() == 4) {
			String questionContent = question.getQuestionContent();
			int answerCount = Integer.parseInt(question.getAnswer());
			for(int i = 1; i <= answerCount; i++) {
				String olds = "____" + i + "____";
				String news = "<input type='text' class='form-control' name='"+i+"' autocomplete='off' required='required'>";
				questionContent = questionContent.replace(olds, news);
			}
			question.setQuestionContent(questionContent);
		}
		
		request.setAttribute("question", question);
		request.setAttribute("answerOfUser", answerOfUser);
		
		//更具题型跳转到不同页面 type：1单选，2多选，3判断，4填空，5主观
		int type = question.getType();
		switch (type) {
		case 1:
			request.getRequestDispatcher("/questionChoose.jsp").forward(request, response);
			break;
		case 2:
			request.getRequestDispatcher("/questionMultiChoose.jsp").forward(request, response);
			break;
		case 3:
			request.getRequestDispatcher("/questionJudge.jsp").forward(request, response);
			break;
		case 4:
			request.getRequestDispatcher("/questionGapFilling.jsp").forward(request, response);
			break;
		case 5:
			request.getRequestDispatcher("/questionSubjective.jsp").forward(request, response);
			break;
		default:
			String contextPath = request.getContextPath();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('没有上一题了！');location.href='"+contextPath+"/student/question?method=getQuestions'</script>");
			break;
		}
		
	}
	
	/**
	 * 
	 * @Description 获得下一题
	 * @date 2019年1月12日 下午6:33:44
	 */
	public void nextQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获得questionId
		String currentQuestionId = request.getParameter("currentQuestionId");
		//获得用户Id
		HttpSession session = request.getSession();
		User user = null;
		if(session != null) {
			user = (User) session.getAttribute("user");
		}
		//用户类型0学生，1老师
		int userType = 0;
		int userId = 0;
		if(user != null) {
			if(user.getStudent() != null) {
				userId = user.getStudent().getStudentId();
			} else {
				userId = user.getTeacher().getTeacherId();
				userType = 1;
			}
		}
		
		QuestionService questionService = new QuestionService();
		//获得上一个问题
		Question question = questionService.nextQuestion(currentQuestionId);
		//获取用户答题答案
		QuestionAnswerOfUser answerOfUser = questionService.getQuestionAnswer(question.getQuestionId()+"", question.getType(), userType, userId);
		
		//处理填空题选项问题 <input type='text' class='form-control' autocomplete='off' required='required'>
		if(question.getType() == 4) {
			String questionContent = question.getQuestionContent();
			int answerCount = Integer.parseInt(question.getAnswer());
			for(int i = 1; i <= answerCount; i++) {
				String olds = "____" + i + "____";
				String news = "<input type='text' class='form-control' name='"+i+"' autocomplete='off' required='required'>";
				questionContent = questionContent.replace(olds, news);
			}
			question.setQuestionContent(questionContent);
		}
		
		request.setAttribute("question", question);
		request.setAttribute("answerOfUser", answerOfUser);
		
		//更具题型跳转到不同页面 type：1单选，2多选，3判断，4填空，5主观
		int type = question.getType();
		switch (type) {
		case 1:
			request.getRequestDispatcher("/questionChoose.jsp").forward(request, response);
			break;
		case 2:
			request.getRequestDispatcher("/questionMultiChoose.jsp").forward(request, response);
			break;
		case 3:
			request.getRequestDispatcher("/questionJudge.jsp").forward(request, response);
			break;
		case 4:
			request.getRequestDispatcher("/questionGapFilling.jsp").forward(request, response);
			break;
		case 5:
			request.getRequestDispatcher("/questionSubjective.jsp").forward(request, response);
			break;
		default:
			String contextPath = request.getContextPath();
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('没有下一题了！');location.href='"+contextPath+"/student/question?method=getQuestions'</script>");
			break;
		}
		
	}
	
	public void checkAnswerChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public void checkAnswerMultiChoose(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public void checkAnswerJudge(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public void checkAnswerGapFilling(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	public void checkAnswerSubjective(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
