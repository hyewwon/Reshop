package com.reshop.app.admin.product.dao;

public class CartDTO {
	private int ordernum;
	private String userid;
	private int prodnum;
	private int prodcnt;
	
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getProdnum() {
		return prodnum;
	}
	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}
	public int getProdcnt() {
		return prodcnt;
	}
	public void setProdcnt(int prodcnt) {
		this.prodcnt = prodcnt;
	}
	
	
}
