package club.ityuchao.utils;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;

/**
 * 
 * @author 喻超
 * @date 2018年12月7日
 * @Description 获得questionId
 *
 */
public class GetQuestionId {

	public static synchronized int getId() {
		QueryRunner runner = new QueryRunner(DataSourceUtil.getDataSource());
		String sql = "select max(questionId) from question";
		int id = 0;
		try {
			id = (int) runner.query(sql, new ScalarHandler());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(id == 0) {
			id = 1000000;
		} else {
			id +=1 ;
		}
		return id;
	}
}
