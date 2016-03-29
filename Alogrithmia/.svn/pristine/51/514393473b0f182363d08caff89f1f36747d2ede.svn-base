package alg.base.action;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;

import alg.base.bean.AlgorithmTags;

import alg.base.service.TagsService;
import alg.base.util.FlushTool;

public class TagsAction extends ActionSupport implements RequestAware{
	private static final long serialVersionUID = 1L;
	private Map<String, Object> request;
	private String[] matchTag;
	
	public void setRequest(Map<String, Object> req) {
		// TODO Auto-generated method stub
		this.request = req;
	}

	public String[] getMatchTag() {
		return matchTag;
	}

	public void setMatchTag(String[] matchTag) {
		this.matchTag = matchTag;
	}

	HttpServletRequest re = ServletActionContext.getRequest();
	HttpSession session = re.getSession();
	
	public String Fetch() throws Exception{
		
		TagsService ts = new TagsService();
		ArrayList<AlgorithmTags> tagsName = ts.getTagsName();
//		JSONArray jarr = JSONArray.fromObject(arrAlg);
//		String jarrStr = jarr.toString();
//		FlushTool.flushJsonRecord(jarrStr);
		request.put("tagsName", tagsName);
		return SUCCESS;
	}

	public void Fetch_j() throws Exception{
		//查询标签
		TagsService ts = new TagsService();
		ArrayList<AlgorithmTags> tagsName = ts.getTagsName();
		
		
//		for(AlgorithmTags t:tagsName){
//			System.out.println(t.getTag_name());
//		}
//		JSONArray jarr = JSONArray.fromObject(cuArrAlgs);
//		String jarrStr = jarr.toString();
//		System.out.println(jarrStr);
//		FlushTool.flushJsonRecord(jarrStr);
		JSONObject jobj = new JSONObject();
		jobj.put("tagsName", tagsName);
		String jstr = jobj.toString();
		System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
	
	public void matchTags() throws Exception{
		TagsService ts = new TagsService();
		String tag = matchTag[0];
		ArrayList<AlgorithmTags> tagsName = ts.getMatchTag(tag);
		JSONObject jobj = new JSONObject();
		jobj.put("tagsName", tagsName);
		String jstr = jobj.toString();
		System.out.println(jstr);
		FlushTool.flushJsonRecord(jstr);
	}
}
