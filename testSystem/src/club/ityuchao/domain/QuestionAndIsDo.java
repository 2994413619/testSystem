package club.ityuchao.domain;

import java.util.List;

/**
 * 
 * @author 喻超
 * @date 2018年12月25日
 * @Description 题库答题页面：包含问题集合和表示是否做数组（2表示错误；1表示正确；0表示未做）
 *
 */
public class QuestionAndIsDo {

	private List<Question> questionList;
	private int[] isDo;
	public List<Question> getQuestionList() {
		return questionList;
	}
	public void setQuestionList(List<Question> questionList) {
		this.questionList = questionList;
	}
	public int[] getIsDo() {
		return isDo;
	}
	public void setIsDo(int[] isDo) {
		this.isDo = isDo;
	}
	
}
