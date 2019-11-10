package club.ityuchao.domain;

import java.util.Date;

/**
 * 
 * @author 喻超
 * @date 2018年12月7日
 * @Description 题目对象
 *
 */
public class Question {

	/*questionId——int
	type（题目类型——1单选、2多选、3判断、4填空、5主观回答）——int
	questionCategoryID——int
	questionContent（题干）—— text
	answerPeople（答题人数）——int
	answer（答案）—— text
	questionExplain（题目解析）—— text
	addDate（写入系统的时间）——timestamp
	isPublic（是否公布题目）——tinyint（0公布，1不公布）
	score（分值）——double
	averageScore（平均分）——double
	accuracy（正确率）——double
	level（题目难度）——int 
	teacherID（发布人）——int*/
	
	private int questionId;
	private int type;
	private QuestionCategory category;
	private String questionContent;
	private int answerPeople;
	private String answer;
	private String questionExplain;
	private Date addDate;
	private int isPublic;
	private double score;
	private double averageScore;
	private double accuracy;
	private int level;
	private Teacher teacher;
	private QuestionOption[] questionOptions;
	
	public Question() {
		super();
		this.category = new QuestionCategory();
		this.teacher = new Teacher();
		this.questionOptions = new QuestionOption[26];
	}
	public int getQuestionId() {
		return questionId;
	}
	public void setQuestionId(int questionId) {
		this.questionId = questionId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public QuestionCategory getCategory() {
		return category;
	}
	public void setCategory(QuestionCategory category) {
		this.category = category;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public int getAnswerPeople() {
		return answerPeople;
	}
	public void setAnswerPeople(int answerPeople) {
		this.answerPeople = answerPeople;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQuestionExplain() {
		return questionExplain;
	}
	public void setQuestionExplain(String questionExplain) {
		this.questionExplain = questionExplain;
	}
	public Date getAddDate() {
		return addDate;
	}
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}
	public int getIsPublic() {
		return isPublic;
	}
	public void setIsPublic(int isPublic) {
		this.isPublic = isPublic;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public double getAverageScore() {
		return averageScore;
	}
	public void setAverageScore(double averageScore) {
		this.averageScore = averageScore;
	}
	public double getAccuracy() {
		return accuracy;
	}
	public void setAccuracy(double accuracy) {
		this.accuracy = accuracy;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public QuestionOption[] getQuestionOptions() {
		return questionOptions;
	}
	public void setQuestionOptions(QuestionOption[] questionOptions) {
		this.questionOptions = questionOptions;
	}
	
}
