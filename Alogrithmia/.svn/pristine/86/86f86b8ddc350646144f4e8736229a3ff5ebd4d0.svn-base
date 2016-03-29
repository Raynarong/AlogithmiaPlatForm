package alg.base.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import org.sphx.api.SphinxMatch;

import alg.base.bean.Algorithm;
import alg.base.bean.Api;
import alg.base.bean.Comment;
import alg.base.bean.Type;
import alg.base.db.ConnectionPool;
import alg.base.db.DB;
import alg.base.util.DatabaseTool;
import alg.base.service.*;


public class AlgorithmService {

	
	
	public  ArrayList<Algorithm> getAllAlg() throws Exception {
		
		/*Connection conn = DB.creatConnetcion();
		String sql = "select * from algorithm_table ";
		PreparedStatement ps = ConnectionPool.prepare(conn, sql);
		ResultSet rs = ps.executeQuery();*/
		String sql = "select * from algorithm_table WHERE version IS NOT NULL";
		String p[] = {};
		ResultSet rs = DatabaseTool.query(sql, p);
		HashMap<Integer,String>hm = getAllUsers();
		ArrayList<Algorithm>arrAlg = new ArrayList<Algorithm>();
		while(rs.next()){
			Algorithm alg = new Algorithm();
			alg.setAlgorithm_describe(rs.getString("algorithm_describe"));
			alg.setAlgorithm_id(rs.getInt("algorithm_id"));
			alg.setAlgorithm_lang(rs.getString("algorithm_lang"));
			alg.setAlgorithm_name(rs.getString("algorithm_name"));
			alg.setAlgorithm_open(rs.getInt("algorithm_open"));
			alg.setAlgorithm_pay(rs.getInt("algorithm_pay"));
			alg.setAlgorithm_root(rs.getString("algorithm_root"));
			alg.setInput_instance(rs.getString("input_instance"));
			alg.setInput_instruction(rs.getString("input_instance"));
			alg.setInput_type(rs.getString("input_type"));
			alg.setOutput_instance(rs.getString("output_instance"));
			alg.setOutput_type(rs.getString("output_type"));
			alg.setSerial_number(rs.getString("serial_number"));
			alg.setVersion(rs.getString("version"));
			alg.setVist_times(rs.getInt("vist_times"));
			alg.setUser_id(rs.getInt("user_id"));
			alg.setUser_name(hm.get(alg.getUser_id()));
			arrAlg.add(alg);
		}
		return arrAlg;
	}
	

	public HashMap<Integer ,String > getAllUsers() throws Exception{
		HashMap  <Integer,String>hm = new HashMap<Integer,String>();
		/*Connection con = DB.creatConnetcion();
		String sql = "select * from users";
		PreparedStatement ps = ConnectionPool.prepare(con, sql);
		ResultSet rs = ps.executeQuery();*/
		String sql = "select * from users";
		String p[] = {};
		ResultSet rs = DatabaseTool.query(sql, p);
		while(rs.next()){
			String uname = rs.getString("user_name");
			int  uid = rs.getInt("user_id"); 
			hm.put(uid, uname);
		}
		return hm;
		
	}
	public  Algorithm getById(int id) throws Exception{
		Algorithm alg = new Algorithm();
		/*Connection con = DB.creatConnetcion();
		String sql = "select * from algorithm_table where algorithm_id=?";
		PreparedStatement ps = ConnectionPool.prepare(con, sql);
		
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();*/
		String sql = "select * from algorithm_table where algorithm_id=?";
		String p[] = {""+id};
		ResultSet rs = DatabaseTool.query(sql, p);
		while(rs.next()){
			alg.setAlgorithm_describe(rs.getString("algorithm_describe"));
			alg.setAlgorithm_id(rs.getInt("algorithm_id"));
			alg.setAlgorithm_lang(rs.getString("algorithm_lang"));
			alg.setAlgorithm_name(rs.getString("algorithm_name"));
			alg.setAlgorithm_open(rs.getInt("algorithm_open"));
			alg.setAlgorithm_pay(rs.getInt("algorithm_pay"));
			alg.setAlgorithm_root(rs.getString("algorithm_root"));
			alg.setInput_instance(rs.getString("input_instance"));
			alg.setInput_instruction(rs.getString("input_instruction"));
			alg.setInput_type(rs.getString("input_type"));
			alg.setOutput_instance(rs.getString("output_instance"));
			alg.setOutput_type(rs.getString("output_type"));
			alg.setSerial_number(rs.getString("serial_number"));
			alg.setVersion(rs.getString("version"));
			alg.setVist_times(rs.getInt("vist_times"));
			alg.setUser_id(rs.getInt("user_id"));
			HashMap<Integer,String>hm = (new UserService()).getAllUsers();
			String userName = hm.get(rs.getInt("user_id"));
			alg.setUser_name(userName);
			System.out.println(userName);
		}
		return alg;
		
	}
	public  ArrayList<String> getTagsById(int id) throws Exception{
		ArrayList<String>tagsArr = new ArrayList<String>();
		/*Connection con = DB.creatConnetcion();
		String sql = "select * from algorithm_tags where algorithm_id=?";
		PreparedStatement ps = ConnectionPool.prepare(con, sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();*/
		String sql = "select * from algorithm_tags where tag_id in (select tag_id from algo_tag where algorithm_id=?)";
		String p[] = {""+id};
		ResultSet rs = DatabaseTool.query(sql, p);
		while(rs.next()){
			String tag_name = rs.getString("tag_name");
			tagsArr.add(tag_name);
		}
		return tagsArr;
	}
	
	public  ArrayList<Api> getApiById(int id) throws Exception{
		ArrayList<Api>apiArr = new ArrayList<Api>();
		/*Connection con = DB.creatConnetcion();
		String sql = "select * from algorithm_api where algorithm_id=?";
		PreparedStatement ps = ConnectionPool.prepare(con, sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		当前端jQuery发起AJAX请求的时候，数据库的sql语句写错它在后台是并不会报错的，只是无法返回结果，这就导致很多时候查不到哪里出错
		*
		*/
		String sql = "select * from algorithm_api where algorithm_id=?";
		String p[] = {""+id};
		ResultSet rs = DatabaseTool.query(sql, p);
		while(rs.next()){
			Api a = new Api();
			a.setAlgorithm_id(rs.getInt("algorithm_id"));
			a.setApi_addr(rs.getString("api_addr"));
			a.setApi_content(rs.getString("api_content"));
			a.setLang_type(rs.getString("lang_type"));
			a.setUsage_id(rs.getInt("usage_id"));
			apiArr.add(a);
		}
		return apiArr;
	}
	public ArrayList<Comment>getComById(int id) throws Exception{
		HashMap<Integer,Comment>comHm = new HashMap<Integer,Comment>();//评论集合
		ArrayList<Comment>repArr = new ArrayList<Comment>();//对评论的回复集合
		ArrayList<Comment>comArr = new ArrayList<Comment>();//返回的最终结果
		HashMap<Integer ,String >hm = getAllUsers();
		/*Connection con = DB.creatConnetcion();
		String sql = "select * from comment where algorithm_id=?";
		PreparedStatement ps = ConnectionPool.prepare(con, sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		*/
		String sql = "select * from comment where algorithm_id=?";
		String p[] = {""+id};
		ResultSet rs = DatabaseTool.query(sql, p);
		while(rs.next()){
			Comment com = new Comment();
			com.setAlgorithm_id(rs.getInt("algorithm_id"));
			com.setFlag(rs.getString("flag"));
			com.setRespond_id(rs.getInt("respond_id"));
			com.setReview_content(rs.getString("review_content"));
			com.setReview_id(rs.getInt("review_id"));
			com.setReview_time(rs.getString("review_time"));
			com.setReviewer_id(rs.getInt("reviewer_id"));
			com.setReviewer_name(hm.get(com.getReviewer_id()));
			if(com.getFlag().equals("0")){        //未读标记
				comHm.put(com.getReview_id(), com);
			}else{
				repArr.add(com);
			}
		}
		//将对评论的回复放到评论的属性里面去
		for(Comment c:repArr){
			int resId = c.getRespond_id();
			comHm.get(resId).getChildCom().add(c);
		}
		Set<Integer>keySet = comHm.keySet();
		for(int i:keySet){
			comArr.add(comHm.get(i));
		}
		return comArr;
	}
	
public  ArrayList<Algorithm> getAllAlg(String userId) throws Exception {
		
		/*Connection conn = DB.creatConnetcion();
		String sql = "select * from algorithm_table ";
		PreparedStatement ps = ConnectionPool.prepare(conn, sql);
		ResultSet rs = ps.executeQuery();*/
		String sql = "select * from algorithm_table where user_id=? ";
		String p[] = {userId};
		ResultSet rs = DatabaseTool.query(sql, p);
		HashMap<Integer,String>hm = getAllUsers();
		ArrayList<Algorithm>arrAlg = new ArrayList<Algorithm>();
		while(rs.next()){
			Algorithm alg = new Algorithm();
			alg.setAlgorithm_describe(rs.getString("algorithm_describe"));
			alg.setAlgorithm_id(rs.getInt("algorithm_id"));
			alg.setAlgorithm_lang(rs.getString("algorithm_lang"));
			alg.setAlgorithm_name(rs.getString("algorithm_name"));
			alg.setAlgorithm_open(rs.getInt("algorithm_open"));
			alg.setAlgorithm_pay(rs.getInt("algorithm_pay"));
			alg.setAlgorithm_root(rs.getString("algorithm_root"));
			alg.setInput_instance(rs.getString("input_instance"));
			alg.setInput_instruction(rs.getString("input_instance"));
			alg.setInput_type(rs.getString("input_type"));
			alg.setOutput_instance(rs.getString("output_instance"));
			alg.setOutput_type(rs.getString("output_type"));
			alg.setSerial_number(rs.getString("serial_number"));
			alg.setVersion(rs.getString("version"));
			alg.setVist_times(rs.getInt("vist_times"));
			alg.setAlgorithm_type(rs.getString("type_id"));
			alg.setUser_id(rs.getInt("user_id"));
			alg.setUser_name(hm.get(alg.getUser_id()));
			System.out.println(rs.getInt("user_id"));
			arrAlg.add(alg);
		}
		return arrAlg;
	}
	
	
	public static void main(String[] args) throws Exception{
		
		
		String a=Integer.toString(27);
		AlgorithmService as = new AlgorithmService();
		ArrayList<Algorithm>arrAlg = as.getAllAlg(a);
		
		/*int id = 1;
		Connection con = DB.creatConnetcion();
		String sql = "select * from comment where algorithm_id=?";
		PreparedStatement ps = ConnectionPool.prepare(con, sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while(rs.next()){
			Comment com = new Comment();
			com.setAlgorithm_id(rs.getInt("algorithm_id"));
			com.setFlag(rs.getString("flag"));
			com.setRespond_id(rs.getInt("respond_id"));
			com.setReview_content(rs.getString("review_content"));
			com.setReview_id(rs.getInt("review_id"));
			com.setReview_time(rs.getString("review_time"));
			com.setReviewer_id(rs.getInt("reviewer_id"));
			System.out.println(com.getReview_time());
	}*/
	}
	//获得分类标签
	public  ArrayList<Type> getAlgType() throws Exception{
		String sql = "select distinct type_name , type_id from algorithm_type";
		String p[] = {};
		ResultSet rs = DatabaseTool.query(sql, p);
		ArrayList<Algorithm> typeName = new ArrayList<Algorithm>();
		ArrayList<Type> typeArr = new ArrayList<Type>();
		while(rs.next()){
			Type type = new Type();
			type.setType_id(rs.getInt("type_id"));
			type.setType_name(rs.getString("type_name"));
			String sql2 = "select count(type_id) from algorithm_table where  type_id=?";
			String p2[] = {type.getType_id()+""};
			ResultSet rs2 = DatabaseTool.query(sql2, p2);
			while(rs2.next()){
				int count = rs2.getInt("count(type_id)");
//				System.out.println(count);
				type.setCount(count);
			}
			typeArr.add(type);
		}
		return typeArr;
		
	}
	/**
	 * 按分类搜索
	 * @param typeName
	 * @return
	 * @throws Exception
	 */
	public  ArrayList<Algorithm> getAlgByType(String typeName) throws Exception{
		ArrayList<Algorithm> arrAlg = new ArrayList<Algorithm>();
		String sql = "select * from algorithm_type,algorithm_table,users where algorithm_type.type_id=? and algorithm_type.type_id=algorithm_table.type_id and algorithm_table.user_id=users.user_id" ;
		String p[] = {typeName};
		ResultSet rs = DatabaseTool.query(sql, p);
		while (rs.next()) {
			Algorithm alg = new Algorithm();
			alg.setAlgorithm_describe(rs.getString("algorithm_describe"));
			alg.setAlgorithm_id(rs.getInt("algorithm_id"));
			alg.setAlgorithm_lang(rs.getString("algorithm_lang"));
			alg.setAlgorithm_name(rs.getString("algorithm_name"));
			alg.setAlgorithm_open(rs.getInt("algorithm_open"));
			alg.setAlgorithm_pay(rs.getInt("algorithm_pay"));
			alg.setAlgorithm_root(rs.getString("algorithm_root"));
			alg.setInput_instance(rs.getString("input_instance"));
			alg.setInput_instruction(rs.getString("input_instance"));
			alg.setInput_type(rs.getString("input_type"));
			alg.setOutput_instance(rs.getString("output_instance"));
			alg.setOutput_type(rs.getString("output_type"));
			alg.setSerial_number(rs.getString("serial_number"));
			alg.setVersion(rs.getString("version"));
			alg.setVist_times(rs.getInt("vist_times"));
			alg.setAlgorithm_type(rs.getString("type_name"));
			alg.setUser_id(rs.getInt("user_id"));
			alg.setUser_name(rs.getString("user_name"));
			arrAlg.add(alg);
			
		}
		return arrAlg;

	}
//通过算法名字查询算法 renee	
	public  Algorithm getByName(String algoName,String user_id) throws Exception{
		Algorithm alg = new Algorithm();
		String sql = "select * from algorithm_table,users where algorithm_name=? and algorithm_table.user_id=? and algorithm_table.user_id=users.user_id";
		String p[] = {algoName,user_id};
		ResultSet rs = DatabaseTool.query(sql, p);
		while(rs.next()){
			alg.setAlgorithm_describe(rs.getString("algorithm_describe"));
			alg.setAlgorithm_id(rs.getInt("algorithm_id"));
			alg.setAlgorithm_lang(rs.getString("algorithm_lang"));
			alg.setAlgorithm_name(rs.getString("algorithm_name"));
			alg.setAlgorithm_open(rs.getInt("algorithm_open"));
			alg.setAlgorithm_pay(rs.getInt("algorithm_pay"));
			alg.setAlgorithm_root(rs.getString("algorithm_root"));
			alg.setInput_instance(rs.getString("input_instance"));
			alg.setInput_instruction(rs.getString("input_instruction"));
			alg.setInput_type(rs.getString("input_type"));
			alg.setOutput_instance(rs.getString("output_instance"));
			alg.setOutput_type(rs.getString("output_type"));
			alg.setSerial_number(rs.getString("serial_number"));
			alg.setVersion(rs.getString("version"));
			alg.setVist_times(rs.getInt("vist_times"));
			//alg.setAlgorithm_type(rs.getString("algorithm_type"));
			alg.setUser_id(rs.getInt("user_id"));
			alg.setUser_name(rs.getString("user_name"));
		}
		return alg;
	}
}
