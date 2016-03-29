package com.web.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import alg.base.util.ConfigurationConstant;

import com.web.test.TestClient;

public class RunInputFileAction {

	private String selectFile;

	public String getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(String selectFile) {
		this.selectFile = selectFile;
	}
	
	public void runInputFile() throws Exception{
		
		selectFile = new String(selectFile.getBytes("iso8859_1"), "utf-8");
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		String classStr = "";
		
		classStr = session.getAttribute("user") + "." + session.getAttribute("algorithm_name")
				+ "." + session.getAttribute("algorithm_name");
		
//		String url = "http://localhost:8080/AlogServer/servlet/HelloworldServlet";
		String url = ConfigurationConstant.ALOGSERVER_URL + "/servlet/HelloworldServlet";
		String data = "[\"c://testsave/"+ session.getAttribute("user") + "/" + selectFile + "\"]";
		
		String caller = (String) session.getAttribute("user");
		TestClient testClient = new TestClient(url, classStr, data, caller, "添加jar包在线测试","web服务器");
		
		String result = "";
		
		try {
			result = testClient.callTest();
			System.out.println(result);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = e.getMessage();
		}
		
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.println(result);
		out.flush();
		out.close();
		
	}
	
}
