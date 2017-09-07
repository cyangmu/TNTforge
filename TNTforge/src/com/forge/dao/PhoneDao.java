package com.forge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.forge.entity.Product;
import com.forge.util.DBPool;

public class PhoneDao {
	public String selPhone(String uname){
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String telnum = null;
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("select utel from user where uname = ?");
			ptmt.setString(1, uname);
			rs = ptmt.executeQuery();
			while(rs.next()){
				telnum = rs.getString("utel");
			}
			return telnum;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if (rs != null) {
				try {
					rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (ptmt != null) {
				try {
					ptmt.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
}
