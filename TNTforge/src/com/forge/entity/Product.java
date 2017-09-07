package com.forge.entity;

public class Product {
	private int pid;
	private String pname;
	private double pprice;
	private int pcount;
	private String pimg;
	private String pdescript;
	
	public Product(int pid, String pname, double pprice, int pcount, String pimg, String pdescript) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pcount = pcount;
		this.pimg = pimg;
		this.pdescript = pdescript;
	}
	
	public Product(String pname, double pprice, int pcount, String pimg) {
		super();
		this.pname = pname;
		this.pprice = pprice;
		this.pcount = pcount;
		this.pimg = pimg;
	}

	public Product() {
		super();
	}

	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getPprice() {
		return pprice;
	}
	public void setPprice(double pprice) {
		this.pprice = pprice;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getPdescript() {
		return pdescript;
	}
	public void setPdescript(String pdescript) {
		this.pdescript = pdescript;
	}
}
