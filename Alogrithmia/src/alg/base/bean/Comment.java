package alg.base.bean;

import java.util.ArrayList;

public class Comment {
	int review_id;
	int algorithm_id;
	int respond_id;
	int reviewer_id;
	String review_content;
	String review_time;
	String flag;
	String reviewer_name;
	
	public String getReviewer_name() {
		return reviewer_name;
	}
	public void setReviewer_name(String reviewer_name) {
		this.reviewer_name = reviewer_name;
	}
	ArrayList<Comment>childCom=new ArrayList<Comment>();//评论的子回复
	public ArrayList<Comment> getChildCom() {
		return childCom;
	}
	public void setChildCom(ArrayList<Comment> childCom) {
		this.childCom = childCom;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
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
	public int getAlgorithm_id() {
		return algorithm_id;
	}
	public void setAlgorithm_id(int algorithm_id) {
		this.algorithm_id = algorithm_id;
	}
	public int getRespond_id() {
		return respond_id;
	}
	public void setRespond_id(int respond_id) {
		this.respond_id = respond_id;
	}
}
