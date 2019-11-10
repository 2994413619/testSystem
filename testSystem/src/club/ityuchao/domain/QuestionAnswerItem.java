package club.ityuchao.domain;
/**
 * 
 * @author 喻超
 * @date 2019年1月12日
 * @Description 用户的填空题答案
 *
 */
public class QuestionAnswerItem {

	/*
	 * answerItemId——int
	userQuestionId——int
	itemIndex——int（选项下标）
	itemContent——text（填空选项内容）
	 */
	private int answerItemId;
	private int userQuestionId;
	private int itemIndex;
	private String itemContent;
	private int isRight;
	public int getIsRight() {
		return isRight;
	}
	public void setIsRight(int isRight) {
		this.isRight = isRight;
	}
	public int getAnswerItemId() {
		return answerItemId;
	}
	public void setAnswerItemId(int answerItemId) {
		this.answerItemId = answerItemId;
	}
	public int getUserQuestionId() {
		return userQuestionId;
	}
	public void setUserQuestionId(int userQuestionId) {
		this.userQuestionId = userQuestionId;
	}
	public int getItemIndex() {
		return itemIndex;
	}
	public void setItemIndex(int itemIndex) {
		this.itemIndex = itemIndex;
	}
	public String getItemContent() {
		return itemContent;
	}
	public void setItemContent(String itemContent) {
		this.itemContent = itemContent;
	}
	
}
