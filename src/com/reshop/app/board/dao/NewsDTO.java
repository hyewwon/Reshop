package com.reshop.app.board.dao;

public class NewsDTO {
	private int news_num;
	private String news_title;
	private String news_contents;
	private int news_cnt;
	private String regdate;

	public int getNews_num() {
		return news_num;
	}

	public void setNews_num(int news_num) {
		this.news_num = news_num;
	}

	public String getNews_title() {
		return news_title;
	}

	public void setNews_title(String news_title) {
		this.news_title = news_title;
	}

	public String getNews_contents() {
		return news_contents;
	}

	public void setNews_contents(String news_contents) {
		this.news_contents = news_contents;
	}

	public int getNews_cnt() {
		return news_cnt;
	}

	public void setNews_cnt(int news_cnt) {
		this.news_cnt = news_cnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
