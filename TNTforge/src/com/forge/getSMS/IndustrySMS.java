package com.forge.getSMS;



/**
 * 验证码通知短信接口
 * 
 * @ClassName: IndustrySMS
 * @Description: 验证码通知短信接口
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String to = "1322";
	private static String smsContent = "【Forge】您的验证码是"+ getConfirmationCode() +"，30分钟输入有效。";
	
	public static int getConfirmationCode(){
		int confirmationCode = (int) (Math.random()*1000000);
		return confirmationCode;
	}
	
	public static String getPhone(String phoneNum){
		to = phoneNum;
		return to;
	}

	/**
	 * 验证码通知短信
	 */
	public static void execute()
	{
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + smsContent
				+ HttpUtil.createCommonParam();

		// 提交请求
		String result = HttpUtil.post(url, body);
		System.out.println("result:" + System.lineSeparator() + result);
	}
}
