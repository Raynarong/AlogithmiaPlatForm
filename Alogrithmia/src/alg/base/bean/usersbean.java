package alg.base.bean;

import java.sql.Timestamp;

public class usersbean {
	private int user_id;
	private String user_name;
	private String user_mail;
	private String user_pwd;
	private String user_sex;
	private String user_portrait;
	private int user_credit;
	private String user_account;
	private int level;
	private Timestamp outDate;
	private String validataCode;

	public Timestamp getOutDate() {
		return outDate;
	}
	public void setOutDate(Timestamp outDate) {
		this.outDate = outDate;
	}
	public String getValidataCode() {
		return validataCode;
	}
	public void setValidataCode(String validataCode) {
		this.validataCode = validataCode;
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
		this.user_sex = user_sex;
	}
	public String getUser_portrait() {
		return user_portrait;
	}
	public void setUser_portrait(String user_portrait) {
		this.user_portrait = user_portrait;
	}
	public int getUser_credit() {
		return user_credit;
	}
	public void setUser_credit(int user_credit) {
		this.user_credit = user_credit;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}

	

}
