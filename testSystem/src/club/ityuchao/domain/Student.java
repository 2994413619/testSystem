package club.ityuchao.domain;

import java.util.Date;

/**
 * 
 * @author ����
 * @date 2018��12��1��
 * @Description ѧ������
 *
 */
public class Student {
	/**
	 * studentId����int
		userType��userType.usserTypeId������tinyint
		userName���û�������¼��������varChar(50)
		password�����룩����varchar(50)
		realName����ʵ����������varchar(100)
		email�����䣩����varchar(50)
		birthday�����գ�����date
		telephone���绰������varchar(20)
		myTeacherId��tecaher.teacherIdָ����ʦ������int
		gender���Ա𣩡���tinyint��1�� 0Ů��
		signature������ǩ�������� text
		headImage��ͷ�񣩡���varchar(1000)
		status���û��Ƿ񼤻0δ���1�������tinyint
		code������״̬�룩����varchar(50)
		registerTime��ע�����ڣ�����datetime
		isLock���Ƿ����� 0δ���� 1����������tinyint
	 */
	private int studentId;
	private int userType;
	private String userName;
	private String password;
	private String realName;
	private String email;
	private Date birthday;
	private String telephone;
	private int myTeacherId;
	private int gender;
	private String signature;
	private String headImage;
	private int status;
	private String code;
	private Date registerTime;
	private int isLock;
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public int getMyTeacherId() {
		return myTeacherId;
	}
	public void setMyTeacherId(int myTeacherId) {
		this.myTeacherId = myTeacherId;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getHeadImage() {
		return headImage;
	}
	public void setHeadImage(String headImage) {
		this.headImage = headImage;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}
	public int getIsLock() {
		return isLock;
	}
	public void setIsLock(int isLock) {
		this.isLock = isLock;
	}
}
