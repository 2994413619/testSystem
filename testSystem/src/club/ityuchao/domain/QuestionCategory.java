package club.ityuchao.domain;


/**
 * 
 * @author ����
 * @date 2018��12��7��
 * @Description ��Ŀ����
 *
 */
public class QuestionCategory {

	/*questionCategoryID����int
	questionCategoryName����varChar(50)*/
	
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
