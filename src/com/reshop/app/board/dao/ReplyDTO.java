package com.reshop.app.board.dao;

public class ReplyDTO {
	private int replynum;
	private String re_contents;
	private String userid;
	private int notice_num;
	private int quest_num;
	private int news_num;
	
	
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public String getRe_contents() {
		return re_contents;
	}
	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public int getQuest_num() {
		return quest_num;
	}
	public void setQuest_num(int quest_num) {
		this.quest_num = quest_num;
	}
	public int getNews_num() {
		return news_num;
	}
	public void setNews_num(int news_num) {
		this.news_num = news_num;
	}
	
}