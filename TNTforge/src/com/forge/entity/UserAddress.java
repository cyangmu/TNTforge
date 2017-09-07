package com.forge.entity;

public class UserAddress {
	private int aid;
	private String province;
	private String city;
	private String county;
	private String extra;
	private String receiver;
	private String receivertel;
	private int uid;
	private String tag;
	
	
	
	public UserAddress() {
		super();
	}
	public UserAddress( String province, String city, String county, String extra, String receiver,
			String receivertel ,String tag) {
		super();
		
		this.province = province;
		this.city = city;
		this.county = county;
		this.extra = extra;
		this.receiver = receiver;
		this.receivertel = receivertel;
		this.tag = tag;
		
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getExtra() {
		return extra;
	}
	public void setExtra(String extra) {
		this.extra = extra;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getReceivertel() {
		return receivertel;
	}
	public void setReceivertel(String receivertel) {
		this.receivertel = receivertel;
	}
}
