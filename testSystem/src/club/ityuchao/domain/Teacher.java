package club.ityuchao.domain;

import java.util.Date;

/**
 * 
 * @author 喻超
 * @date 2018年11月30日
 * @Description 老师对象
 *
 */
public class Teacher {

	/**
	 * teacherId——int
		userType（userType.usserTypeId）——tinyint
		userName（用户名、登录名）——varChar(50)
		password（密码）——varchar(50)
		realName（真实姓名）——varchar(50)
		email（邮箱）——varchar(50)
		birthday（生日）——date
		telephone（电话）——varchar(20)
		gender（性别）——tinyint（1男 0女）
		signature（个性签名）—— text
		headImage（头像）——varchar(1000)
		status（用户是否激活，0表示未激活，1表示激活）——tinyint
		code（激活状态码）——varchar(50)
		rootPermit（root同意 0未通过 1通过）——tinyint
		registerTime（注册日期）——datetime
		isLock（是否锁定 0未锁定 1锁定）——tinyint
	 */
	private int teacherId;
	private int userType;
	private String userName;
	private String password;
	private String realName;
	private String email;
	private Date birthday;
	private String telephone;
	private int gender;
	private String signature;
	private String headImage;
	private int status;
	private String code;
	private int rootPermit;
	private Date registerTime;
	private int isLock;
	public int getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(int teacherId) {
		this.teacherId = teacherId;
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
	public int getRootPermit() {
		return rootPermit;
	}
	public void setRootPermit(int rootPermit) {
		this.rootPermit = rootPermit;
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
