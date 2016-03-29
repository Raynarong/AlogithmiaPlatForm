package alg.base.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import alg.base.bean.Comment;
import alg.base.bean.Respond;
import alg.base.service.CommentService;
import alg.base.util.FlushTool;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;

public class PushAction {
	 int itemsDisNum=5; 

	 HttpServletRequest request = ServletActionContext.getRequest();
	 HttpSession session = request.getSession();

public void allNum() throws Exception{
	int num=0;
	CommentService cm=new CommentService();
	System.out.println(session.getAttribute("id"));
     if(session.getAttribute("id")!=null){
	

	String userId=Integer.toString((Integer)session.getAttribute("id"));
	ArrayList<Comment> com=cm.getAllComment(userId);
	ArrayList<Respond> res=cm.getRespond(userId);
	num=com.size()+res.size();
	System.out.println("size1:"+com.size()+"size2:"+res.size());

	String number=String.valueOf(num);
	FlushTool.flushJsonRecord(number);
}
}
public void fetchList() throws Exception{
	int num1;
	int num2;
	CommentService cm=new CommentService();
	String userId=Integer.toString((Integer)session.getAttribute("id"));
	ArrayList<Comment> com=cm.getAllComment(userId);
	ArrayList<Comment> dis=new ArrayList<Comment>();
	if(com.size()>5){
	for(int i=0;i<itemsDisNum;i++){
		dis.add(com.get(i));
	}
	}
	else{dis=com;};
	ArrayList<Respond> res=cm.getRespond(userId);
	ArrayList<Respond> reDis=new ArrayList<Respond>();
	if(com.size()>5){
	for(int i=0;i<itemsDisNum;i++){
		reDis.add(res.get(i));	
	}
	}
	else{
		reDis=res;
		};
	JSONObject jobj = new JSONObject();
	jobj.put("comment",dis);
	jobj.put("respond", reDis);
	String jstr = jobj.toString();
	FlushTool.flushJsonRecord(jstr);

	
}


}
