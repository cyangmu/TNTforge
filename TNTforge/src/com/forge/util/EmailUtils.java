package com.forge.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.forge.entity.User;

public class EmailUtils {
    /** 
     * 注册成功后,向用户发送帐户激活链接的邮件 
     * @param user 未激活的用户 
     */  
	
    /** 
     * 发送重设密码链接的邮件 
     */  
	 // 初始化参数  
	    private static Properties props;  
	    // 发件人地址  
	    private static InternetAddress sendMan = null;  
	    // 发件人的邮箱地址  
	    private static String userName = "506181880@qq.com";  
	    // 发件人的密码  
	    private static String password = "qhdxmkqaxjhqbjif";
	    static {  
	    	props = new Properties();  
	    	// 指定协议  
	    	props.put("mail.transport.protocol", "smtp");  
	    	// 主机 smtp.qq.com  
	    	props.put("mail.smtp.host", "smtp.qq.com");  
	    	// 端口  
	    	props.put("mail.smtp.port", 465);  
	    	// 用户密码认证  
	    	props.put("mail.smtp.auth", "true");  
	    	// 调试模式  
	    	props.put("mail.debug", "true"); 
	    	props.put("mail.smtp.ssl.enable", "true");
	    	
	    	try {  
	    		//创建地址对象  
	    		sendMan = new InternetAddress(userName);  
	    	} catch (AddressException e) {  
	    		throw new RuntimeException(e);  
	    	}  
	    }  
    public static void sendResetPasswordEmail(User user) {  
        try {  
            // 创建邮件会话  
            Session session = Session.getInstance(props);  
            // 创建邮件对象  
            MimeMessage msg = new MimeMessage(session);  
            // 设置发件人  
            msg.setFrom(sendMan);  
            // 设置邮件收件人  
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getUemail()));  
            // 标题  
            msg.setSubject("找回您的帐户与密码");  
            // 发送时间  
            msg.setSentDate(new Date());  
            // 发送内容  
            msg.setText("要使用新的密码, 请使用以下链接启用密码:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(user) +"'>点击重新设置密码</a>");  
            // 5. 发送  
            Transport trans = session.getTransport();  
            trans.connect(userName, password);  
            trans.sendMessage(msg, msg.getAllRecipients());  
            trans.close();  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
    }
