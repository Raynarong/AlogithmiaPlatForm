package com.web.file;

import java.io.ByteArrayOutputStream;  
import java.io.File;  
import java.io.IOException;  
import java.io.InputStream;  
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpEntity;  
import org.apache.http.HttpResponse;  
import org.apache.http.HttpStatus;  
import org.apache.http.ParseException;  
import org.apache.http.client.HttpClient;  
import org.apache.http.client.methods.HttpPost;  
import org.apache.http.entity.mime.MultipartEntity;  
import org.apache.http.entity.mime.content.FileBody;  
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;  
import org.apache.http.util.EntityUtils; 
import org.apache.struts2.ServletActionContext;

import alg.base.util.DatabaseTool;



public class FileClient {
	 //file1��file2��ͬһ���ļ����� filepath�Ǹ��ļ���ָ����·��      
    public String SubmitPost(String url, String filename1, String filepath) throws Exception{  
        
        HttpClient httpclient = new DefaultHttpClient();  
        httpclient.getParams().setIntParameter("http.socket.timeout", 30000);
		try {

			HttpPost httppost = new HttpPost(url);

			FileBody bin = new FileBody(new File(filepath + File.separator
					+ filename1));

			StringBody comment = new StringBody(filename1);

			MultipartEntity reqEntity = new MultipartEntity();

			HttpSession session = ServletActionContext.getRequest()
					.getSession();
			String user = (String) session.getAttribute("user");

			reqEntity.addPart(user, bin);
			reqEntity.addPart(user, comment);
/*            if(!url.contains("ReceiveData"))
            {
            	reqEntity.addPart(user, bin);
                reqEntity.addPart(user, comment);
            }
            else
            {
				int id = (Integer)ServletActionContext.getRequest().getSession().getAttribute("algorithm_id");
            	String sql = "select * from algorithm_table where algorithm_id=?";
            	String parameters[] = {String.valueOf(id)};
            	ResultSet rs = DatabaseTool.query(sql, parameters);
            	String algorithm_jar = "";
            	String sendData = user;
            	if(rs != null)
            	{
            		while(rs.next())
            		{
            			algorithm_jar = rs.getString("algorithm_jar");
            		}
            	}
            	if(algorithm_jar != null)
            	{
            		sendData += ";" + algorithm_jar;
            	}
            	reqEntity.addPart(sendData, bin);
                reqEntity.addPart(sendData, comment);
            }*/
            
            
            httppost.setEntity(reqEntity);
              
            HttpResponse response = httpclient.execute(httppost);  
            
                  
            int statusCode = response.getStatusLine().getStatusCode();  
              
                  
            if(statusCode == HttpStatus.SC_OK){  
                      
                System.out.println("链接成功.....");  
                  
                HttpEntity resEntity = response.getEntity();  
                  
                  
//                System.out.println(EntityUtils.toString(resEntity));//httpclient�Դ�Ĺ������ȡ�������  
                  
                String result = EntityUtils.toString(resEntity);  
                  
//                System.out.println(resEntity.getContent());     
  
                EntityUtils.consume(resEntity);  
                
                return result;
            }  
            else    
            {
            	return "Error";
            }	
            } catch (ParseException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();
                return e.getMessage();
            } catch (IOException e) {  
                // TODO Auto-generated catch block  
                e.printStackTrace();
                return e.getMessage();
            }
        }  
      
      
    /** 
     * @param args 
     * @throws Exception 
     */  
    public static void main(String[] args) throws Exception {  
        // TODO Auto-generated method stub  
          
        FileClient FileClient = new FileClient();  
          
        FileClient.SubmitPost("http://202.197.61.235:8080/JsonRpc1/ReceiveData",   
                "JavaAdd.java" , "C://test");  
/*        FileClient.SubmitPost("http://192.168.0.56:8080/JsonRpc1/ReceiveData",   
                "JavaAdd.java" , "D://test"); */
    }  
}

