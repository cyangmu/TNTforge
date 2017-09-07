package com.forge.dao;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.forge.entity.User;
import com.forge.util.DBPool;



public class BaseDao<T> {
	static Connection conn=null;
	static PreparedStatement stat=null;
    ResultSet rs=null;
	Class<T> clazz;
	private StringBuffer rsarr;
	
	@SuppressWarnings("unchecked")
	public BaseDao(){
		clazz=(Class<T>)((ParameterizedType)this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}
	
	public void closeALL(Connection conn,PreparedStatement stat,ResultSet rs){
			try {
				if (rs!=null) 
					rs.close();
				if (stat!=null) 
					stat.close();
				if (conn!=null) {
					conn.close();
				}
			} catch ( SQLException e) {
				e.printStackTrace();
			}
		}
	
	public int executeUpdate(String preparedSql,Object[] param){
		int num=0;
		try {
			conn=DBPool.getInstance().getconn();
			stat=conn.prepareStatement(preparedSql);
			if (param!=null) {
				for (int i = 0; i < param.length; i++) {
					stat.setObject(i+1, param[i]);
				}
			}
			num = stat.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeALL(conn, stat, null);
		}
		return num;
	}
    
	public String checkGoods(String sql,String name){
		Connection conn  = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		String arr = null;
		try {
			conn = DBPool.getInstance().getconn();
			stat = conn.prepareStatement("select * from products where pname=?");
			 stat.setString(1, name);
			 rs = stat.executeQuery();
			 
			  while(rs.next()){
			  arr= Integer.toString(rs.getInt(3));
			  
			  System.out.println(arr);
			 
			  
			  }
			  
			 
			  //System.out.print(rsarr.toString());
			  
		}catch(Exception e){
			e.printStackTrace();
		}
				
		return arr;
	}
	
	public String checkGoodes(String sql,String name){
		Connection conn  = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		String arr = null;
		try {
			conn = DBPool.getInstance().getconn();
			stat = conn.prepareStatement("select * from products where pname=?");
			 stat.setString(1, name);
			 rs = stat.executeQuery();
			 
			  while(rs.next()){
			  arr= rs.getString(6);
			  
			  System.out.println(arr);
			 
			  
			  }
			  
			 
			  //System.out.print(rsarr.toString());
			  
		}catch(Exception e){
			e.printStackTrace();
		}
				
		return arr;
	}
	
	public List<T> executeQuery(String sql, Object[] param){
		Connection conn  = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<T>();
		try {
			conn = DBPool.getInstance().getconn();
			stat = conn.prepareStatement(sql);
			if (param != null) {
				for (int i = 0; i < param.length; i++) {
					stat.setObject(i + 1, param[i]);
				}
			}
			rs = stat.executeQuery();
			ResultSetMetaData rsmd= rs.getMetaData();
		    int columuCount = rsmd.getColumnCount();//3
		    System.out.println(columuCount);
			while(rs.next()){
				//将查询到的rs中的记录存入对应的实体类中。
				T t = (T) clazz.newInstance();//调用T的构造方法，生成一个对象。 User user = new User();
				//通过rs中的列名 = entity的属性名，向熟悉中赋值。
				for (int i = 0; i < columuCount; i++) {
					Field f = clazz.getDeclaredField(rsmd.getColumnName(i+1));
					f.setAccessible(true);	
					f.set(t, rs.getObject(i+1));
				}
				list.add(t);
//				User user = new User();
//				user.setId(rs.getInt("id"));
//				user.setUserName(rs.getString("username"));
//				userList.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeALL(conn, stat, null);
		}
		return list;
	}

	
	public List<T> executeQuery(String sql){
		Connection conn  = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<T>();
		try {
			conn = DBPool.getInstance().getconn();
			System.out.println("连接成功");
			stat = conn.prepareStatement(sql);
			rs = stat.executeQuery();
			ResultSetMetaData rsmd= rs.getMetaData();
		    int columuCount = rsmd.getColumnCount();//3
			while(rs.next()){
				//将查询到的rs中的记录存入对应的实体类中。
				T t = (T) clazz.newInstance();//调用T的构造方法，生成一个对象。 User user = new User();
				//通过rs中的列名 = entity的属性名，向熟悉中赋值。
				for (int i = 0; i < columuCount; i++) {
					Field f = clazz.getDeclaredField(rsmd.getColumnName(i+1));
					f.setAccessible(true);	
					f.set(t, rs.getObject(i+1));
				}
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeALL(conn, stat, null);
		}
		return list;
	}


	public User findUserByNameOrEmail(String userName){
		User user=null;
		try {
			conn=DBPool.getInstance().getconn();
			String sql="select uemail from user where uname='"+userName+"'";
			stat=conn.prepareStatement(sql);
			rs=stat.executeQuery();
			while (rs.next()) {
				user=new User();
				user.setUemail(rs.getString("uemail"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	} 
	
	public User Updatepwd(String password,String userName){
		User user=null;
		try {
			conn=DBPool.getInstance().getconn();
			String sql="update user set upassword=? where uname=?";
			stat=conn.prepareStatement(sql);
			stat.setString(1, password);
			stat.setString(2, userName);
			int rs=stat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	} 

}


