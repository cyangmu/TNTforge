package com.forge.entity;

public class ProductsSort {
	private int psortid;
	private String psortname;
	private int parentid;
	
	public ProductsSort() {
		super();
	}
	public ProductsSort(int psortid, String psortname, int parentid) {
		super();
		this.psortid = psortid;
		this.psortname = psortname;
		this.parentid = parentid;
	}
	public int getPsortid() {
		return psortid;
	}
	public void setPsortid(int psortid) {
		this.psortid = psortid;
	}
	public String getPsortname() {
		return psortname;
	}
	public void setPsortname(String psortname) {
		this.psortname = psortname;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	
	
	
}
