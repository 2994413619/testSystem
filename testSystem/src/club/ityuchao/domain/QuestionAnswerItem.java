package club.ityuchao.domain;
/**
 * 
 * @author ����
 * @date 2019��1��12��
 * @Description �û���������
 *
 */
public class QuestionAnswerItem {

	/*
	 * answerItemId����int
	userQuestionId����int
	itemIndex����int��ѡ���±꣩
	itemContent����text�����ѡ�����ݣ�
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
