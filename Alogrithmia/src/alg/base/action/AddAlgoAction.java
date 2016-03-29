package alg.base.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.http.HttpRequest;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.web.file.CallService;
import com.web.file.FileClient;
import com.web.test.TestType;

import alg.base.bean.usersbean;
import alg.base.db.ConnectionPool;
import alg.base.util.ConfigurationConstant;
import alg.base.util.DatabaseTool;

public class AddAlgoAction extends ActionSupport{

	private String algoname;
	
	private String country;
	
	private int radio;
	
	private String checkedNum;
	
	private int id;
	
	private String description;
	
	private String inputDescription;
	
	private String inputType;
	
	private String outputType;
	
	private String inputInstance;
	
	private String outputInstance;
	
	private Double pay;
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getInputDescription() {
		return inputDescription;
	}

	public void setInputDescription(String inputDescription) {
		this.inputDescription = inputDescription;
	}

	public String getInputType() {
		return inputType;
	}

	public void setInputType(String inputType) {
		this.inputType = inputType;
	}

	public String getOutputType() {
		return outputType;
	}

	public void setOutputType(String outputType) {
		this.outputType = outputType;
	}

	public String getInputInstance() {
		return inputInstance;
	}

	public void setInputInstance(String inputInstance) {
		this.inputInstance = inputInstance;
	}

	public String getOutputInstance() {
		return outputInstance;
	}

	public void setOutputInstance(String outputInstance) {
		this.outputInstance = outputInstance;
	}

	public Double getPay() {
		return pay;
	}

	public void setPay(Double pay) {
		this.pay = pay;
	}

	public String getAlgoname() {
		return algoname;
	}

	public void setAlgoname(String algoname) {
		this.algoname = algoname;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getRadio() {
		return radio;
	}

	public void setRadio(int radio) {
		this.radio = radio;
	}

	public String getCheckedNum() {
		return checkedNum;
	}

	public void setCheckedNum(String checkedNum) {
		this.checkedNum = checkedNum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void getAlgoLength() throws Exception
	{
		int length = 0;
		
		String sql ="select * from algorithm_table";
		
		ResultSet rs = DatabaseTool.query(sql, null);
		
		if(rs != null)
		{
			rs.last();	
			length = rs.getInt("algorithm_id");
		}
		length++;
		
		HttpServletResponse resp = ServletActionContext.getResponse();
		PrintWriter out = resp.getWriter();
		out.println(length);
		out.flush();
		out.close();
	}
	
	public void setAlgo() throws Exception
	{
		String sql = "insert into algorithm_table(algorithm_lang, algorithm_name," +
				"algorithm_open, algorithm_root, user_id, input_file) values(?, ?, ?, ?, ?, ?)";
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		int user_id = (Integer)session.getAttribute("id");
		
		String parameters[] = {country, algoname, String.valueOf(radio), checkedNum, String.valueOf(user_id), ""};
		
		PreparedStatement ps =DatabaseTool._insert(sql);
		DatabaseTool.setParameters(ps, parameters);
		ps.executeUpdate();
		int algorithm_id = 0;
		try{
			ResultSet rs = ps.getGeneratedKeys();
			if(rs != null)
			{
				rs.next();
				algorithm_id = rs.getInt(1);
			}
			
			session.setAttribute("algorithm_id", algorithm_id);
			System.out.println("algorithm_id = " + algorithm_id);
			System.out.println("user_id = " + user_id);
			System.out.println(rs);
			
			session.setAttribute("algorithm_name", algoname);
			session.setAttribute("algorithm_lang", country);
			
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.println(rs);
			out.flush();
			out.close();
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public void checkAlgo() throws Exception
	{
		String flag = "false";
		List<String> list = new ArrayList<String>();
		String name = "";
		String sql = "select algorithm_name from algorithm_table where user_id=?";
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		int user_id = (Integer) session.getAttribute("id");
		
		String parameters[] = {String.valueOf(user_id)};
		ResultSet rs = DatabaseTool.query(sql, parameters);
		if(rs != null)
		{
			while(rs.next())
			{
				name = rs.getString("algorithm_name");
				list.add(name);
			}
		}
		if(list.contains(algoname))
		{
			flag = "true";
		}
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.print(flag);
		out.flush();
		out.close();
	}	
	
	
	
	public void publishAlgo() throws Exception
	{
		String sql1 = "select * from algorithm_table where algorithm_id=?";
		String[] parameters4 = {String.valueOf(id)};
		ResultSet rs1 = DatabaseTool.query(sql1, parameters4);
		String version = "";
		String algorithm_name = "";
		int user_id = 0;
		if(rs1 != null)
		{
			while(rs1.next())
			{
				version = rs1.getString("version");
				algorithm_name = rs1.getString("algorithm_name");
				algoname = rs1.getString("algorithm_name");
				user_id = rs1.getInt("user_id");
			}
		}
		if(null != version && !"".equals(version))
		{
			int version_int = Integer.parseInt(version);
			version_int++;
			sql1 = "update algorithm_table set version=? where algorithm_id=?";
			String[] parameters5 = {String.valueOf(version_int), String.valueOf(id)}; 
			DatabaseTool.update(sql1, parameters5);
			
			String user_name = "";
			sql1 = "select user_name from users where user_id=?";
			String[] parameters7 = {String.valueOf(user_id)};
			ResultSet rs2 = DatabaseTool.query(sql1, parameters7);
			if(rs2 != null)
			{
				while(rs2.next())
				{
					user_name = rs2.getString("user_name");
				}
			}
			
			String url = ConfigurationConstant.ALOGSERVER_URL + "/PublishVersion";
			String param = user_name + ";" + algorithm_name + ";" + "version" + version_int;
			System.out.println(param);
			CallService callService = new CallService();
			callService.sendPost(url, param);
		}
		else
		{
			sql1 = "update algorithm_table set version=? where algorithm_id=?";
			String[] parameter6 = {"1", String.valueOf(id)};
			DatabaseTool.update(sql1, parameter6);
		}
		
		
		String sql = "update algorithm_table set " +
				"algorithm_pay=? where algorithm_id=?";
		System.out.println(sql);
		
		String parameters[] = {String.valueOf(pay), String.valueOf(id)};
		
		int rs = DatabaseTool.update(sql, parameters);
		
		String lang_type = "";
		sql = "select * from algorithm_api where algorithm_id=?";
		String[] parameters2 = {String.valueOf(id)};
		ResultSet res = DatabaseTool.query(sql, parameters2);
		if(res != null)
		{
			if(res.next() == false)
			{
				sql = "insert into algorithm_api(algorithm_id, lang_type, api_addr," +
						"api_content) values(?, ?, ?, ?)";
				String parameters3[] = {String.valueOf(id), "java", "/upload", "TestClient.jar"};
				int ress = DatabaseTool.update(sql, parameters3);
			}
		}
		
		String result = "";
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		if(rs != 0)
		{
			result = "Update successful";
			System.out.println(rs + "更新成功");
		}
		else
		{
			out.println("Update failed");
		}
		out.println(result);
		out.flush();
		out.close();
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		final String user_name = (String) session.getAttribute("user");
		new Thread(){
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
					TestType test = new TestType(ConfigurationConstant.ALOGSERVER_URL + "/servlet/HelloworldServlet", user_name + "." + algoname + "." + algoname);
					String result= test.callType();
					JSONObject json = JSONObject.fromObject(result);
					String input_type = json.getString("returnParameter");
					String output_type = json.getString("returnType");
					input_type = input_type.substring(1, input_type.length()-1);
					System.out.println(input_type);
					System.out.println(output_type);
					String sql = "update algorithm_table set input_type=?, output_type=? where algorithm_id=?";
					String[] parameters = {input_type, output_type, String.valueOf(id)};
					DatabaseTool.update(sql, parameters);
				} catch (Throwable e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}.start();
	}
	
	public void getUserBean()
	{
		System.out.println("getUserBean");
		HttpSession session = ServletActionContext.getRequest().getSession();
		usersbean user = (usersbean)session.getAttribute("user");
		System.out.println("user_name =" + user.getUser_name());
		System.out.println("user_pwd =" + user.getUser_pwd());
		JSONObject json = new JSONObject();
		json.put("user_name", user.getUser_name());
		
	}
	
	public void readInputFile() throws Exception
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		int algorithm_id = (Integer)session.getAttribute("algorithm_id");
		
		String sql = "select * from algorithm_table where algorithm_id=?";
		
		String parameters[] = {String.valueOf(algorithm_id)};
		
		ResultSet rs = DatabaseTool.query(sql, parameters);
		
		String input_file = null;
		
		if(rs != null)
		{
			while(rs.next())
			{
				input_file = rs.getString("input_file");
			}
		}
		System.out.println(input_file);
		input_file = new String(input_file.getBytes("UTF-8"), "iso8859_1");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.println(input_file);
		out.flush();
		out.close();
		
	}
	
	private File []file;
	
	private String[] fileFileName;
	
	private String[] filePath;
	
	private InputStream inputStream;
	
	private String fileContentType;

	public File[] getFile() {
		return file;
	}

	public void setFile(File[] file) {
		this.file = file;
	}

	public String[] getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String[] fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String[] getFilePath() {
		return filePath;
	}

	public void setFilePath(String[] filePath) {
		this.filePath = filePath;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}


	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String addInputFile() throws Exception
	{
		
		String path = ServletActionContext.getServletContext().getRealPath("/input_file");
		File file = new File(path);
		if(!file.exists())
		{
			file.mkdir();
		} 
		try{
			if(this.file != null)
			{
				File f[] = this.getFile();
				filePath = new String[f.length];
				String sendPath = null;
				FileClient fileClient = new FileClient();
				String result = null;
				String sql_result = null;
				for(int i = 0; i < f.length; i++)
				{
					String name = fileFileName[i];
					FileInputStream inputStream = new FileInputStream(f[i]);
					FileOutputStream outputStream = new FileOutputStream(path + "\\" + name);
					byte[] buf = new byte[1024];
					int length = 0;
					while((length = inputStream.read(buf)) != -1)
					{
						outputStream.write(buf, 0, length);
					}
					inputStream.close();
					outputStream.close();
					
					filePath[i] = path + "\\" + name;
					System.out.println(filePath[i]);
					System.out.println(fileFileName[i]);
					sendPath = filePath[i].replace("\\" + fileFileName[i], "");
					System.out.println(sendPath);
					
					result = fileClient.SubmitPost(ConfigurationConstant.ALOGSERVER_URL + "/ReceiveFileData", fileFileName[i], sendPath);
					result = "success";
					System.out.println("result = " + result);
				}
				if("success".equals(result))
				{
					int id = (Integer)ServletActionContext.getRequest().getSession().getAttribute("algorithm_id");
					
					String sql = "select * from algorithm_table where algorithm_id=?";
					
					String parameters[] ={String.valueOf(id)};
					
					ResultSet rs = DatabaseTool.query(sql, parameters);
					
					String query_input_file = "";
					
					if(rs != null)
					{
						while(rs.next())
						{
							query_input_file = rs.getString("input_file");
						}
					}
					
					if(query_input_file != null && query_input_file != "null")
					{
						query_input_file += ";";
					}
					else
					{
						query_input_file = "";
					}
					
					sql = "update algorithm_table set " +
							"input_file=? where algorithm_id=?";
					
					String input_file = "";
					for(String str : fileFileName)
					{
						input_file += str + ";";
					}
					input_file = input_file.substring(0, input_file.lastIndexOf(";"));
					input_file = query_input_file + input_file;
					
					String parameters2[] = {input_file, String.valueOf(id)};
					
					int r = DatabaseTool.update(sql, parameters2);
					if(r != 0)
					{
						sql_result = "数据库更   新成功"; 
					}
					else
					{
						sql_result = "数据库更新失败";
					}
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
		String returnData = "输入文件添加成功";
		returnData = new String(returnData.getBytes("UTF-8"), "iso8859_1");
		
//		PrintWriter out = ServletActionContext.getResponse().getWriter();
//		out.println(returnData);
//		out.flush();
		
		return "success";
		
	}
	
	private String deleteFile;
	
	public String getDeleteFile() {
		return deleteFile;
	}

	public void setDeleteFile(String deleteFile) {
		this.deleteFile = deleteFile;
	}

	public void deleteInputFlie() throws Exception
	{
		String url = "";
		String param = "";
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		String user = (String)session.getAttribute("user");
		
		param = user + "/" + deleteFile;
		System.out.println(deleteFile);
		CallService callService = new CallService();
		String result = callService.sendPost(url, param);
		
		//result = "success";
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		
		if("success".equals(result))
		{
			out.println("success");
		}
		else
		{
			out.println("fault");
		}
		out.flush();
		out.close();
		
		int id = (Integer)ServletActionContext.getRequest().getSession().getAttribute("algorithm_id");
		
		String sql = "select * from algorithm_table where algorithm_id=?";
		
		String parameters[] ={String.valueOf(id)};
		
		ResultSet rs = DatabaseTool.query(sql, parameters);
		
		String query_input_file = "";
		
		if(rs != null)
		{
			while(rs.next())
			{
				query_input_file = rs.getString("input_file");
			}
		}
		
		String[] file_str = query_input_file.split(";");
		List<String> file_list = new ArrayList<String>();
		for(String str : file_str)
		{
			file_list.add(str);
		}
		file_list.remove(deleteFile);
		query_input_file = "";
		for(String str : file_list)
		{
			query_input_file += str + ";";
		}
		query_input_file = query_input_file.substring(0, query_input_file.lastIndexOf(";"));

		sql = "update algorithm_table set " +
				"input_file=? where algorithm_id=?";
		String parameters2[] = {query_input_file, String.valueOf(id)};
		int r = DatabaseTool.update(sql, parameters2);
		String sql_result = "";
		if(r != 0)
		{
			sql_result = "数据库更新成功";
		}
		else
		{
			sql_result = "数据库更新失败";
		}
		
	}
	
}
