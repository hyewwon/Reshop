package com.reshop.app.admin.product.dao;

import java.sql.Date;

public class ProductDTO {
	private int prodnum;
	private int price;
	private String prodname;
	private String prodstate;
	private String prodsize;
	private String prodexplain;
	private String classify; // (분류)일반/업사이클링
	private String classify_prod; // (악세서리, 옷, 가방)
	private String brand; // (악세서리, 옷, 가방)
	private Date uploadtime;
	private String sug_age;
	private String prod_color;
	private int prodcnt;
	
	//파일정보를 가져오기 위한 컬럼들
	private String systemname;
	private String orgname;

	public String getSystemname() {
		return systemname;
	}

	public void setSystemname(String systemname) {
		this.systemname = systemname;
	}

	public String getOrgname() {
		return orgname;
	}

	public void setOrgname(String orgname) {
		this.orgname = orgname;
	}

	public Date getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}

	public int getProdnum() {
		return prodnum;
	}

	public void setProdnum(int prodnum) {
		this.prodnum = prodnum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getProdname() {
		return prodname;
	}

	public void setProdname(String prodname) {
		this.prodname = prodname;
	}

	public String getProdstate() {
		return prodstate;
	}

	public void setProdstate(String prodstate) {
		this.prodstate = prodstate;
	}

	public String getProdsize() {
		return prodsize;
	}

	public void setProdsize(String prodsize) {
		this.prodsize = prodsize;
	}


	public String getProdexplain() {
		return prodexplain;
	}

	public void setProdexplain(String prodexplain) {
		this.prodexplain = prodexplain;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getClassify_prod() {
		return classify_prod;
	}

	public void setClassify_prod(String classify_prod) {
		this.classify_prod = classify_prod;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getSug_age() {
		return sug_age;
	}

	public void setSug_age(String sug_age) {
		this.sug_age = sug_age;
	}

	public String getProd_color() {
		return prod_color;
	}

	public void setProd_color(String prod_color) {
		this.prod_color = prod_color;
	}

	public int getProdcnt() {
		return prodcnt;
	}

	public void setProdcnt(int prodcnt) {
		this.prodcnt = prodcnt;
	}
	
	
	
	
	
}
