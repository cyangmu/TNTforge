package com.forge.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.forge.entity.Product;
import com.forge.util.DBPool;

public class ProductDao {
	public boolean addProduct(Product products){
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("insert into products (pname,pprice,pcount,pimg,pdescript) values (?,?,?,?,?)");
			ptmt.setString(1, products.getPname());
			ptmt.setDouble(2, products.getPprice());
			ptmt.setInt(3, products.getPcount());
			ptmt.setString(4, products.getPimg());
			ptmt.setString(5, products.getPdescript());
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
	
	public List<Product> selProduct(){
		Connection conn = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		List<Product> listPs = new ArrayList<Product>();
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("select * from products");
			rs = ptmt.executeQuery();
			while (rs.next()) {
				Product ps = new Product();
				ps.setPid(rs.getInt("pid"));
				ps.setPname(rs.getString("pname"));
				ps.setPprice(rs.getDouble("pprice"));
				ps.setPcount(rs.getInt("pcount"));
				ps.setPimg(rs.getString("pimg"));
				ps.setPdescript(rs.getString("pdescript"));
				listPs.add(ps);
			}
			return listPs;
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
	
	public boolean delProduct(int pid){
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("delete from products where pid = ?");
			ptmt.setInt(1, pid);
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
	
	public boolean upProduct(int id,String name,double price,int count,String img,String describe){
		Connection conn = null;
		PreparedStatement ptmt = null;
		try {
			conn = DBPool.getInstance().getconn();
			ptmt = conn.prepareStatement("update products set pname = ?,pprice = ?,pcount = ?, pimg = ?, pdescript = ? where pid = ?");
			ptmt.setString(1, name);
			ptmt.setDouble(2, price);
			ptmt.setInt(3, count);
			ptmt.setString(4, img);
			ptmt.setString(5, describe);
			ptmt.setInt(6, id);
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
}
