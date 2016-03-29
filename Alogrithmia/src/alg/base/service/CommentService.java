package alg.base.service;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import alg.base.bean.Bonus;
import alg.base.bean.Comment;
import alg.base.bean.Respond;
import alg.base.util.DatabaseTool;

public class CommentService {

	//添加评价
	public int addComment(Comment c) throws Exception{
		String sql = "insert into comment(reviewer_id,review_content,review_time,flag,algorithm_id,respond_id)values(?,?,?,?,?,?)";	
		String p[] = {c.getReviewer_id()+"",c.getReview_content(),c.getReview_time(),c.getFlag(),c.getAlgorithm_id()+"","0"};
		int i =DatabaseTool.update(sql, p);
	//	System.out.println(i);
		return i;
	}
	
	//添加回复
	public int addRespond(Respond res) throws Exception{
		String sql = "insert into respond(review_id,reviewer_id,respond_content,respond_time,flag,algorithm_id,responder_id)values(?,?,?,?,?,?,?)";
		String p[] = {res.getReview_id()+"",res.getReviewer_id()+"",res.getRespond_content(),res.getRespond_time(),res.getFlag()+"",res.getAlgorithm_id()+"",res.getResponer_id()+""};
		int i =DatabaseTool.update(sql, p);
		System.out.println(i);
		return i;
	}
	
	//获取算法作者的算法中的所有评论 和算法作者对别人算法的评论
	public  ArrayList<Comment> getAllComment(String userId) throws Exception{
		String sql="select *  from comment where flag=0 and reviewer_id!=? and algorithm_id in (select algorithm_id from  algorithm_table where user_id=?)";//获得别人评价你的算法
		//String sql1="select * from comment where flag=0 and reviewer_id=?";
	    String p[]={userId};
	    String pd[]={userId,userId};
		ResultSet rs = DatabaseTool.query(sql, pd);
	//	ResultSet rs1 = DatabaseTool.query(sql1, p);
		ArrayList<Comment>comdetail = new ArrayList<Comment>();
		while(rs.next()){
			int rev=rs.getInt("reviewer_id");
			 sql="select user_name from users where user_id=?";
			String pp[]={String.valueOf(rev)};
			ResultSet r = DatabaseTool.query(sql, pp);
			String user_name="";
			while(r.next()){ user_name=r.getString("user_name");}
			Comment cm  = new Comment();
			cm.setAlgorithm_id(rs.getInt("algorithm_id"));
			cm.setReview_id(rs.getInt("review_id"));
			cm.setReviewer_id(rs.getInt("reviewer_id"));
			cm.setReview_content(rs.getString("review_content"));
			cm.setRespond_id(rs.getInt("respond_id"));
			cm.setReview_time(rs.getString("review_time"));
			cm.setFlag(rs.getString("flag"));
			cm.setReviewer_name(user_name);
//			System.out.println(user_name);
			comdetail.add(cm);
		}
		
		/*while(rs1.next()){
			Comment cm  = new Comment();
			cm.setAlgorithm_id(rs1.getInt("algorithm_id"));
			cm.setReview_id(rs1.getInt("review_id"));
			cm.setReviewer_id(rs1.getInt("reviewer_id"));
			cm.setReview_content(rs1.getString("review_content"));
			cm.setRespond_id(rs1.getInt("respond_id"));
			cm.setReview_time(rs1.getString("review_time"));
			cm.setFlag(rs1.getString("flag"));
			comdetail.add(cm);
		}*/
		return comdetail;
		
	}
	
	public ArrayList<Respond> getRespond(String userId) throws Exception{
	//	String sql="select * from respond where flag=0 and reviewer_id!=? and responder_id!=? and algorithm_id in (select algorithm_id from  algorithm_table where user_id=?)";
		String sql1="select * from respond where flag=0 and reviewer_id=?";
	    String p[]={userId,userId,userId};
	    String pd[]={userId};
	//    ResultSet rs = DatabaseTool.query(sql, p);
	    ResultSet rs1 = DatabaseTool.query(sql1, pd);
	    ArrayList<Respond>res = new ArrayList<Respond>();
	/*	while(rs.next()){
			Respond re  = new Respond();
			int rev=rs.getInt("reviewer_id");
			int red=rs.getInt("responder_id");
			sql="select user_name from users where user_id in(?,?)";
			String pp[]={String.valueOf(rev),String.valueOf(red)};
			ResultSet r = DatabaseTool.query(sql, pp);
			String reviewer="";
			String responder="";
			while(r.next()){ reviewer=r.getString("user_name"); responder=r.getString("user_name");}
		    re.setAlgorithm_id(rs.getInt("algorithm_id"));
		    re.setFlag(rs.getInt("flag"));
		    re.setRespond_content(rs.getString("respond_content"));
		    re.setRespond_id(rs.getInt("respond_id"));
		    re.setRespond_time(rs.getString("respond_time"));
		    re.setReview_id(rs.getInt("review_id"));
		    re.setReviewer_id(rs.getInt("reviewer_id"));
		    re.setResponer_name(responder);
		    re.setReviewer_name(reviewer);
		    res.add(re);
		}*/
		while(rs1.next()){
			Respond re  = new Respond();
		//	int rev=rs1.getInt("reviewer_id");
			int red=rs1.getInt("responder_id");
			String sql="select user_name from users where user_id in(?)";
			String pp[]={String.valueOf(red)};
			ResultSet r = DatabaseTool.query(sql, pp);
			String reviewer="";
			String responder="";
			while(r.next()){ reviewer=r.getString("user_name"); responder=r.getString("user_name");}
		    re.setAlgorithm_id(rs1.getInt("algorithm_id"));
		    re.setFlag(rs1.getInt("flag"));
		    re.setRespond_content(rs1.getString("respond_content"));
		    re.setRespond_id(rs1.getInt("respond_id"));
		    re.setRespond_time(rs1.getString("respond_time"));
		    re.setReview_id(rs1.getInt("review_id"));
		    re.setReviewer_id(rs1.getInt("reviewer_id"));
		    re.setResponer_name(responder);
		    re.setReviewer_name(reviewer                                                                                                                                                                                                              );
		    res.add(re);
		    
		}
		
		return res;
		
	}
	//获取某一算法的所有评论 并按时间降序排序；
	public  ArrayList<Comment> getAllComment(int algo_id) throws Exception{
		String sql="select *  from comment where algorithm_id=? ORDER BY review_time DESC ";
	    String p[]={""+algo_id};
		ResultSet rs = DatabaseTool.query(sql, p);
		ArrayList<Comment>comdetail = new ArrayList<Comment>();
		while(rs.next()){
			int rev=rs.getInt("reviewer_id");
			sql="select user_name from users where user_id=?";
			String pp[]={String.valueOf(rev)};
			ResultSet r = DatabaseTool.query(sql, pp);
			String user_name="";
			while(r.next()){ user_name=r.getString("user_name");}
			Comment cm  = new Comment();
			cm.setAlgorithm_id(rev);
			cm.setReview_id(rs.getInt("review_id"));
			cm.setReviewer_id(rs.getInt("reviewer_id"));
			cm.setReview_content(rs.getString("review_content"));
			cm.setReview_time(rs.getString("review_time"));
			cm.setFlag(rs.getString("flag"));
			cm.setReviewer_name(user_name);
			//System.out.println(user_name);
			comdetail.add(cm);
		}
		return comdetail;
	}
	//获取算法某一评论的所有回复，并按时间升序排序；
	public  ArrayList<Respond> getAllRespond(int algo_id) throws Exception{
		String sql = "select * from respond where algorithm_id=?";
		String[] p = {""+algo_id};
		ResultSet rs = DatabaseTool.query(sql, p);
		ArrayList<Respond> resdetail = new ArrayList<Respond>();
		while(rs.next()){
			//通过id获取评价人和回复人名字
			int rev=rs.getInt("reviewer_id");
			System.out.println(String.valueOf(rev));
			int res=rs.getInt("responder_id");
			String sql1="select user_name from users where user_id=?";
			String p1[]={String.valueOf(rev)};
			ResultSet r1 = DatabaseTool.query(sql1, p1);
			String sql2="select user_name from users where user_id=?";
			String p2[]={String.valueOf(res)};
			ResultSet r2 = DatabaseTool.query(sql2, p2);
			String reviewer_name="";
			String responder_name="";
			while(r1.next()){ reviewer_name=r1.getString("user_name");}
			while(r2.next()){ responder_name=r2.getString("user_name");}
			System.out.println(responder_name);
			Respond respond = new Respond();
			respond.setAlgorithm_id(rs.getInt("algorithm_id"));
			respond.setFlag(rs.getInt("flag"));
			respond.setRespond_content(rs.getString("respond_content"));
			respond.setRespond_id(rs.getInt("respond_id"));
			respond.setRespond_time(rs.getString("respond_time"));
			respond.setResponer_id(rs.getInt("responder_id"));
			respond.setResponer_name(responder_name);
			respond.setReview_id(rs.getInt("review_id"));
			respond.setReviewer_id(rs.getInt("reviewer_id"));
			respond.setReviewer_name(reviewer_name);
			resdetail.add(respond);
			}
		return resdetail;
	}
	
	public int updateFlag(int algorithm_id) throws Exception{
		String sql = "update comment set flag = 1 where algorithm_id = ?";
		String[] parameters = {Integer.toString(algorithm_id)};
		int result = DatabaseTool.update(sql, parameters);
		
		return result;
	}
	
	public static void main(String args[]) throws Exception{
		
		CommentService cm=new CommentService();
		String userId=Integer.toString(27);
		ArrayList<Comment> com=cm.getAllComment(userId);
		ArrayList<Respond> res=cm.getRespond(userId);
		int num=com.size()+res.size();
		System.out.println(num);
	}
}
