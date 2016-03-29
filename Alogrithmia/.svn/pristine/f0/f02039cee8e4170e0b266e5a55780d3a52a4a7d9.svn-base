package alg.base.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import alg.base.bean.Algorithm;
import alg.base.bean.Bonus;
import alg.base.service.AlgorithmService;
import alg.base.service.BonusService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class RespondBonusAction extends ActionSupport{
	private Map<String, Object> request;
	private String user_id;
	private String user_name;
	private String time;
	private int bonus_id;
	private String algo_name;
	
	int currentIndex=1;
	int itemsPerPage=10;
	int totalPage=1;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getBonus_id() {
		return bonus_id;
	}
	public void setBonus_id(int bonus_id) {
		this.bonus_id = bonus_id;
	}
	public String getAlgo_name() {
		return algo_name;
	}
	public void setAlgo_name(String algo_name) {
		this.algo_name = algo_name;
	}

	
	public int getCurrentIndex() {
		return currentIndex;
	}
	public void setCurrentIndex(int currentIndex) {
		this.currentIndex = currentIndex;
	}
	public int getItemsPerPage() {
		return itemsPerPage;
	}
	public void setItemsPerPage(int itemsPerPage) {
		this.itemsPerPage = itemsPerPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	HttpServletRequest re = ServletActionContext.getRequest();
	HttpSession session = re.getSession();
	
	public void showAlgNames() throws Exception{
		BonusService bs = new BonusService();
		System.out.println(user_id);
		ArrayList<Algorithm> arrAlg = bs.getAllAlg(user_id);
		JSONObject jobj = new JSONObject();
		jobj.put("arrAlg", arrAlg);
		String jstr = jobj.toString();
		FlushTool.flushJsonRecord(jstr);
	}
	
	public void addRespond() throws Exception{
		AlgorithmService as = new AlgorithmService();
		BonusService bss = new BonusService();
		int algoId = as.getByName(algo_name,user_id).getAlgorithm_id();	
		System.out.println(algoId);
		int questionUser_id = bss.getBonusById(bonus_id).getUser_id();
		//System.out.println(user_id);
		int a = bss.addRespondBonus(bonus_id, algoId, questionUser_id, user_id, time);
		JSONObject jobj = new JSONObject();
		if(a!=0){
			Algorithm alg = as.getById(algoId);
			jobj.put("alg", alg);
			jobj.put("message", "success");

		}else {
			jobj.put("message", "error");
			System.out.println(a);
		}
		String jstr = jobj.toString();
		FlushTool.flushJsonRecord(jstr);
	}

	public void bonusRespondList() throws Exception{
		BonusService bss = new BonusService();
		ArrayList<Algorithm> arrAlg = bss.getRespondBonus(bonus_id);
		ArrayList<Algorithm>cuArrAlgs = new ArrayList<Algorithm>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrAlg.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrAlgs.add(arrAlg.get(i));
		}
		JSONObject jobj = new JSONObject();
		jobj.put("cuArrAlgs", cuArrAlgs);
		jobj.put("currentIndex", currentIndex);
		jobj.put("totalPage", totalPage);
		String jstr = jobj.toString();
		FlushTool.flushJsonRecord(jstr);
	}
}
