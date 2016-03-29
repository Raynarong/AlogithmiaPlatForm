package com.web.file;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import alg.base.util.DatabaseTool;

import com.opensymphony.xwork2.ActionSupport;

public class FileManageDownload extends ActionSupport {

	private String fileName;
	private int collectionId;

	public String getFileName() throws UnsupportedEncodingException {
		return new String(fileName.getBytes("UTF-8"), "iso8859_1");
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getCollectionId() {
		return collectionId;
	}

	public void setCollectionId(int collectionId) {
		this.collectionId = collectionId;
	}

	public InputStream getDownloadFile() throws Exception
	{
		HttpSession session = ServletActionContext.getRequest().getSession();
		String user_name = (String) session.getAttribute("user");
		String collection_name = "";
		String sql = "select * from collection where id=?";
		String[] pa1 = {String.valueOf(collectionId)};
		ResultSet rs = DatabaseTool.query(sql, pa1);
		if(rs != null)
		{
			rs.next();
			collection_name = rs.getString("name");
		}
		String path = "/data/" + user_name + "/" + collection_name + "/" + fileName;
		return ServletActionContext.getServletContext().getResourceAsStream(path);
	}
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	
}
