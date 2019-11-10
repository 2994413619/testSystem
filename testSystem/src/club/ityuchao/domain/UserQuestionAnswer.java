package club.ityuchao.domain;

import java.util.Date;

public class UserQuestionAnswer {

	/*
	 * userQuestionId����int
	userId����int
	userType��0ѧ�� 1��ʦ������tinyint
	questionId����int
	userAnswer��ѧ���𰸣����� text
	grade���÷֣�����double
	isRight���Ƿ���ȷ��0����1��ȷ������tinyint
	answerTime������ʱ�䣩����timestamp
	 */
	
	private int userQuestionId;
	private int userId;
	private int userType;
	private int questionId;
	private String userAnswer;
	private double grade;
	private int isRight;
	private Date answerTime;
	private QuestionAnswerItem[] answerItems ;
	public int getUserQuestionId() {
		return userQuestionId;
	}
	public void setUserQuestionId(int userQuestionId) {
		this.userQuestionId = userQuestionId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public String getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public int getIsRight() {
		return isRight;
	}
	public void setIsRight(int isRight) {
		this.isRight = isRight;
	}
	public Date getAnswerTime() {
		return answerTime;
	}
	public void setAnswerTime(Date answerTime) {
		this.answerTime = answerTime;
	}
	public QuestionAnswerItem[] getAnswerItems() {
		return answerItems;
	}
	public void setAnswerItems(QuestionAnswerItem[] answerItems) {
		this.answerItems = answerItems;
	}
	
}
