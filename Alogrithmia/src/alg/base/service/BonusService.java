package alg.base.service;

import java.sql.Connection;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import alg.base.bean.Algorithm;
import alg.base.bean.Bonus;

import alg.base.util.DatabaseTool;

public class BonusService {
	public ArrayList<Bonus> getBonusInfo() throws Exception{
		String sql = "select * from bonus ORDER BY bonus_time desc";
		String p[]={};
		ResultSet rs = DatabaseTool.query(sql, p); 
		ArrayList<Bonus>arrBs = new ArrayList<Bonus>();
		while(rs.next()){
			Bonus bs  = new Bonus();
			bs.setAlgorithm_id(rs.getInt("algorithm_id"));
			bs.setBonus_id(rs.getInt("bonus_id"));
			bs.setBonus_instruction(rs.getString("bonus_instruction"));
			bs.setBonus_pride(rs.getDouble("bonus_pride"));
			bs.setBonus_time(rs.getString("bonus_time"));
			bs.setBonus_title(rs.getString("bonus_title"));
			HashMap<Integer,String>hm = (new UserService()).getAllUsers();
			String userName = hm.get(rs.getInt("user_id"));
//			System.out.println(userName);
			bs.setUser_name(userName);
//			System.out.println(bs.getBonus_time());
			arrBs.add(bs);
		}
		
		return arrBs;
	}
	
	public ArrayList<Bonus> getBonusInfo(String userId) throws Exception{
		String sql = "select * from bonus where user_id=? ORDER BY bonus_time DESC";
		String p[] = {userId};
		ResultSet rs = DatabaseTool.query(sql, p);
		ArrayList<Bonus>arrBs = new ArrayList<Bonus>();
		while(rs.next()){
			Bonus bs  = new Bonus();
			bs.setAlgorithm_id(rs.getInt("algorithm_id"));
			bs.setBonus_id(rs.getInt("bonus_id"));
			bs.setBonus_instruction(rs.getString("bonus_instruction"));
			bs.setBonus_pride(rs.getDouble("bonus_pride"));
			bs.setBonus_title(rs.getString("bonus_title"));
			bs.setBonus_time(rs.getString("bonus_time"));
			HashMap<Integer,String>hm = (new UserService()).getAllUsers();
			String userName = hm.get(rs.getInt("user_id"));
			bs.setUser_name(userName);
			arrBs.add(bs);
		}
		
		return arrBs;
	}
	public Bonus getBonusById(int bonusId) throws Exception{
		String sql = "select * from bonus where bonus_id=?";
		String p[] = {bonusId+""};
		ResultSet rs = DatabaseTool.query(sql, p);
		Bonus bs  = new Bonus();
		while(rs.next()){
			bs.setAlgorithm_id(rs.getInt("algorithm_id"));
			bs.setBonus_id(rs.getInt("bonus_id"));
			bs.setBonus_instruction(rs.getString("bonus_instruction"));
			bs.setBonus_pride(rs.getDouble("bonus_pride"));
			bs.setBonus_title(rs.getString("bonus_title"));
			bs.setBonus_time(rs.getString("bonus_time"));
			bs.setUser_id(rs.getInt("user_id"));
			HashMap<Integer,String>hm = (new UserService()).getAllUsers();
			String userName = hm.get(rs.getInt("user_id"));
//			System.out.println(bs.getBonus_title());
			bs.setUser_name(userName);
		}
		return bs;
	}
//向数据库插入回复数据 renee
	public int addRespondBonus(int bonusId,int algorithmId,int questionUserId,String answerUserId,String answerTime) throws Exception{
		String sql = "insert into bonus_respond(bonus_id,algorithm_id,questionUser_id,answerUser_id,answer_time) values (?,?,?,?,?)";
		String[] p ={bonusId+"",algorithmId+"",questionUserId+"",answerUserId,answerTime};
		int result = DatabaseTool.update(sql, p);
		return result;
	}
/*
 * 通过user_id查询算法列表，返回算法集合
 * @param userId
 * @return arrAlg
 * @throws Exception
 * renee
 */
	public  ArrayList<Algorithm> getAllAlg(String userId) throws Exception {
		
		/*Connection conn = DB.creatConnetcion();
		String sql = "select * from algorithm_table ";
		PreparedStatement ps = ConnectionPool.prepare(conn, sql);
		ResultSet rs = ps.executeQuery();*/
		String sql = "select * from algorithm_table where user_id=? and version IS NOT NULL";
		String p[] = {userId};
		ResultSet rs = DatabaseTool.query(sql, p);
		AlgorithmService as = new AlgorithmService();
		HashMap<Integer,String>hm = as.getAllUsers();
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
	
//通过悬赏回复表的bonus_id获得algorithm_id,再通过algorithm_id查询算法表 renee	
	public ArrayList<Algorithm> getRespondBonus(int bonus_id) throws Exception{
		String sql = "SELECT distinct algorithm_id from bonus_respond where bonus_id=? ORDER BY answer_time desc";
		String p[] = {bonus_id+""};
		AlgorithmService as = new AlgorithmService();
		ResultSet rs = DatabaseTool.query(sql, p);
		ArrayList<Algorithm>arrAlg = new ArrayList<Algorithm>();
		while(rs.next()){
			int algoId = rs.getInt("algorithm_id");
			Algorithm alg = as.getById(algoId);
			arrAlg.add(alg);
		}
		return arrAlg;
	}
	
//通过关键字搜索悬赏 renee
	public ArrayList<Bonus> getBonusInfoBywords(String searchWord) throws Exception{
		String sql = "select * from bonus,users where bonus.user_id=users.user_id and bonus_title like ? or bonus_instruction like ? or user_name like ?";
		String p[]={"%"+searchWord+"%", "%"+searchWord+"%","%"+searchWord+"%"};
		ResultSet rs = DatabaseTool.query(sql, p); 
		ArrayList<Bonus>arrBs = new ArrayList<Bonus>();
		while(rs.next()){
			Bonus bs  = new Bonus();
			bs.setAlgorithm_id(rs.getInt("algorithm_id"));
			bs.setBonus_id(rs.getInt("bonus_id"));
			bs.setBonus_instruction(rs.getString("bonus_instruction"));
			bs.setBonus_pride(rs.getDouble("bonus_pride"));
			bs.setBonus_time(rs.getString("bonus_time"));
			bs.setBonus_title(rs.getString("bonus_title"));
			HashMap<Integer,String>hm = (new UserService()).getAllUsers();
			String userName = hm.get(rs.getInt("user_id"));
//			System.out.println(userName);
			bs.setUser_name(userName);
			System.out.println(bs.getBonus_title());
			arrBs.add(bs);
		}
		
		return arrBs;
	}
public static void main(String[] args) throws Exception{
		
		
		String a=Integer.toString(27);
		BonusService as = new BonusService();
		ArrayList<Bonus>arrAlg = as.getBonusInfo();
		ArrayList<Bonus>arrAlg1 = as.getBonusInfo("27");
	}
}
