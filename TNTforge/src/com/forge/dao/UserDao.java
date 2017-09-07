package com.forge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.jws.soap.SOAPBinding.Use;

import com.forge.entity.Product;
import com.forge.entity.User;
import com.forge.entity.UserAddress;
import com.forge.util.DBPool;

public class UserDao extends BaseDao<User> {
	public int addUser(User user) {
		return executeUpdate("insert into user(uname,upassword,ubirthday,ugender,utel,uemail) values (?,?,?,?,?,?)",
				new Object[] {user.getUname(), user.getUpassword(),user.getUbirthday(),user.getUgender(),user.getUtel(),user.getUemail() });
	}
	public boolean checkUser(User user){
		List<User> list=executeQuery("select uname,upassword from user where uname=? and upassword=?", new Object[]{user.getUname(),user.getUpassword()});
		return list.size()>0?true:false;
	}
	
	public boolean checkUserName(User user){
		List<User> list = executeQuery("select uname from user where uname = ?", new Object[]{user.getUname()});
		return list.size() > 0 ? true:false;
	}
	public User findUserByName(String password,String userName) {
		return super.Updatepwd(password, userName);
	}
	public User findUserByNameOrEmail(String userNameOrEmail) {
		// TODO Auto-generated method stub
		return super.findUserByNameOrEmail(userNameOrEmail);
	}
	public int addAddress(UserAddress userAddress) {
		return executeUpdate("insert into useraddress(province,city,county,extra,receiver,receivertel,tag) values (?,?,?,?,?,?,?)",
				new Object[] {userAddress.getProvince(), userAddress.getCity(),userAddress.getCounty(),userAddress.getExtra(),userAddress.getReceiver(),userAddress.getReceivertel() ,userAddress.getTag()});
	}
	
	public String stateUser(String uname){
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		String state = null;
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("select uemail from user where uname = ?");
			ptmt.setString(1, uname);
			rs = ptmt.executeQuery();
			while (rs.next()) {
				state = rs.getString("uemail");
			}
			return state;
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
		return state;
	}
	
	public boolean changeState(int uid){
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("update user set uemail = ? where uid = ?");
			ptmt.setString(1, "no");
			ptmt.setInt(2, uid);
			ptmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
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
		return false;
	}
	
	public boolean lockState(int uid){
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("update user set uemail = ? where uid = ?");
			ptmt.setString(1, "yes");
			ptmt.setInt(2, uid);
			ptmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
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
		return false;
	}
	
	public List<User> selUser(){
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		List<User> userlist = new ArrayList<User>();
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("select uid,uname,upassword,uemail from user");
			rs = ptmt.executeQuery();
			while (rs.next()) {
				User us = new User();
				us.setUid(rs.getInt("uid"));
				us.setUname(rs.getString("uname"));
				us.setUpassword(rs.getString("upassword"));
				us.setUemail(rs.getString("uemail"));
				userlist.add(us);
			}
			return userlist;
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
