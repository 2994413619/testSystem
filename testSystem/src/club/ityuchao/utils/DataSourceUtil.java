package club.ityuchao.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DataSourceUtil {

	private static DataSource dataSource = new ComboPooledDataSource();
	
	//线程局部变量
	private static ThreadLocal<Connection> tl = new ThreadLocal<Connection>();
	
	//直接得到连接
	public static Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}
	
	//得到数据库连接池
	public static DataSource getDataSource() {
		return dataSource;
	}
	
	//获得线程变量中的connection
	public static Connection getCurrentConnetcion() throws SQLException {
		Connection conn = tl.get();
		//第一次获取为空，创建
		if(conn == null) {
			conn = getConnection();
			tl.set(conn);
		}
		return conn;
	}
	
	//开启事务
	public static void startTransaction() throws SQLException {
		Connection conn = getCurrentConnetcion();
		if(conn != null)
			conn.setAutoCommit(false);
	}
	
	//回滚事务
	public static void rollback() throws SQLException {
		Connection conn = getCurrentConnetcion();
		if(conn != null)
			conn.rollback();
	}
	
	//提交事务、关闭资源、移出线程局部变量中的connection
	public static void commit() throws SQLException {
		Connection conn = getCurrentConnetcion();
		if(conn!=null) {
			conn.commit();
			tl.remove();
			conn.close();
		}
		
	}
}
