package club.ityuchao.domain;

import java.util.Date;

/**
 * 
 * @author ����
 * @date 2018��12��7��
 * @Description ��Ŀ����
 *
 */
public class Question {

	/*questionId����int
	type����Ŀ���͡���1��ѡ��2��ѡ��3�жϡ�4��ա�5���ۻش𣩡���int
	questionCategoryID����int
	questionContent����ɣ����� text
	answerPeople����������������int
	answer���𰸣����� text
	questionExplain����Ŀ���������� text
	addDate��д��ϵͳ��ʱ�䣩����timestamp
	isPublic���Ƿ񹫲���Ŀ������tinyint��0������1��������
	score����ֵ������double
	averageScore��ƽ���֣�����double
	accuracy����ȷ�ʣ�����double
	level����Ŀ�Ѷȣ�����int 
	teacherID�������ˣ�����int*/
	
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
