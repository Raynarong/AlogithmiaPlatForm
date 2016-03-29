package alg.base.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import net.sf.json.JSONObject;

import alg.base.bean.usersbean;
import alg.base.db.ConnectionPool;
import alg.base.db.DB;
import alg.base.util.DatabaseTool;
import alg.base.util.FlushTool;

public class UserService {

	public HashMap<Integer ,String > getAllUsers() throws Exception{
		HashMap  <Integer,String>hm = new HashMap<Integer,String>();

		String sql = "select * from users";
		String p[] = {};
		ResultSet rs = DatabaseTool.query(sql, p);
		while(rs.next()){
			String uname = rs.getString("user_name");
			int  uid = rs.getInt("user_id"); 
			hm.put(uid, uname);
		}
		return hm;
		
	}
	
	public usersbean findUserbyEmail(String user_mail) throws Exception{
		String sql="select * from users where user_mail=?";
		String p[]={user_mail};
		ResultSet rs = DatabaseTool.query(sql, p); 
		usersbean us=new usersbean();
		if(rs!=null)
			while(rs.next()){
		     	us.setUser_id(rs.getInt("user_id"));
				us.setUser_name(rs.getString("user_name"));
				us.setUser_mail(rs.getString("user_mail"));
				us.setUser_pwd(rs.getString("User_pwd"));
				us.setUser_sex(rs.getString("User_sex"));
				us.setUser_credit(rs.getInt("user_credit"));
				
				/*JSONObject jobj = new JSONObject();
				jobj.put("uname",us );
				String jstr = jobj.toString();
				FlushTool.flushJsonRecord(jstr);*/
				continue;
			}
				return us;
	}
	
	public usersbean findUserbyName(String user_name) throws Exception{
		String sql="select * from users where user_name=?";
		String p[]={user_name};
		ResultSet rs = DatabaseTool.query(sql, p); 
		usersbean us=new usersbean();
		if(rs!=null)
			while(rs.next()){
		     	us.setUser_id(rs.getInt("user_id"));
				us.setUser_name(rs.getString("user_name"));
				us.setUser_mail(rs.getString("user_mail"));
				us.setUser_pwd(rs.getString("User_pwd"));
				us.setUser_sex(rs.getString("User_sex"));
				us.setUser_credit(rs.getInt("User_credit"));
				us.setOutDate(rs.getTimestamp("OutDate"));
				us.setValidataCode(rs.getString("ValidataCode"));
			}
				return us;
	}
}
