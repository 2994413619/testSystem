package club.ityuchao.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceUtil {

	private static DataSource dataSource = new ComboPooledDataSource();
	
	//�ֲ߳̾�����
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	
	//ֱ�ӵõ�����
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	//�õ����ݿ����ӳ�
	public static DataSource getDataSource() {
		return dataSource;
	}
	
	//����̱߳����е�connection
	public static Connection getCurrentConnetcion() throws SQLException {
		Connection conn = tl.get();
		//��һ�λ�ȡΪ�գ�����
		if(conn == null) {
			conn = getConnection();
			tl.set(conn);
		}
		return conn;
	}
	
	//��������
	public static void startTransaction() throws SQLException {
		Connection conn = getCurrentConnetcion();
		if(conn != null)
			conn.setAutoCommit(false);
	}
	
	//�ع�����
	public static void rollback() throws SQLException {
		Connection conn = getCurrentConnetcion();
		if(conn != null)
			conn.rollback();
	}
	
	//�ύ���񡢹ر���Դ���Ƴ��ֲ߳̾������е�connection
	public static void commit() throws SQLException {
		Connection conn = getCurrentConnetcion();
		if(conn!=null) {
			conn.commit();
			tl.remove();
			conn.close();
		}
		
	}
}
