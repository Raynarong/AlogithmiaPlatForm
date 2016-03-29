package com.web.file;

import java.io.InputStream;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownload extends ActionSupport {

	private int number;
	private String fileName;

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public InputStream getDownloadFile()
	{
		if(1 == number)
		{
			this.fileName = "TestClient.jar";
			return ServletActionContext.getServletContext().getResourceAsStream("upload/TestClient.jar");
		}
		else if(number == 2){
			this.fileName = "algorithm.js";
			return ServletActionContext.getServletContext().getResourceAsStream("upload/algorithm.js");
		}
			return null;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
