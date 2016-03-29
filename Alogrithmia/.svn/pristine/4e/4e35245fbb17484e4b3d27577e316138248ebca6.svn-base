package alg.base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.http.client.fluent.Request;
import org.apache.struts2.ServletActionContext;

import com.sun.net.httpserver.Authenticator.Success;

import alg.base.bean.Bonus;
import alg.base.db.ConnectionPool;
import alg.base.util.DatabaseTool;
import alg.base.util.FlushTool;

public class CreateRewardAction{
	private String reward_name;
	private String reward_instruction;
	private double reward_pride;
	private String time;
	private int user_id;
	private String user_name;
	public String getReward_name() {
		return reward_name;
	}
	public void setReward_name(String reward_name) {
		this.reward_name = reward_name;
	}
	public String getReward_instruction() {
		return reward_instruction;
	}
	public void setReward_instruction(String reward_instruction) {
		this.reward_instruction = reward_instruction;
	}
	public double getReward_pride() {
		return reward_pride;
	}
	public void setReward_pride(double reward_pride) {
		this.reward_pride = reward_pride;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
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

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session = request.getSession();
	
	public void createReward() throws Exception{
		Bonus bonus = new Bonus();

//		System.out.println(reward_name);
//		System.out.println(user_id);
//		System.out.println(user_name);
		
		bonus.setBonus_title(reward_name);
		bonus.setBonus_instruction(reward_instruction);
		bonus.setBonus_pride(reward_pride);
		bonus.setUser_id(user_id);
		bonus.setUser_name(user_name);
		bonus.setBonus_time(time);
		String sql = "insert into bonus(user_id,bonus_title,bonus_instruction,bonus_pride,bonus_time) values (?,?,?,?,?)";
		String[] p = {user_id+"",reward_name,reward_instruction,reward_pride+"",time};
		int a = DatabaseTool.update(sql, p);
		System.out.println(a);
		

		JSONObject jobj = new JSONObject();
	
		if(a!=0){
			jobj.put("message","success");
		}else {
			jobj.put("message","error");	
		}
		String jstr = jobj.toString();
		System.out.println(jstr);	
		FlushTool.flushJsonRecord(jstr);
		
	}
}
