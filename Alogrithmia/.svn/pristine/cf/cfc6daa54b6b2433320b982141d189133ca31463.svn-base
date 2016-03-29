package alg.base.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;



import alg.base.bean.usersbean;
import alg.base.service.UserService;

/**
 * 生成帐户激活、重新设置密码的链接
 */
public class GenerateLinkUtils {
	private   HttpServletRequest request = ServletActionContext.getRequest();
	private  HttpServletResponse response=ServletActionContext.getResponse();
	private   String CHECK_CODE = "checkCode";
	private   String path = request.getContextPath();
	private   String basePath = request.getScheme() + "://"
             + request.getServerName() + ":"
             + request.getServerPort() + path + "/";
  
	
	/**
	 * 生成重设密码的链接
	 * @throws Exception 
	 */
	public  String generateResetPwdLink(usersbean user) throws Exception {
		   String resetPassHref = basePath + "checkLink.action?sid="
           + digitalSignature(user) +"&username="+user.getUser_name();
		System.out.println(resetPassHref);
		return resetPassHref;
	}
	
	/**
	 * 生成验证帐户的MD5校验码
	 * @param user  要激活的帐户
	 * @return 将用户名和密码组合后，通过md5加密后的16进制格式的字符串
	 * @throws Exception 
	 */
	public  String digitalSignature(usersbean  user) throws Exception {
		   String secretKey = UUID.randomUUID().toString(); // 密钥
           Timestamp outDate = new Timestamp(System.currentTimeMillis() + 30 * 60 * 1000);// 30分钟后过期
           long date = outDate.getTime() / 1000 * 1000;// 忽略毫秒数  mySql 取出时间是忽略毫秒数的
           String sql="update users set outDate=?,validataCode=? where user_id=?";
   		String p[]={outDate+"",secretKey,user.getUser_id()+""};
   		int a=DatabaseTool.update(sql, p);
        System.out.println("   UserName>>>> "+user.getUser_name());
        String key =user.getUser_name() + "$" + date + "$" + secretKey;
        System.out.println(" key>>>"+key);
        String digitalSignature = md5(key);// 数字签名
        String digitalSignature2 = new GenerateLinkUtils().md5(key);
        System.out.println("1:"+digitalSignature);
        
	    return digitalSignature;
	}
	
	/**
	 * 验证校验码是否和注册时发送的验证码一致
	 * @param user 要激活的帐户
	 * @param checkcode 注册时发送的校验码
	 * @return 如果一致返回true，否则返回false
	 *//*
	public static boolean verifyCheckcode(usersbean  user,ServletRequest request) {
		String checkCode = request.getParameter(CHECK_CODE);
		return generateCheckcode(user).equals(checkCode);
	}
*/
	public  String md5(String string) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("md5");
			md.update(string.getBytes());
			byte[] md5Bytes = md.digest();
			return bytes2Hex(md5Bytes);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	private  String bytes2Hex(byte[] byteArray)
	{
		StringBuffer strBuf = new StringBuffer();
		for (int i = 0; i < byteArray.length; i++)
		{
			if (byteArray[i] >= 0 && byteArray[i] < 16)
			{
				strBuf.append("0");
			}
			strBuf.append(Integer.toHexString(byteArray[i] & 0xFF));
		}
		return strBuf.toString();
	}
	public static void main(String args[])throws Exception{
		UserService user=new UserService();

        GenerateLinkUtils test=new GenerateLinkUtils();
		usersbean us=user.findUserbyEmail("845269573@qq.com");
		String a=test.generateResetPwdLink(us);
		String b=test.digitalSignature(us);
	}
}

