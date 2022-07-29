package com.reshop.app.board.dao;

public class FileDTO {
	private String systemname;
	private String orgname;
	private int notice_num;
	private int news_num;
	private int quest_num;
	
	public int getNews_num() {
		return news_num;
	}
	public void setNews_num(int news_num) {
		this.news_num = news_num;
	}
	public int getQuest_num() {
		return quest_num;
	}
	public void setQuest_num(int quest_num) {
		this.quest_num = quest_num;
	}
	
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
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
}
