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
import alg.base.service.TagsService;
import alg.base.service.TypeSearchService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class TypeSearchAction extends ActionSupport implements RequestAware{
	
	private Map<String, Object> request;
	int currentIndex=1;
	int itemsPerPage=10;
	int totalPage=1;
	private String[] algType;
	private String searchAlgo;
	
	public void setRequest(Map<String, Object> req) {
		// TODO Auto-generated method stub
		this.request = req;
	}
	HttpServletRequest re = ServletActionContext.getRequest();
	HttpSession session = re.getSession();
	
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

	public String[] getAlgType() {
		return algType;
	}

	public void setAlgType(String[] algType) {
		this.algType = algType;
	}
	
	public String getSearchAlgo() {
		return searchAlgo;
	}

	public void setSearchAlgo(String searchAlgo) {
		this.searchAlgo = searchAlgo;
	}

	public void fetch_ByType() throws Exception{
		String type = algType[0];
		System.out.println(type);
		AlgorithmService as = new AlgorithmService();
		ArrayList<Algorithm> arrAlg = as.getAlgByType(type);
		ArrayList<Algorithm> cuArrAlgs = new ArrayList<Algorithm>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrAlg.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrAlgs.add(arrAlg.get(i));
			System.out.println(arrAlg.get(i).getAlgorithm_name());
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
		//System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	
	public void fetch_Intype() throws Exception{
		String type = algType[0];
		System.out.println(type);
		TypeSearchService tss = new TypeSearchService();
		ArrayList<Algorithm> arrAlg = tss.searchAlgoInTypes(searchAlgo, type);
		ArrayList<Algorithm> cuArrAlgs = new ArrayList<Algorithm>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrAlg.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrAlgs.add(arrAlg.get(i));
			System.out.println(arrAlg.get(i).getAlgorithm_name());
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
		FlushTool.flushJsonRecord(jstr);
	}
}
