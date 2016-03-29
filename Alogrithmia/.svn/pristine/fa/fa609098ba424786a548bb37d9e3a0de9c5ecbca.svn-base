package alg.base.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import alg.base.bean.Algorithm;
import alg.base.service.AlgorithmService;
import alg.base.service.SearchAlgoService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class SearchAlgoAction extends ActionSupport implements RequestAware{

	private static final long serialVersionUID = 1L;
	private Map<String, Object> request;
	int currentIndex=1;
	int itemsPerPage=10;
	int totalPage=1;
	int alg_id=1;
	
	public int getAlg_id() {
		return alg_id;
	}

	public void setAlg_id(int alg_id) {
		this.alg_id = alg_id;
	}

	public int getCurrentIndex() {
		return currentIndex;
	}

	public void setCurrentIndex(int currentIndex) {
		this.currentIndex = currentIndex;
	}
	
	public void setRequest(Map<String, Object> req) {
		// TODO Auto-generated method stub
		this.request = req;
	}
	
	private String searchAlgo;
	
	public String getSearchAlgo() {
		return searchAlgo;
	}

	public void setSearchAlgo(String searchAlgo) {
		this.searchAlgo = searchAlgo;
	}

	HttpServletRequest re = ServletActionContext.getRequest();
	HttpSession session = re.getSession();
	


	public void Fetch_j() throws Exception{
		SearchAlgoService ss = new SearchAlgoService();
		ArrayList<Algorithm> arrAlg = ss.searchAlgo(searchAlgo);
		ArrayList<Algorithm> cuArrAlgs = new ArrayList<Algorithm>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrAlg.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrAlgs.add(arrAlg.get(i));
		}
//		JSONArray jarr = JSONArray.fromObject(cuArrAlgs);
//		String jarrStr = jarr.toString();
//		System.out.println(jarrStr);
//		FlushTool.flushJsonRecord(jarrStr);
		totalPage = (int) (Math.ceil((double)arrAlg.size()/itemsPerPage));
		JSONObject jobj = new JSONObject();
		jobj.put("cuArrAlgs", cuArrAlgs);
		jobj.put("currentIndex", currentIndex);
		jobj.put("totalPage", totalPage);
		String jstr = jobj.toString();
		System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	


}
