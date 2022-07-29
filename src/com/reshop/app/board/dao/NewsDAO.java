package com.reshop.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class NewsDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	public NewsDAO() {
		sqlsession = factory.openSession(true);
	}

	public int getNewsCnt() {
		return sqlsession.selectOne("News.getNewsCnt");
	}

	public Object getNewsList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<NewsDTO> donaList = sqlsession.selectList("News.getNewsList", datas);
		return donaList;
	}

	public boolean insertNews(NewsDTO news) {
		return 1 == sqlsession.insert("News.insertNews", news);
	}

	public boolean deleteNews(int news_num) {
		return 1 == sqlsession.delete("News.deleteNews", news_num);
	}

	public NewsDTO getDetail(int news_num) {
		return sqlsession.selectOne("News.getDetail", news_num);
	}

	public boolean updateNews(NewsDTO news) {
		return 1 == sqlsession.update("News.updateNews", news);
	}

	public boolean insertReply(ReplyDTO reply) {
		return 1 == sqlsession.insert("News.insertReply", reply);
	}

	public boolean newsModifyReply(int replynum, String re_contents) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("replynum", replynum);
		datas.put("re_contents", re_contents);
		return 1==sqlsession.update("News.newsModifyReply",datas);
	}

	public boolean newsDeleteReply(int replynum) {
		return 1 == sqlsession.delete("News.newsDeleteReply",replynum);
	}

	public List<ReplyDTO> getNewsReplys(int news_num) {
		List<ReplyDTO> replys = sqlsession.selectList("News.getNewsReply", news_num);
		return replys;
	}

}
