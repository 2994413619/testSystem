package club.ityuchao.domain;
/**
 * 
 * @author 喻超
 * @date 2018年12月1日
 * @Description root用户对象
 *
 */
public class RootUser {
	/**
	 * rootUserId——int
		rootUserName（root用户名、登录名）——varChar(50)
		password（密码）——varChar(50)
		status（0表示root用户，1表示临时管理员）——tinyint
	 */
	private int rootUserId;
	private String rootUserName;
	private String password;
	private int status;
	public int getRootUserId() {
		return rootUserId;
	}
	public void setRootUserId(int rootUserId) {
		this.rootUserId = rootUserId;
	}
	public String getRootUserName() {
		return rootUserName;
	}
	public void setRootUserName(String rootUserName) {
		this.rootUserName = rootUserName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
