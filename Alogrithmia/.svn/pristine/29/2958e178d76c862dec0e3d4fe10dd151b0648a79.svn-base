package alg.base.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import alg.base.db.ConnectionPool;

public class DatabaseTool {
	
	static ConnectionPool connpool = null;
	static Connection conn = null;

	
	public static void init() throws Exception{
		connpool = new ConnectionPool();
		conn = connpool.getConnection();
	}
	public static ResultSet query(String sql, String[] parameters) throws Exception {
		if(conn==null){
			init();
		}
		ResultSet rs = null;
		
		PreparedStatement ps = ConnectionPool.prepare(conn,sql);
		setParameters(ps, parameters);
		try {
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int update(String sql, String[] parameters) throws Exception {
		if(conn==null){
			init();
		}
	
		int rs = 0;
		PreparedStatement ps = connpool.prepare(conn,sql);
		setParameters(ps, parameters);
		try {
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	public static PreparedStatement _insert(String sql) throws Exception{
		if(conn==null){
			init();
		}
		
		PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		return ps;
	}
	
	public static void setParameters(PreparedStatement ps,  String[] parameters) {
		
		if ((parameters != null) && (parameters.length != 0)) {
			for (int i = 0; i < parameters.length; i++) {
				try {
					ps.setString(i + 1, parameters[i]);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}		
	}
	
	
	public static void main(String[] args) throws Exception {
		String sql = "select * from users where user_sex = ?";
		String p[] = {"女"};
		ResultSet rs = DatabaseTool.query(sql, p);
		try {
			if (rs != null) {
				while (rs.next()) {
					System.out.println(rs.getString("user_name"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
