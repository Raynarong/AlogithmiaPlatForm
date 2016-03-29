package alg.base.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import alg.base.bean.Algorithm;
import alg.base.bean.Api;
import alg.base.bean.Comment;
import alg.base.service.AlgorithmService;
import alg.base.service.SearchAlgInTagsService;
import alg.base.service.SearchAlgoService;
import alg.base.service.TagsService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class TagSearchAction extends ActionSupport implements RequestAware{
//	private static final long serialVersionUID = 1L;
	private Map<String, Object> request;
	int currentIndex=1;
	int itemsPerPage=10;
	int totalPage=1;
	private String algTagsName;
	private String[] algTags;
	private String searchAlgo;
	
	public String getSearchAlgo() {
		return searchAlgo;
	}

	public void setSearchAlgo(String searchAlgo) {
		this.searchAlgo = searchAlgo;
	}
	
	public String[] getAlgTags() {
		return algTags;
	}

	public void setAlgTags(String[] algTags) {
		this.algTags = algTags;
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

	public void setRequest(Map<String, Object> req) {
		// TODO Auto-generated method stub
		this.request = req;
	}

	public String getAlgoTags() {
		return algTagsName;
	}

	public void setAlgoTags(String algTagsName) {
		this.algTagsName = algTagsName;
	}




	HttpServletRequest re = ServletActionContext.getRequest();
	HttpSession session = re.getSession();
	

	
	public void Fetch_ByTag() throws Exception{
		re.setCharacterEncoding("UTF-8");
		String tags = algTags[0];
		TagsService ts = new TagsService();
		ArrayList<Algorithm> arrAlg = ts.getArrAlg(tags);
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
		//System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	
	public void Fetch_inTags() throws Exception{
		SearchAlgInTagsService ts = new SearchAlgInTagsService();
		//System.out.println("123");
		String tags = algTags[0];
		//System.out.println(tags);
		ArrayList<Algorithm> arrAlg = ts.searchAlgoInTags(searchAlgo, tags);
		//System.out.println(searchAlgo);
		ArrayList<Algorithm> cuArrAlgs = new ArrayList<Algorithm>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrAlg.size()&&i<itemsPerPage*(currentIndex);i++){
			System.out.println(arrAlg.get(i));
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
