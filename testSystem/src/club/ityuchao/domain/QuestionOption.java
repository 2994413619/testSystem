package club.ityuchao.domain;

/**
 * 
 * @author ����
 * @date 2018��12��7��
 * @Description ��ѡ����ѡѡ���մ�
 *
 */
public class QuestionOption {

	/*questionOptionId����int
	questionId����ĿID������int
	optionIndex��ѡ��űꡪ��A��B��C��123������varchar(10)
	optionContent��ѡ�����ݣ�����text*/
	
	private int questionOptionId;
	private int questionId;
	private String optionIndex;
	private String optionContent;
	public int getQuestionOptionId() {
		return questionOptionId;
	}
	public void setQuestionOptionId(int questionOptionId) {
		this.questionOptionId = questionOptionId;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getOptionIndex() {
		return optionIndex;
	}
	public void setOptionIndex(String optionIndex) {
		this.optionIndex = optionIndex;
	}
	public String getOptionContent() {
		return optionContent;
	}
	public void setOptionContent(String optionContent) {
		this.optionContent = optionContent;
	}
	
}
