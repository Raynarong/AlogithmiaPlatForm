package alg.base.action;

import org.apache.struts2.ServletActionContext;

import alg.base.util.DatabaseTool;

import com.opensymphony.xwork2.ActionSupport;

public class FeedbackAction extends ActionSupport {

	private String name;
	private String email;
	private String phone;
	private String message;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String feedback() throws Exception {
		int id = (Integer) ServletActionContext.getRequest().getSession().getAttribute("id");
		
		String sql = "insert into feedback (telphone, email, content, name, userid) values(?, ?, ?, ?, ?)";
		String[] pa5 = {phone, email, message, name, String.valueOf(id)};
		DatabaseTool.update(sql, pa5);
		return "success";
	}
	
}
