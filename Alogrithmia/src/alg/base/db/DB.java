package alg.base.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DB {
	

	public static DB getInstance() {
		return db == null ? (db = new DB()) : db;
	}
	
	public static Connection creatConnetcion() {
		return getInstance().conn;
	}

//	public static  Connection creatConnetcion(){
//	
//		Connection conn =null;
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/xy_ptdb","root","vlab214");
//			conn = DriverManager.getConnection("jdbc:mysql://202.197.61.225:8891/xy_ptdb","root","vlab214");
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return conn;
//	}
	
	
	
	public static PreparedStatement prepare(Connection conn,String sql){
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}
	
	
	private static DB db = null;

	private DB() {
		initMe(dburl);
	}

	private void initMe(String dburl) {
		try {
			Class.forName(dbDriverName);
			conn = DriverManager.getConnection(dburl, dbuser, dbpass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public static  void close(Connection conn){
//		try {
//			conn.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
	}
	
	public static  void close(PreparedStatement ps){
/*		try {
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}*/
	}
	private Connection conn = null;
	
	private static String dbDriverName = "com.mysql.jdbc.Driver";
//	private static String dburl = "jdbc:mysql://192.168.0.243:3306/algorithmia";
	private static String dburl = "jdbc:mysql://192.168.0.243:3306/algorithmia?seUnicode=true&characterEncoding=UTF-8";
	private static String dbuser = "root";
	private static String dbpass = "123456";
//	private static String dbpass = "mysql";


	
	public static void main(String args[]) throws SQLException{
		String sql = "select * from algorithm_table";
		Connection conn = DB.creatConnetcion();
		PreparedStatement ps = DB.prepare(conn, sql);
		ResultSet rs = ps.executeQuery();
//		ResultSet rs1 = ps.executeUpdate();
		while(rs.next()){
			System.out.println(rs.getString("algorithm_name"));
		}
	}
}
