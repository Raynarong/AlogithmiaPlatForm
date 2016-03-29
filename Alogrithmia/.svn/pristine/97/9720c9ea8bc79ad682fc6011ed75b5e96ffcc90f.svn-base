/*
 * coreseek algorithm search 
 * by Ren linan
 */
package alg.base.service;
import alg.base.bean.*;
import alg.base.util.*;
import alg.base.action.*;
import alg.base.service.*;

import org.apache.struts2.ServletActionContext;
import org.sphx.api.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;

public class SearchAlgoService {
	
	public ArrayList<Algorithm> searchAlgo(String searchAlgo){
		
		/*
	     * 获取页面上传的 查询 关键字
	     */
	    HttpServletRequest request = ServletActionContext.getRequest();
	    //String s = request
	   
	    //System.out.println(s);
		
	    /*
		 * 配置coreseek 的searchd服务器和查询规则。
		 */
		StringBuffer search =  new StringBuffer();
		//String host = "192.168.0.147";
		String host = ConfigurationConstant.HOST;
	    int port = ConfigurationConstant.PORT;
//		String host = "202.197.61.235";
//	    int port = 9312;
	    int mode = SphinxClient.SPH_MATCH_ANY;
	    String index = "*";
	    int offset = 0;
	    int limit = 20;
	    int sortMode = SphinxClient.SPH_SORT_RELEVANCE;
	    String sortClause = "";
	    String groupBy = "";
	    String groupSort = "";

	    SphinxClient cl = new SphinxClient();
	    ArrayList<Algorithm> arrAlg = new ArrayList<Algorithm>();
	    try {
			cl.SetServer ( host, port );
			cl.SetWeights ( new int[] { 100, 1 } );
	        cl.SetMatchMode ( mode );
	        cl.SetLimits ( offset, limit );
	        cl.SetSortMode ( sortMode, sortClause );
	        
	        search.append(searchAlgo);
	        
	        if ( groupBy.length()>0 )
	            cl.SetGroupBy ( groupBy, SphinxClient.SPH_GROUPBY_ATTR, groupSort );

	       SphinxResult res = cl.Query(search.toString(), index);
	       
	       //System.out.println(res.matches.length);
	       
	       if ( res.matches.length==0 )
	        {
	            System.err.println ( "Error: " + cl.GetLastError() );
	            System.out.println("no");
	            /*try {
					arrAlg = as.getAllAlg();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}*/
	            //System.exit ( 1 );
	            //System.exit(0);
	            return null;
	        }
	       for( int i=0; i<res.matches.length; i++ ){
	    	   Algorithm alg = new Algorithm();
	    	   usersbean users = new usersbean();
	    	   String sql = "select * from algorithm_table,users where algorithm_id=? and algorithm_table.user_id=users.user_id and version IS NOT NULL";
	    	   System.out.println(sql);
	    	   
	    	   SphinxMatch info = res.matches[i];
	    	   String[] p = {Long.toString(info.docId)};
	    	   
	    	   //System.out.println(info.docId);
	    	   
	    	   try {
				
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
					alg.setInput_instruction(rs.getString("input_instance"));
					alg.setInput_type(rs.getString("input_type"));
					alg.setOutput_instance(rs.getString("output_instance"));
					alg.setOutput_type(rs.getString("output_type"));
					alg.setSerial_number(rs.getString("serial_number"));
					alg.setVersion(rs.getString("version"));
					alg.setVist_times(rs.getInt("vist_times"));
					alg.setUser_id(rs.getInt("user_id"));
					String userName = rs.getString("user_name");
					alg.setUser_name(userName);
					arrAlg.add(alg);
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       }
	       for(Algorithm algs:arrAlg){
	    	   System.out.println(algs.getAlgorithm_name());
	       }
		} catch (SphinxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arrAlg;
	}
}
