package alg.base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import alg.base.bean.Respond;
import alg.base.service.CommentService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class RespondAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	int algorithm_id;
	int reviewer_id;
	int responder_id;
	String[] review_id;
	int flag;
	String respond_content;
	String respond_time;
	public int getAlgorithm_id() {
		return algorithm_id;
	}
	public void setAlgorithm_id(int algorithm_id) {
		this.algorithm_id = algorithm_id;
	}
	public int getReviewer_id() {
		return reviewer_id;
	}
	public void setReviewer_id(int reviewer_id) {
		this.reviewer_id = reviewer_id;
	}
	public int getResponder_id() {
		return responder_id;
	}
	public void setResponder_id(int responder_id) {
		this.responder_id = responder_id;
	}
	public String[] getReview_id() {
		return review_id;
	}
	public void setReview_id(String[] review_id) {
		this.review_id = review_id;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getRespond_content() {
		return respond_content;
	}
	public void setRespond_content(String respond_content) {
		this.respond_content = respond_content;
	}
	public String getRespond_time() {
		return respond_time;
	}
	public void setRespond_time(String respond_time) {
		this.respond_time = respond_time;
	}
	
	public void AddRespond() throws Exception {
		System.out.println("add");

		Respond res = initRes();
		CommentService csr = new CommentService();
		int i = csr.addRespond(res);
		System.out.println(i);
		FlushTool.flushJsonRecord(i);
	}

	public Respond initRes() {
		Respond res = new Respond();
		int res_id = Integer.parseInt(review_id[0]);
		res.setAlgorithm_id(algorithm_id);
		res.setFlag(flag);
		res.setReview_id(res_id);
		res.setReviewer_id(reviewer_id);
		res.setRespond_content(respond_content);
		res.setResponer_id(responder_id);
		res.setRespond_time(respond_time);
		return res;

	}
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpSession session = request.getSession();
	public void message_number(){
		
	}

}
