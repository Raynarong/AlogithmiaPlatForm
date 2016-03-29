package alg.base.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import alg.base.bean.Algorithm;
import alg.base.bean.Api;
import alg.base.bean.Bonus;
import alg.base.bean.Comment;
import alg.base.service.AlgorithmService;
import alg.base.service.BonusService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BonusAction extends ActionSupport implements RequestAware{
	int user_id;
	int currentIndex=1;
	int itemsPerPage=5;
	int totalPage=1;
	int bonus_id;
	String searchWord;
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

	private Map<String, Object> request;
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	public int getBonus_id() {
		return bonus_id;
	}

	public void setBonus_id(int bonus_id) {
		this.bonus_id = bonus_id;
	}
	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public void setRequest(Map<String, Object> req) {
		this.request = req;
	}
	HttpServletRequest re = ServletActionContext.getRequest();
	HttpSession session = re.getSession();
	public String Fetch() throws Exception{
		BonusService bs = new BonusService();
		ArrayList<Bonus> arrBs = bs.getBonusInfo();
		ArrayList<Bonus> cuArrBs =  new ArrayList<Bonus>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrBs.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrBs.add(arrBs.get(i));
		}
		totalPage =(int) (Math.ceil((double)arrBs.size()/itemsPerPage));
		request.put("totalPage", totalPage);
		request.put("arrBs", arrBs);
		request.put("cuArrBs", cuArrBs);
		request.put("currentIndex", currentIndex);
		return SUCCESS;
	}
	public void Fetch_j() throws Exception{
		BonusService bs = new BonusService();
		ArrayList<Bonus> arrBs = bs.getBonusInfo();
		ArrayList<Bonus> cuArrBs =  new ArrayList<Bonus>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrBs.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrBs.add(arrBs.get(i));
		}
		totalPage =(int) (Math.ceil((double)arrBs.size()/itemsPerPage));

		JSONObject jobj = new JSONObject();
		jobj.put("cuArrBs", cuArrBs);
		jobj.put("currentIndex", currentIndex);
		jobj.put("totalPage",totalPage);
		String jstr = jobj.toString();
		System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	public void Fetch_User() throws Exception{
		BonusService bs = new BonusService();
		ArrayList<Bonus> arrBs = bs.getBonusInfo(Integer.toString((Integer)session.getAttribute("id")));
		ArrayList<Bonus> cuArrBs =  new ArrayList<Bonus>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrBs.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrBs.add(arrBs.get(i));
		}
		totalPage =(int) (Math.ceil((double)arrBs.size()/itemsPerPage));

		JSONObject jobj = new JSONObject();
		jobj.put("cuArrBs", cuArrBs);
		jobj.put("currentIndex", currentIndex);
		jobj.put("totalPage",totalPage);
		String jstr = jobj.toString();
		System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	//悬赏详情 通过ID寻找悬赏 renee
	public void Fetch_Byid() throws Exception{
		int id = bonus_id;
		Bonus bonus = new Bonus();
		BonusService bs = new BonusService();
		bonus = bs.getBonusById(id);
		JSONObject jobj = new JSONObject();
		jobj.put("bonus", bonus);
		String jstr = jobj.toString();
		//System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	//搜索悬赏问题 renee
	public void searchBonus() throws Exception{
		BonusService bs = new BonusService();
		System.out.println(searchWord);
		ArrayList<Bonus> arrBs = bs.getBonusInfoBywords(searchWord);
		ArrayList<Bonus> cuArrBs =  new ArrayList<Bonus>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrBs.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrBs.add(arrBs.get(i));
		}
		totalPage =(int) (Math.ceil((double)arrBs.size()/itemsPerPage));

		JSONObject jobj = new JSONObject();
		jobj.put("cuArrBs", cuArrBs);
		jobj.put("currentIndex", currentIndex);
		jobj.put("totalPage",totalPage);
		String jstr = jobj.toString();
		System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
}
