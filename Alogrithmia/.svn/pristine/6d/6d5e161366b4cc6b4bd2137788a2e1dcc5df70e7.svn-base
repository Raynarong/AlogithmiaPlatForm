package alg.base.util;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import alg.base.bean.usersbean;
import alg.base.service.UserService;


public class EmailUtils {
	private static final String FROM = "18684958145@163.com";
	/**
	 * 发送重设密码链接的邮件
	 */
	public static void sendResetPasswordEmail(usersbean user) {
		Session session = getSession();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setSubject("找回您的帐户与密码");
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(FROM));
			message.setRecipient(RecipientType.TO, new InternetAddress(user.getUser_mail()));
			message.setContent("要使用新的密码, 请使用以下链接启用密码:<br/><a href='" + new GenerateLinkUtils().generateResetPwdLink(user) +"'>点击重新设置密码</a>"+"<br/>tips:本邮件超过三十分钟将会失效，需要重新申请","text/html;charset=utf-8");
			// 发送邮件
			Transport.send(message);
//			System.out.println(request.getRemoteAddr());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Session getSession() {
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.163.com");
		props.setProperty("mail.smtp.port", "25");
		props.setProperty("mail.smtp.auth", "true");
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(FROM, "123456haha");
			}
			
		});
		return session;
	}
	
	public static void main(String args[])throws Exception{
		UserService user=new UserService();

        EmailUtils eu=new EmailUtils();
		usersbean us=user.findUserbyEmail("845269573@qq.com");
		eu.sendResetPasswordEmail(us);
	
	}

}
