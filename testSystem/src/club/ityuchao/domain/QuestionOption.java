package club.ityuchao.domain;

/**
 * 
 * @author 喻超
 * @date 2018年12月7日
 * @Description 单选、多选选项，填空答案
 *
 */
public class QuestionOption {

	/*questionOptionId——int
	questionId（题目ID）——int
	optionIndex（选项脚标——A、B、C、123）——varchar(10)
	optionContent（选项内容）——text*/
	
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
