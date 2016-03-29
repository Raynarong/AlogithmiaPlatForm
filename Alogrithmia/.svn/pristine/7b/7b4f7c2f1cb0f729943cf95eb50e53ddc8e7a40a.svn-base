package alg.base.action;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import alg.base.bean.Algorithm;
import alg.base.bean.AlgorithmTags;
import alg.base.bean.Api;
import alg.base.bean.Comment;
import alg.base.bean.Type;
import alg.base.service.AlgorithmService;
import alg.base.service.TagsService;
import alg.base.util.ConfigurationConstant;
import alg.base.util.DatabaseTool;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class AlgorithmAction extends ActionSupport implements RequestAware{

	
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
		this.request = req;
	}

	HttpServletRequest re = ServletActionContext.getRequest();
	HttpSession session = re.getSession();
	
	public String Fetch() throws Exception{
		
		AlgorithmService as = new AlgorithmService();
		ArrayList<Algorithm>arrAlg = as.getAllAlg();
		ArrayList<Algorithm>cuArrAlgs = new ArrayList<Algorithm>();
		for(int i=(currentIndex-1)*itemsPerPage;i<arrAlg.size()&&i<itemsPerPage*(currentIndex);i++){
			cuArrAlgs.add(arrAlg.get(i));
		}
//		JSONArray jarr = JSONArray.fromObject(arrAlg);
//		String jarrStr = jarr.toString();
//		FlushTool.flushJsonRecord(jarrStr);
		totalPage =(int) (Math.ceil((double)arrAlg.size()/itemsPerPage));
		request.put("totalPage", totalPage);
		request.put("algInfo", arrAlg);
		request.put("cuArrAlgs", cuArrAlgs);
		request.put("currentIndex", currentIndex);
		return SUCCESS;
	}

	public void Fetch_j() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("client_url", ConfigurationConstant.ALOGSERVER_URL);
		//查询算法
		AlgorithmService as = new AlgorithmService();
		ArrayList<Algorithm> arrAlg = as.getAllAlg();
		ArrayList<Algorithm>cuArrAlgs = new ArrayList<Algorithm>();
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
	
	public void Fetch_Byid() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("client_url", ConfigurationConstant.ALOGSERVER_URL);
		int id = alg_id;
		setVisitTimes();
		Algorithm alg = new Algorithm();
		AlgorithmService as = new AlgorithmService();
		alg = as.getById(id);
		ArrayList<String>tagArr = as.getTagsById(id);
		ArrayList<Api>apiArr =as.getApiById(id);
/*		ArrayList<Comment>comArr = as.getComById(id);*/
		JSONObject jobj = new JSONObject();
		jobj.put("alg", alg);
		jobj.put("tagArr", tagArr);
		jobj.put("apiArr", apiArr);
/*		jobj.put("comArr", comArr);*/
		String jstr = jobj.toString();
		//System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	
	public void Fetch_User() throws Exception{
		
		AlgorithmService as = new AlgorithmService();
		ArrayList<Algorithm>arrAlg = as.getAllAlg(Integer.toString((Integer)session.getAttribute("id")));
		ArrayList<Algorithm>cuArrAlgs = new ArrayList<Algorithm>();
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
	
	public void getAlgType() throws Exception{
		AlgorithmService as = new AlgorithmService();
		ArrayList<Type> typeList = as.getAlgType();

//		JSONArray jarr = JSONArray.fromObject(cuArrAlgs);
//		String jarrStr = jarr.toString();
//		System.out.println(jarrStr);
//		FlushTool.flushJsonRecord(jarrStr);
	
		JSONObject jobj = new JSONObject();
		jobj.put("typeName", typeList);
		/*jobj.put(key, value);*/
		String jstr = jobj.toString();
		//System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	
	public void getUserName() throws Exception {
		int id = alg_id;
		String sql = "select user_id from algorithm_table where algorithm_id=?";
		String p[] = {String.valueOf(id)};
		
		ResultSet rs = DatabaseTool.query(sql, p);
		
		int user_id = 0;
		if (rs != null)
		{
			while (rs.next())
			{
				user_id = rs.getInt("user_id");
			}
		}
		
		sql = "select user_name from users where user_id=?";
		p[0] = String.valueOf(user_id);
		
		String user_name = "";
		rs = DatabaseTool.query(sql, p);
		if(rs != null)
		{
			while (rs.next())
			{
				user_name = rs.getString("user_name");
			}
		}
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("client_url", ConfigurationConstant.ALOGSERVER_URL);
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(user_name);
		out.flush();
		out.close();
	}
	
	public void setVisitTimes() throws Exception {
		int id = alg_id;
		String sql = "select * from algorithm_table where algorithm_id=?";
		String p[] = {String.valueOf(id)};
		ResultSet rs = DatabaseTool.query(sql, p);
		
		int visit_times = 0;
		int user_id = 0;
		if (rs != null)
		{
			while (rs.next())
			{
				user_id = rs.getInt("user_id");
				visit_times = rs.getInt("vist_times");
			}
		}
		int login_id = 0;
		HttpSession session = ServletActionContext.getRequest().getSession();
		String id_str = String.valueOf(session.getAttribute("id"));
		if(id_str != null && !id_str.equals("null"))
		{
			login_id = (Integer) session.getAttribute("id");
		}
		else
		{
			login_id = -1;
		}
		String v = String.valueOf(visit_times);
		if(user_id != login_id)
		{
			if(v == null || "".equals(v))
			{
				v = "0";
			}
			visit_times = Integer.parseInt(v);
			visit_times++;
			System.out.println(visit_times);
			sql = "update algorithm_table set vist_times=? where algorithm_id=?";
			String[] p1 = {String.valueOf(visit_times), String.valueOf(id)};
			DatabaseTool.update(sql, p1);
		}
			
	}
	
}
