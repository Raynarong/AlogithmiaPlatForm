package alg.base.bean;

public class Bonus {

	int bonus_id;
	int user_id;
	int algorithm_id;
	String bonus_title;
	String bonus_instruction;
	double bonus_pride;
	String bonus_time;
	String user_name;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getBonus_id() {
		return bonus_id;
	}
	public void setBonus_id(int bonus_id) {
		this.bonus_id = bonus_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAlgorithm_id() {
		return algorithm_id;
	}
	public void setAlgorithm_id(int algorithm_id) {
		this.algorithm_id = algorithm_id;
	}
	public String getBonus_title() {
		return bonus_title;
	}
	public void setBonus_title(String bonus_title) {
		this.bonus_title = bonus_title;
	}
	public String getBonus_instruction() {
		return bonus_instruction;
	}
	public void setBonus_instruction(String bonus_instruction) {
		this.bonus_instruction = bonus_instruction;
	}
	public double getBonus_pride() {
		return bonus_pride;
	}
	public void setBonus_pride(double bonus_pride) {
		this.bonus_pride = bonus_pride;
	}
	public String getBonus_time() {
		return bonus_time;
	}
	public void setBonus_time(String bonus_time) {
		this.bonus_time = bonus_time;
	}
	
	
}
