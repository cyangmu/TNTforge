package com.forge.util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class DBPool {
//静态变量
	private static DBPool db=null;
	private DataSource ds=new ComboPooledDataSource("mysqlConnection");
//构造方法
	private DBPool(){
	}
//调用公共方法判断实例化
	public static DBPool getInstance(){
		if (null==db) {
			db=new DBPool();
		}
		return db;
	}
	public Connection getconn(){
		try {
			return ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
