package alg.base.service;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import alg.base.util.DatabaseTool;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class UserCenterService {
 public JSONArray traderList(String buyer_sellerId) throws Exception{
	 JSONArray trade=new JSONArray();
	String  sql="select * from trade where  buyer_id=? or seller_id=?";
	String p[]={buyer_sellerId,buyer_sellerId};
	int a=1;
	ResultSet rs = DatabaseTool.query(sql, p);
	while(rs.next()){
		JSONObject hm=new JSONObject();
		hm.put("id",a);
		hm.put("algo",rs.getInt("algorithm_id"));
		hm.put("tradeMoney", rs.getDouble("trade_money"));
		hm.put("tradeTime", rs.getString("trade_time"));
		System.out.println(rs.getDouble("trade_money"));
		a++;
		trade.add(hm);	
	}
	 
	 return trade;	 
 }
 
 public JSONArray creditList(String buyerId) throws Exception{
	 JSONArray credit=new JSONArray();
	 String sql="select *from trade where buyer_id=?";
	 String p[]={buyerId};
	 int a=1;
	 ResultSet rs=DatabaseTool.query(sql, p);
	 while(rs.next()){
		 JSONObject jo=new JSONObject();
		 String algoId=Integer.toString(rs.getInt("algorithm_id"));
	 	String algoName=this.algoName(algoId);
		    jo.put("id",a);
			jo.put("algorithm_name",algoName);
			jo.put("trade_credit", rs.getDouble("trade_money"));
			jo.put("trade_time", rs.getString("trade_time"));
			
		    a++;
		    credit.add(jo);
	 }
	 System.out.println(credit.toJSONString());
   return credit;
 }
 
 public String algoName(String algoId) throws Exception{
	 String sql="select algorithm_name from algorithm_table  where algorithm_id=?";
	 String p[]={algoId};
	 String algoName=null;
	 ResultSet rs=DatabaseTool.query(sql, p);
	 while(rs.next()){
		  algoName=rs.getString("algorithm_name");
		 
	 }
		 return algoName;
 }
 
 public int querytotal(String userId)throws Exception {
	 String sql="select sum(vist_times) total from algorithm_table where user_id=? group by user_id ";
	 String p[]={userId};
	 ResultSet rs=DatabaseTool.query(sql, p);
	 int result=0;
	 while(rs.next()){
		 result=rs.getInt("total");	 
		 System.out.println(result);
	 }
	 return result;
	 
	 
 }
 public static void main(String args[]) throws Exception{

		UserCenterService a=new UserCenterService();
		int b=a.querytotal("27");
		JSONArray js=a.creditList("27");
 }
}
