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
 * @author ����
 * @date 2018��12��24��
 * @Description ����Ȩ�ޣ���ʦѧ��  ���ܣ������Ŀ��ʾ�ķ�
 *
 */
@WebServlet("/student/question")
public class QuestionAccessServlet extends BaseServlet {

	/**
	 * 
	 * @Description �����ϰҳ��ʾ�����б�
	 * @date 2018��12��24�� ����10:30:05
	 */
	public void getQuestions(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.���ݷ�װ
		//1.1��õ�ǰҳ����Ĭ�ϵ�һҳ
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//1.2�Ƿ�������Ĭ�ϲ���
		String isDo = "2";
		if(request.getParameter("isDo") != null) {
			isDo = request.getParameter("isDo");
		}
		
		//1.3���ҳ���С
		int pageSize = 10;
		if(request.getParameter("pageSize") != null) {
			pageSize = Integer.parseInt(request.getParameter("pageSize"));
		}
		
		//����û����ͺ��û�Id
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
		
		//2���pageBean��ҳ����
		QuestionService questionService = new QuestionService();
		PageBean pageBean = questionService.getQuestionAccessPageBean(currentPage,pageSize,isDo,userId,userType);
		
		//���questionList�ͱ�ʾ�Ƿ��������飨2��ʾ����1��ʾ��ȷ��0��ʾδ����
		QuestionAndIsDo questionAndIsDo = questionService.getQuestionAndIsDo(pageBean,isDo,userId,userType);
		
		//3.��ת����ʾҳ��
		request.setAttribute("questionAndIsDo", questionAndIsDo);
		request.setAttribute("isDo", isDo);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageBean", pageBean);
		request.getRequestDispatcher("/questionBank.jsp").forward(request, response);
		
	}
	
	/**
	 * 
	 * @Description �����б����������飬��ת������ҳ��
	 * @date 2019��1��11�� ����4:12:29
	 */
	public void getQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���questionId
		String questionId = request.getParameter("questionId");
		//����û�Id
		HttpSession session = request.getSession();
		User user = null;
		if(session != null) {
			user = (User) session.getAttribute("user");
		}
		//�û�����0ѧ����1��ʦ
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
		//��ȱquestion
		Question question = questionService.getQuestionById(questionId);
		//��ȡ�û������
		QuestionAnswerOfUser answerOfUser = questionService.getQuestionAnswer(questionId, question.getType(), userType, userId);
		
		//���������ѡ������ <input type='text' class='form-control' autocomplete='off' required='required'>
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
		
		//����������ת����ͬҳ�� type��1��ѡ��2��ѡ��3�жϣ�4��գ�5����
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
	 * @Description �����һ��
	 * @date 2019��1��12�� ����6:17:29
	 */
	public void previousQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���questionId
		String currentQuestionId = request.getParameter("currentQuestionId");
		//����û�Id
		HttpSession session = request.getSession();
		User user = null;
		if(session != null) {
			user = (User) session.getAttribute("user");
		}
		//�û�����0ѧ����1��ʦ
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
		//��ȱ��һ������
		Question question = questionService.previousQuestion(currentQuestionId);
		//��ȡ�û������
		QuestionAnswerOfUser answerOfUser = questionService.getQuestionAnswer(question.getQuestionId()+"", question.getType(), userType, userId);
		
		//���������ѡ������ <input type='text' class='form-control' autocomplete='off' required='required'>
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
		
		//����������ת����ͬҳ�� type��1��ѡ��2��ѡ��3�жϣ�4��գ�5����
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
			response.getWriter().write("<script>alert('û����һ���ˣ�');location.href='"+contextPath+"/student/question?method=getQuestions'</script>");
			break;
		}
		
	}
	
	/**
	 * 
	 * @Description �����һ��
	 * @date 2019��1��12�� ����6:33:44
	 */
	public void nextQuestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//���questionId
		String currentQuestionId = request.getParameter("currentQuestionId");
		//����û�Id
		HttpSession session = request.getSession();
		User user = null;
		if(session != null) {
			user = (User) session.getAttribute("user");
		}
		//�û�����0ѧ����1��ʦ
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
		//�����һ������
		Question question = questionService.nextQuestion(currentQuestionId);
		//��ȡ�û������
		QuestionAnswerOfUser answerOfUser = questionService.getQuestionAnswer(question.getQuestionId()+"", question.getType(), userType, userId);
		
		//���������ѡ������ <input type='text' class='form-control' autocomplete='off' required='required'>
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
		
		//����������ת����ͬҳ�� type��1��ѡ��2��ѡ��3�жϣ�4��գ�5����
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
			response.getWriter().write("<script>alert('û����һ���ˣ�');location.href='"+contextPath+"/student/question?method=getQuestions'</script>");
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
