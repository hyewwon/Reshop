package com.reshop.app.board.dao;

public class QuestDTO {
	private int quest_num;
	private String quest_title;
	private String quest_contents;
	private String userid;
	private String regdate;
	private int quest_cnt;
	
	public int getQuest_num() {
		return quest_num;
	}
	public void setQuest_num(int quest_num) {
		this.quest_num = quest_num;
	}
	public String getQuest_title() {
		return quest_title;
	}
	public void setQuest_title(String quest_title) {
		this.quest_title = quest_title;
	}
	public String getQuest_contents() {
		return quest_contents;
	}
	public void setQuest_contents(String quest_contents) {
		this.quest_contents = quest_contents;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getQuest_cnt() {
		return quest_cnt;
	}
	public void setQuest_cnt(int quest_cnt) {
		this.quest_cnt = quest_cnt;
	}

}