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
	 * @Description 主页内容显示
	 * @date 2018年12月8日 下午5:33:45
	 */
	public void index(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{
		//1、index数据
		QuestionService questionService = new QuestionService();
		List<Question> accuracyList = questionService.getAccuracyList();
		List<Question> addDateList = questionService.getaddDateList();
		
		//2、存入request域中
		request.setAttribute("accuracyList", accuracyList);
		request.setAttribute("addDateList", addDateList);
		
		//3、跳转到inedex.jsp中
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
	
}
