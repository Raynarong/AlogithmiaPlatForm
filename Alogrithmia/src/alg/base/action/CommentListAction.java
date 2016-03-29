package alg.base.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import alg.base.bean.Algorithm;
import alg.base.bean.Comment;
import alg.base.bean.Respond;
import alg.base.service.AlgorithmService;
import alg.base.service.CommentService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class CommentListAction extends ActionSupport implements RequestAware{
	
	private Map<String, Object> request;
	int currentIndex=1;
	int itemsPerPage=50;
	int totalPage=1;
	private String[] algorithm_id;
	
	
//	int reviewer_id;
//	String review_content;
//	String review_time;
	
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

	public String[] getAlgorithm_id() {
		return algorithm_id;
	}

	public void setAlgorithm_id(String[] algorithm_id) {
		this.algorithm_id = algorithm_id;
	}

	public void setRequest(Map<String, Object> req) {
		this.request = req;
		
	}
	HttpServletRequest re = ServletActionContext.getRequest();
	HttpSession session = re.getSession();
	
	public void getComment() throws Exception{
		
		//查询评价
		CommentService cs = new CommentService();
		int algId = Integer.parseInt(algorithm_id[0]);
		ArrayList<Comment> arrCom = cs.getAllComment(algId);
//		for(Comment a:arrCom){
//			System.out.println(a.getReviewer_name());
//		}
		ArrayList<Comment>cuArrCom = new ArrayList<Comment>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrCom.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrCom.add(arrCom.get(i));
		}
//		JSONArray jarr = JSONArray.fromObject(cuArrAlgs);
//		String jarrStr = jarr.toString();
//		System.out.println(jarrStr);
//		FlushTool.flushJsonRecord(jarrStr);
		totalPage = (int) (Math.ceil((double)arrCom.size()/itemsPerPage));
		JSONObject jobj = new JSONObject();
		jobj.put("cuArrCom", cuArrCom);
		jobj.put("currentIndex", currentIndex);
		jobj.put("totalPage", totalPage);
		String jstr = jobj.toString();
		System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	
	//查询回复
	public void getRespond() throws Exception{
		CommentService cs = new CommentService();
		int algId = Integer.parseInt(algorithm_id[0]);
		ArrayList<Respond> arrRes = cs.getAllRespond(algId);
		for(Respond a:arrRes){
			System.out.println(a.getResponer_name());
	}
		ArrayList<Respond> cuArrCom = new ArrayList<Respond>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrRes.size()&&i<itemsPerPage*(currentIndex);i++){
		cuArrCom.add(arrRes.get(i));
		}
//		JSONArray jarr = JSONArray.fromObject(cuArrAlgs);
//		String jarrStr = jarr.toString();
//		System.out.println(jarrStr);
//		FlushTool.flushJsonRecord(jarrStr);
		totalPage = (int) (Math.ceil((double)arrRes.size()/itemsPerPage));
		JSONObject jobj = new JSONObject();
		jobj.put("cuArrCom", cuArrCom);
		jobj.put("currentIndex", currentIndex);
		jobj.put("totalPage", totalPage);
		String jstr = jobj.toString();
		//System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	
}
