package com.reshop.app.admin.dao;

public class OrderDTO {
	//ORDER_TABLE 테이블의 컬럼들
	private int mng_num;
	private String userid;
	private int prodnum;
	private int ordercnt;
	private String orderdate;
	private String deli_phone;
	private String deli_addr;
	private String deli_addr_detail;
	private String deli_addr_etc;
	private String deli_name;
	private String cancel_refund;
	private int ordernum;
	
	//JOIN하여 사용한 테이블의 컬럼들
	private String deli_progress;
	private String prodname;
	private String invoicenum;
	private String deliver_date;
	private int price;
	
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDeliver_date() {
		return deliver_date;
	}
	public void setDeliver_date(String deliver_date) {
		this.deliver_date = deliver_date;
	}
	public String getInvoicenum() {
		return invoicenum;
	}
	public void setInvoicenum(String invoicenum) {
		this.invoicenum = invoicenum;
	}
	public String getDeli_phone() {
		return deli_phone;
	}
	public void setDeli_phone(String deli_phone) {
		this.deli_phone = deli_phone;
	}
	
	public String getCancel_refund() {
		return cancel_refund;
	}
	public void setCancel_refund(String cancel_refund) {
		this.cancel_refund = cancel_refund;
	}
	
	public String getDeli_progress() {
		return deli_progress;
	}
	public void setDeli_progress(String deli_progress) {
		this.deli_progress = deli_progress;
	}
	public String getProdname() {
		return prodname;
	}
	public void setProdname(String prodname) {
		this.prodname = prodname;
	}
	public int getMng_num() {
		return mng_num;
	}
	public void setMng_num(int mng_num) {
		this.mng_num = mng_num;
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
	public int getOrdercnt() {
		return ordercnt;
	}
	public void setOrdercnt(int ordercnt) {
		this.ordercnt = ordercnt;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getDeli_addr() {
		return deli_addr;
	}
	public void setDeli_addr(String deli_addr) {
		this.deli_addr = deli_addr;
	}
	public String getDeli_addr_detail() {
		return deli_addr_detail;
	}
	public void setDeli_addr_detail(String deli_addr_detail) {
		this.deli_addr_detail = deli_addr_detail;
	}
	public String getDeli_addr_etc() {
		return deli_addr_etc;
	}
	public void setDeli_addr_etc(String deli_addr_etc) {
		this.deli_addr_etc = deli_addr_etc;
	}
	public String getDeli_name() {
		return deli_name;
	}
	public void setDeli_name(String deli_name) {
		this.deli_name = deli_name;
	}
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	
	
}
