package alg.base.action;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.web.file.CallService;

import alg.base.util.ConfigurationConstant;
import alg.base.util.DatabaseTool;

public class ViewSourceAction {
	
	private int algorithm_id;
	
	private String str;
	
	private String user_name;
	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public int getAlgorithm_id() {
		return algorithm_id;
	}

	public void setAlgorithm_id(int algorithm_id) {
		this.algorithm_id = algorithm_id;
	}

	public void viewSource() throws Exception
	{
		String sql = "select * from algorithm_table where algorithm_id=?";
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		algorithm_id = (Integer) session.getAttribute("algorithm_id");
		String parameters[] = {String.valueOf(algorithm_id)};
		
		ResultSet rs = DatabaseTool.query(sql, parameters);
		
		String algorithm_name = null;
		int user_id = 0;
		
		String param = "file1/add.java";
		String url = ConfigurationConstant.ALOGSERVER_URL + "/ReturnSource";
		
		if(rs != null)
		{
			while(rs.next())
			{
				algorithm_name = rs.getString("algorithm_name");
				user_id = rs.getInt("user_id");
			}
		}
		
		sql = "select * from users where user_id=?";
		
		parameters[0] = String.valueOf(user_id);
		
		rs = DatabaseTool.query(sql, parameters);
		
		if(rs != null)
		{
			while(rs.next())
			{
				user_name = rs.getString("user_name");
			}
		}

		session.setAttribute("algorithm_id", algorithm_id);
		session.setAttribute("user_name", user_name);
		
		param = user_name + "/" + algorithm_name + ".java";
		System.out.println(param);
		CallService callService = new CallService();
		str = callService.sendPost(url, param);
		str = URLDecoder.decode(str);
		System.out.println("sss" + str);
		str = new String(str.getBytes("utf-8"), "iso8859_1");
//		System.out.println(str);
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.println(str);
		out.flush();
		out.close();
	}
	
	private String flag = "modi";
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String dispatcher() throws Exception
	{
		String sql = "select * from algorithm_table where algorithm_id=?";
		String[] parameters = {String.valueOf(algorithm_id)};
		ResultSet rs = DatabaseTool.query(sql, parameters);
		
		String algorithm_name = null;
		String algorithm_lang = null;
		int user_id = 0;
		
		if(rs != null)
		{
			while(rs.next())
			{
				algorithm_name = rs.getString("algorithm_name");
				algorithm_lang = rs.getString("algorithm_lang");
				user_id = rs.getInt("user_id");
			}
		}
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("algorithm_name", algorithm_name);
		session.setAttribute("algorithm_lang", algorithm_lang);
		session.setAttribute("algorithm_id", algorithm_id);
		
		int login_id = 0;
		//String id_str = session.getAttribute("id");
		System.out.println(session.getAttribute("id"));
		String id_str = String.valueOf(session.getAttribute("id"));
		if(id_str != null && !id_str.equals("null"))
		{
			login_id = (Integer) session.getAttribute("id");
		}
		else
		{
			login_id = -1;
		}
		
		if(user_id == login_id)
		{
			return "modi";
		}
		else
		{
			return "success";
		}
	}
	
	
	public void readJar() throws Exception
	{
		String sql = "select * from algorithm_table where algorithm_id=?";
		
		String parameters[] = {String.valueOf(algorithm_id)};
		
		ResultSet rs = DatabaseTool.query(sql, parameters);
		
		String returnJar = "";
		
		if(rs != null)
		{
			while(rs.next())
			{
				returnJar = rs.getString("algorithm_jar");
			}
		}
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.println(returnJar);
		out.flush();
		out.close();
		
	}
	
}
