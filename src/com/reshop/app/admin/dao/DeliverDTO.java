package com.reshop.app.admin.dao;

public class DeliverDTO {
	//DELIVERY_TABLE 테이블의 컬럼들
	int deliverynum;
	String invoicenum;
	String deli_progress;
	String deliver_date;
	int mng_num;
	
	//JOIN하여 사용한 테이블의 컬럼들
	int prodnum;
	String prodname;
	String userid;
	String deli_name;
	
	public String getDeli_name() {
		return deli_name;
	}
	public void setDeli_name(String deli_name) {
		this.deli_name = deli_name;
	}
	public int getProdnum() {
		return prodnum;
	}
	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}
	public String getProdname() {
		return prodname;
	}
	public void setProdname(String prodname) {
		this.prodname = prodname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getDeliverynum() {
		return deliverynum;
	}
	public void setDeliverynum(int deliverynum) {
		this.deliverynum = deliverynum;
	}
	public String getDeli_progress() {
		return deli_progress;
	}
	public String getInvoicenum() {
		return invoicenum;
	}
	public void setInvoicenum(String invoicenum) {
		this.invoicenum = invoicenum;
	}
	public void setDeli_progress(String deli_progress) {
		this.deli_progress = deli_progress;
	}
	public String getDeliver_date() {
		return deliver_date;
	}
	public void setDeliver_date(String deliver_date) {
		this.deliver_date = deliver_date;
	}
	public int getMng_num() {
		return mng_num;
	}
	public void setMng_num(int mng_num) {
		this.mng_num = mng_num;
	}
	
	
}
