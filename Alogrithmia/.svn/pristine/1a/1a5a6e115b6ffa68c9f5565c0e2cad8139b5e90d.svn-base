package alg.base.action;

import java.util.ArrayList;
import java.util.Date;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;





import org.apache.struts2.ServletActionContext;

import alg.base.service.UserCenterService;
import alg.base.util.FlushTool;

import com.opensymphony.xwork2.ActionSupport;

public class tradeAction extends ActionSupport {
private int trade_id;
private int algorithm_id;
private int buyer_id;
private int seller_id;
private double trade_money;
private Date trade_time;
public int getTrade_id() {
	return trade_id;
}
public void setTrade_id(int trade_id) {
	this.trade_id = trade_id;
}
public int getAlgorithm_id() {
	return algorithm_id;
}
public void setAlgorithm_id(int algorithm_id) {
	this.algorithm_id = algorithm_id;
}
public int getBuyer_id() {
	return buyer_id;
}
public void setBuyer_id(int buyer_id) {
	this.buyer_id = buyer_id;
}
public int getSeller_id() {
	return seller_id;
}
public void setSeller_id(int seller_id) {
	this.seller_id = seller_id;
}
public double getTrade_money() {
	return trade_money;
}
public void setTrade_money(double trade_money) {
	this.trade_money = trade_money;
}
public Date getTrade_time() {
	return trade_time;
}
public void setTrade_time(Date trade_time) {
	this.trade_time = trade_time;
}

HttpServletRequest request = ServletActionContext.getRequest();
HttpSession session = request.getSession();
 public void showTraderecord() throws Exception{
	UserCenterService ucenter=new UserCenterService(); 
	JSONArray userdata=ucenter.traderList(Integer.toString((Integer)session.getAttribute("id")));
	System.out.println(Integer.toString((Integer)session.getAttribute("id")));
	
	/*String jstr =JSON.toJSONString(userdata);
	System.out.println(jstr);*/
	FlushTool.flushJsonRecord(userdata);
 }
 public void showCreditRecord() throws Exception{
		UserCenterService ucenter=new UserCenterService(); 
		JSONArray Centerdata=ucenter.creditList(Integer.toString((Integer)session.getAttribute("id")));
		System.out.println(Integer.toString((Integer)session.getAttribute("id")));
		
		/*String jstr =JSON.toJSONString(userdata);
		System.out.println(jstr);*/
		FlushTool.flushJsonRecord(Centerdata);
	 }
 public void totalVisitor()throws Exception {
	 UserCenterService ucenter=new UserCenterService();
	 int totalVis=ucenter.querytotal(Integer.toString((Integer)session.getAttribute("id")));
	 FlushTool.flushJsonRecord(totalVis);
 }

}
