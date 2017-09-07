package com.forge.entity;

public class Products {
	private int pid;
	private String pname;
	private int pcount;
	private double pprice;
	private String pdescript;
	private int pstock;
	private int psortid;
	
	public Products() {
		super();
	}
	public Products(int pid, String pname, int pcount, double pprice, String pdescript, int pstock, int psortid) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pcount = pcount;
		this.pprice = pprice;
		this.pdescript = pdescript;
		this.pstock = pstock;
		this.psortid = psortid;
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
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public double getPprice() {
		return pprice;
	}
	public void setPprice(double pprice) {
		this.pprice = pprice;
	}
	public String getPdescript() {
		return pdescript;
	}
	public void setPdescript(String pdescript) {
		this.pdescript = pdescript;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public int getPsortid() {
		return psortid;
	}
	public void setPsortid(int psortid) {
		this.psortid = psortid;
	}
	
	



}
