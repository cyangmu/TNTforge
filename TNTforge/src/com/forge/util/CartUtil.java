package com.forge.util;

import java.util.List;

import com.forge.dao.CartDao;

public class CartUtil {
	
    public String checkGoods(String name){
    	
    	String gPrices  =  new CartDao().checkCart(name);
    	return gPrices;
    }
    
    public String checkGoodde(String name){
    	
    	String gPrices  =  new CartDao().checkGooddes(name);
    	return gPrices;
    }
}
