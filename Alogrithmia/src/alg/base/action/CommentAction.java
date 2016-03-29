package alg.base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;

import alg.base.bean.Algorithm;
import alg.base.bean.Comment;
import alg.base.bean.cometBean;
import alg.base.service.AlgorithmService;
import alg.base.service.CommentService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class CommentAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int algorithm_id;
	int reviewer_id;
	String flag;
	String review_content;
	String review_time;
	String respond_id;
	public String getRespond_id() {
		return respond_id;
	}

	public void setRespond_id(String respond_id) {
		this.respond_id = respond_id;
	}

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

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_time() {
		return review_time;
	}

	public void setReview_time(String review_time) {
		this.review_time = review_time;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public void Add() throws Exception {

		Comment c = initCom();
		CommentService csr = new CommentService();
		int i = csr.addComment(c);
		System.out.println(i);
		CometEngine engine = CometContext.getInstance().getEngine();
		int alogrithima_id=c.getAlgorithm_id();
		AlgorithmService algo=new AlgorithmService ();
		Algorithm newAlg=algo.getById(alogrithima_id);
		int cometUser=newAlg.getUser_id();
		 engine.sendToAll("hello",cometUser);
		FlushTool.flushJsonRecord(i);
	}

	public Comment initCom() {
		Comment c = new Comment();
		c.setAlgorithm_id(algorithm_id);
		c.setFlag(flag);
		c.setReview_content(review_content);
		c.setReviewer_id(reviewer_id);
		c.setReview_time(review_time);
		return c;

	}
	
	public void setFlag() throws Exception{
		
		CommentService csr =  new CommentService();
		csr.updateFlag(algorithm_id);
		
	}
	
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	 HttpSession session = request.getSession();
	public void message_number(){
		
	}
}
