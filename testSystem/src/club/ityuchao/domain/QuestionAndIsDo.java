package club.ityuchao.domain;

import java.util.List;

/**
 * 
 * @author ����
 * @date 2018��12��25��
 * @Description ������ҳ�棺�������⼯�Ϻͱ�ʾ�Ƿ������飨2��ʾ����1��ʾ��ȷ��0��ʾδ����
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
