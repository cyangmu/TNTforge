package com.forge.entity;

public class OrderForm {
	
	private int orderid;
	private String ordertimes;
	private String orderstates;
	private double ordertotal;
	private int aid;
	private int uid;
	
	
	public OrderForm() {
		super();
	}
	public OrderForm(int orderid, String ordertimes, String orderstates, double ordertotal, int aid, int uid) {
		super();
		this.orderid = orderid;
		this.ordertimes = ordertimes;
		this.orderstates = orderstates;
		this.ordertotal = ordertotal;
		this.aid = aid;
		this.uid = uid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getOrdertimes() {
		return ordertimes;
	}
	public void setOrdertimes(String ordertimes) {
		this.ordertimes = ordertimes;
	}
	public String getOrderstates() {
		return orderstates;
	}
	public void setOrderstates(String orderstates) {
		this.orderstates = orderstates;
	}
	public double getOrdertotal() {
		return ordertotal;
	}
	public void setOrdertotal(double ordertotal) {
		this.ordertotal = ordertotal;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	
}
