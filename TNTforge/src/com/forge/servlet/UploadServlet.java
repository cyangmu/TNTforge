package com.forge.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Decoder;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String img = request.getParameter("img");
        String[] pics = img.split(",");//0为类型 1为数据
        PrintWriter out = response.getWriter();
        String type = null;
        if (pics[0].indexOf("image/jpeg") > 0) {
            type = ".jpg";
        } else if (pics[0].indexOf("image/gif") > 0) {
            type = ".gif";
        } else if (pics[0].indexOf("image/png") > 0) {
            type = ".png";
        } else {
        	
        }
        String imgname = GenerateImage(pics[1], type,"/Users/liyunjian/Downloads/TNTforge/WebContent/images/onloadproduct/");
        out.print(imgname);
	}
	public static String GenerateImage(String imgStr, String imgType, String filePath) {   //对字节数组字符串进行Base64解码并生成图片
        String str = "false";
 		if (imgStr == null) //图像数据为空
            return str;
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            //Base64解码
            byte[] b = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {//调整异常数据
                    b[i] += 256;
                }
            }
            //根据时间生成图片名称
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmsssss");
            String imgFilePath = filePath + simpleDateFormat.format(new Date()) + imgType;
            //新生成的图片
            OutputStream out = new FileOutputStream(imgFilePath);
            out.write(b);
            out.flush();
            out.close();
            return imgFilePath;
        } catch (Exception e) {
            return str;
        }
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
