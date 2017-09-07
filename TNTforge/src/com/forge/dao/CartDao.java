package com.forge.dao;

import java.util.List;

public class CartDao extends BaseDao<String>{
	public String checkCart(String name){
		String list = checkGoods("select pprice from products where pname = ?",name);
		System.out.print(list);
		return list;
		
		
	}
	public String checkGooddes(String name){
		String list = checkGoodes("select pprice from products where pname = ?",name);
		System.out.print(list);
		return list;
		
		
	}
}
