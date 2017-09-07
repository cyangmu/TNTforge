package com.forge.entity;

public class OrderItem {
	private int oitemid;
	private int count;
	private double price;
	private double total;
	private int orderid;
	private int pid;
	
	public OrderItem() {
		super();
	}
	public OrderItem(int oitemid, int count, double price, double total, int orderid, int pid) {
		super();
		this.oitemid = oitemid;
		this.count = count;
		this.price = price;
		this.total = total;
		this.orderid = orderid;
		this.pid = pid;
	}
	public int getOitemid() {
		return oitemid;
	}
	public void setOitemid(int oitemid) {
		this.oitemid = oitemid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}

	
	
}

