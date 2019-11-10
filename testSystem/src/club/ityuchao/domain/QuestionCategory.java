package club.ityuchao.domain;


/**
 * 
 * @author 喻超
 * @date 2018年12月7日
 * @Description 题目分类
 *
 */
public class QuestionCategory {

	/*questionCategoryID——int
	questionCategoryName——varChar(50)*/
	
	private int questionCategoryID;
	private String questionCategoryName;
	public int getQuestionCategoryID() {
		return questionCategoryID;
	}
	public void setQuestionCategoryID(int questionCategoryID) {
		this.questionCategoryID = questionCategoryID;
	}
	public String getQuestionCategoryName() {
		return questionCategoryName;
	}
	public void setQuestionCategoryName(String questionCategoryName) {
		this.questionCategoryName = questionCategoryName;
	}
	
}
