package alg.base.util;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.comet4j.core.CometConnection;
import org.comet4j.core.CometContext;
import org.comet4j.core.CometEngine;
import org.comet4j.core.event.ConnectEvent;
import org.comet4j.core.listener.ConnectListener;

import alg.base.bean.Comment;
import alg.base.bean.Respond;
import alg.base.service.CommentService;

public class cometNumberListener extends ConnectListener{/*
	private static final String CHANNEL = "hello";
	public boolean handleEvent(ConnectEvent anEvent){
		System.out.println("fgvgggg");
		CometConnection conn = anEvent.getConn();
		 HttpServletRequest request= conn.getRequest();
	      HttpSession session = request.getSession();
	      Thread helloAppModule = new Thread(new HelloAppModule(session,conn), "Sender App Module");
	      try{
	    	  String userId=Integer.toString((Integer)session.getAttribute("id"));
	    	  System.out.println("id是："+session.getAttribute("id"));
	    	  helloAppModule.start();
	      } 
	      catch(Exception e){
	    	  if( helloAppModule.isAlive()){
	   		   helloAppModule.stop();
	   	   }  
	      } 
	      if(session.getAttribute("user")==null){
	    	  helloAppModule.stop(); 
	      }
        return  true;
	}
	
    class HelloAppModule implements Runnable  {
   	 private HttpSession session;
   	 private CometConnection conn;
   	 public HelloAppModule(HttpSession session,CometConnection conn){
   		 this.session=session;
   		 this.conn=conn;
   	 }
           public void run()  {
                   while (true) {
                           
                           int num=0;
                           String userId="";
                           CometEngine engine = CometContext.getInstance().getEngine();
                        //   engine.addConnectListener(new JoinListener());
                         try{   userId=Integer.toString((Integer)session.getAttribute("id"));
                           System.out.println("id is:"+session.getAttribute("id"));
                         }
                         catch(Exception e){
                        	 
                         }
                           CommentService cm=new CommentService();
                       	ArrayList<Comment> com = null;
							try {
								com = cm.getAllComment(userId);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
                       	ArrayList<Respond> res = null;
							try {
								res = cm.getRespond(userId);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
                       	num=com.size()+res.size();
                       	System.out.println("size1的值:"+com.size()+"size2:"+res.size());
                       	String number=String.valueOf(num);
                          // engine.sendTo(CHANNEL,engine.getConnection(request),num);
                       	 engine.sendTo(CHANNEL,conn,num);
                      // 	 engine.sendToAll(CHANNEL, num);
                       
                    
                       	
  	
                           System.out.println("剩余："+number);
                           
                           try {
                               Thread.sleep(10000);
                       } catch (Exception ex) {
                               ex.printStackTrace();
                       }
                   }
           }
   }
	

*/
	public boolean handleEvent(ConnectEvent anEvent){return false;}
}
