package club.ityuchao.domain;
/**
 * 
 * @author ����
 * @date 2018��12��1��
 * @Description root�û�����
 *
 */
public class RootUser {
	/**
	 * rootUserId����int
		rootUserName��root�û�������¼��������varChar(50)
		password�����룩����varChar(50)
		status��0��ʾroot�û���1��ʾ��ʱ����Ա������tinyint
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
