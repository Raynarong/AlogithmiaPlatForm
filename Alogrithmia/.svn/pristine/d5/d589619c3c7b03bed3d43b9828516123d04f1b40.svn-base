package alg.base.action;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import alg.base.bean.usersbean;
import alg.base.util.DatabaseTool;
import alg.base.util.FlushTool;
public class RegisterAction {
	private static final long serialVersionUID = 1L;
	private int user_id;
	private String user_name;
	private String user_mail;
	private String user_pwd;
	private String user_sex;
	private String repassword;
	
	public String getRepassword() {
		return repassword;
	}
	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_mail() {
		return user_mail;
	}
	public void setUser_mail(String user_mail) {
		this.user_mail = user_mail;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		
		System.out.println("set user_sex=====:"+user_sex);
		this.user_sex = user_sex;
	}
	 HttpServletRequest request = ServletActionContext.getRequest();
	
	 HttpSession session = request.getSession();
	
	public String execute() throws Exception{
		usersbean user=new usersbean();
		user.setUser_name(user_name);
		user.setUser_pwd(user_pwd);
		user.setUser_mail(user_mail);
		user.setUser_sex(user_sex);
		System.out.println("userpassword="+user_pwd);
		String sql="insert into users(user_name,user_pwd,user_mail,user_sex)values(?,?,?,?)";
		String p[]={user_name,user_pwd,user_mail,user_sex};
		int a=DatabaseTool.update(sql, p);
		if(a!=0)
			return "success";
		else
			return "false";
		
		
	}
	
	public void changeInfor() throws Exception{
		
		String sql="update users set user_name=?,user_mail=? where user_id=?";
		String userId=Integer.toString((Integer)session.getAttribute("id"));
		String p[]={user_name,user_mail,userId};
		int a=DatabaseTool.update(sql, p);	
		if(a!=0){
		session.setAttribute("user",user_name );
		session.setAttribute("mail", user_mail);
		usersbean us=(usersbean)session.getAttribute("userInfor");
		us.setUser_name(user_name);
		us.setUser_mail(user_mail);
		session.setAttribute("userInfor", us);
		}
	}
	
	
	public void judgeRename() throws Exception{
		String sql="select * from users where user_name= ?";
		String p[]={user_name};
		System.out.println(user_name);
		ResultSet rs = DatabaseTool.query(sql, p); 
		if(rs!=null){
			while(rs.next()){
				String uname = rs.getString("user_name"); 
				JSONObject jobj = new JSONObject();
				jobj.put("uname",uname );
				String jstr = jobj.toString();
				FlushTool.flushJsonRecord(jstr);
			}
			
		}
	}
	
	public void Changpwd() throws Exception{
		String sql="update users set user_pwd=? where user_id=?";
		String userId=Integer.toString((Integer)session.getAttribute("id"));
    	String p[]={user_pwd,userId};	
		System.out.println(userId);
		int a=DatabaseTool.update(sql, p);
	}
	
	public void Resetpwd()throws Exception{
		String sql="update users set user_pwd=? where user_id=?";
    	String p[]={user_pwd,user_id+""};	
		System.out.println(user_id);
		int a=DatabaseTool.update(sql, p);
	}
	
	public void judgeMail() throws Exception{
		String sql="select * from users where user_mail=?";
		String p[]={user_mail};
		ResultSet rs = DatabaseTool.query(sql, p); 
		if(rs!=null)
			while(rs.next()){
				String uname = rs.getString("user_name"); 
				JSONObject jobj = new JSONObject();
				jobj.put("uname",uname );
				String jstr = jobj.toString();
				FlushTool.flushJsonRecord(jstr);
			}
				
	}

	}
	
	

