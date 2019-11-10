package club.ityuchao.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import club.ityuchao.domain.Question;
import club.ityuchao.service.QuestionService;

@WebServlet("/Index")
public class IndexServlet extends BaseServlet{

	/**
	 * 
	 * @Description ��ҳ������ʾ
	 * @date 2018��12��8�� ����5:33:45
	 */
	public void index(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1��index����
		QuestionService questionService = new QuestionService();
		List<Question> accuracyList = questionService.getAccuracyList();
		List<Question> addDateList = questionService.getaddDateList();
		
		//2������request����
		request.setAttribute("accuracyList", accuracyList);
		request.setAttribute("addDateList", addDateList);
		
		//3����ת��inedex.jsp��
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
}
