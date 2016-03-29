package alg.base.db;

import java.sql.Connection;   
import java.sql.PreparedStatement;



public class ConnectionPoolTest {   
  
    public static void main(String[] args) throws Exception {   
/*        ConnectionPool connPool = new ConnectionPool("com.mysql.jdbc.Driver",   
        		"jdbc:mysql://127.0.0.1:3306/algorithmia", "root", "123456");
        	//	"jdbc:oracle:thin:@127.0.0.1:1521:ORCL", "scott", "tiger"); 
*/        
    	ConnectionPool connPool = new ConnectionPool();
 //     connPool.createPool();  
        Connection conn = connPool.getConnection();  
        PreparedStatement ps = connPool.prepare(conn, "");
/*        connPool.closeConnectionPool();   
        connPool.setTestTable("users"); */  
    }   
       
}  
