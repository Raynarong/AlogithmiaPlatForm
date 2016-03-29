package com.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.ResultSet;

import org.apache.struts2.ServletActionContext;

import alg.base.util.ConfigurationConstant;
import alg.base.util.DatabaseTool;

import com.opensymphony.xwork2.ActionSupport;
import com.web.file.FileClient;


public class AddJarAction extends ActionSupport{
	
	private File[] file;
	
	private String[] fileFileName;
	
	private String[] filePath;
	
	private InputStream inputStream;
	
	private String fileContentType;
	
	private String algorithm_jar;
	
	public String getAlgorithm_jar() {
		return algorithm_jar;
	}

	public void setAlgorithm_jar(String algorithm_jar) {
		this.algorithm_jar = algorithm_jar;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

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

	public String upload() throws IOException{
		String path = ServletActionContext.getServletContext().getRealPath("/upload");
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
					
//					result = fileClient.SubmitPost("http://localhost:8080/AlogServer/ReceiveJar", fileFileName[i], sendPath);
					result = fileClient.SubmitPost(ConfigurationConstant.ALOGSERVER_URL + "/ReceiveJar", fileFileName[i], sendPath);

					System.out.println("result = " + result);
				}
				if("success".equals(result))
				{
					int id = (Integer)ServletActionContext.getRequest().getSession().getAttribute("algorithm_id");
					
					String sql = "select * from algorithm_table where algorithm_id=?";
					
					String parameter[] = {String.valueOf(id)};
					
					ResultSet res = DatabaseTool.query(sql, parameter);
					
					String query_jar = "";
					
					if(res != null)
					{
						while(res.next())
						{
							query_jar = res.getString("algorithm_jar");
						}
					}
					
					if(query_jar != null && query_jar != "null")
					{
						query_jar += ";";
					}
					else
					{
						query_jar = "";
					}
					
					
					sql = "update algorithm_table set " +
							"algorithm_jar=? where algorithm_id=?";
					
					algorithm_jar = "";
					for(String str : fileFileName)
					{
						algorithm_jar += str + ";";
					}
					algorithm_jar = algorithm_jar.substring(0, algorithm_jar.lastIndexOf(";"));
					algorithm_jar = query_jar + algorithm_jar;
					
					String parameters[] = {algorithm_jar, String.valueOf(id)};
					
					int rs = DatabaseTool.update(sql, parameters);
					if(rs != 0)
					{
						sql_result = "数据库更新成功"; 
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
		
		String returnData = "Jar文件添加成功";
		returnData = new String(returnData.getBytes("UTF-8"), "iso8859_1");
		
//		PrintWriter out = ServletActionContext.getResponse().getWriter();
//		out.println(returnData);
//		out.flush();
		
		return "success";
	}
	
}
