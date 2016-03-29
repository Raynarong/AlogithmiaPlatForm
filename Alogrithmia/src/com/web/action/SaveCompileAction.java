package com.web.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import alg.base.util.ConfigurationConstant;
import alg.base.util.ZipUtils;

import com.sun.xml.internal.messaging.saaj.util.Base64;
import com.web.file.FileClient;
import com.web.test.TestType;

public class SaveCompileAction {

	private String editor;

	private String buttonId;

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getButtonId() {
		return buttonId;
	}

	public void setButtonId(String buttonId) {
		this.buttonId = buttonId;
	}

	public void save_compile() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		
//		System.out.println(editor);
		editor = Base64.base64Decode(editor);
		editor = new String(editor.getBytes("iso8859_1"), "UTF-8");
		System.out.println(editor);
		
		String realAddress = ServletActionContext.getServletContext()
				.getRealPath("/saveAlgo");
		System.out.println(realAddress);

		File file = new File(realAddress);
		// ����ļ��в����ڣ������ļ���
		if (!file.exists() && !file.isDirectory()) {
			file.mkdir();
		}
		realAddress += "\\" + session.getAttribute("user");
		File file2 = new File(realAddress);
		if (!file2.exists() && !file2.isDirectory()) {
			file2.mkdir();
		}
		System.out.println(realAddress);
		File txt = new File(realAddress + "\\"
				+ session.getAttribute("algorithm_name") + ".java");
		if (!txt.exists()) {
			txt.createNewFile();
		}
		FileWriter write = new FileWriter(txt);
		write.write(editor);
		write.flush();
		write.close();

		String str = realAddress.replace("\\", "/");
		String sendPath = str.replaceFirst("//", "/");
		System.out.println("sendpath = " + sendPath);
		
		String sourceFilePath = sendPath + "/" + session.getAttribute("algorithm_name") + ".java";
		ZipUtils.fileToZip(sourceFilePath, sendPath, (String) session.getAttribute("algorithm_name"));
		
		String result = "";
		if ("save".equals(buttonId)) {
			FileClient FileClient = new FileClient();

			result = FileClient.SubmitPost(
					ConfigurationConstant.ALOGSERVER_URL + "/SaveData",
					session.getAttribute("algorithm_name") + ".zip", sendPath);

		} else if ("compile".equals(buttonId)) {
			FileClient FileClient = new FileClient();

			result = FileClient.SubmitPost(ConfigurationConstant.ALOGSERVER_URL + "/ReceiveData",
					session.getAttribute("algorithm_name") + ".zip", sendPath);
			
		}

		System.out.println(result);

		result = new String(result.getBytes("UTF-8"), "iso8859_1");
		PrintWriter out = ServletActionContext.getResponse().getWriter();

		out.println(result);

		out.flush();
	}
}
