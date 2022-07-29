package com.reshop.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class NoticeDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public NoticeDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public int getNoticeCnt() {
		return sqlsession.selectOne("Notice.getNoticeCnt");
	}

	public List<NoticeDTO> getNoticeList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<NoticeDTO> noticeList = sqlsession.selectList("Notice.getNoticeList",datas);
		return noticeList;
	}

	public boolean insertNotice(NoticeDTO notice) {
		return 1==sqlsession.insert("Notice.insertNotice",notice);
	}

	public int getSeq(String userid) {
		return (Integer)sqlsession.selectList("Notice.getSeq",userid).get(0);
	}

	public NoticeDTO getDetail(int notice_num) {
		return sqlsession.selectOne("Notice.getDetail",notice_num);
	}

	public void updateNotice_cnt(int notice_num) {
		sqlsession.update("Notice.updateNotice_cnt",notice_num);
	}

	public boolean updateNotice(NoticeDTO notice) {
		return 1 == sqlsession.update("Notice.updateNotice",notice);
	}

	public boolean insertReply(ReplyDTO reply) {
		return 1==sqlsession.insert("Notice.insertReply",reply);
	}

	public List<ReplyDTO> getReplys(int notice_num) {
		List<ReplyDTO> replys = sqlsession.selectList("Notice.getReplys",notice_num);
		return replys;
	}

	public boolean modifyReply(int replynum, String re_contents) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("replynum", replynum);
		datas.put("re_contents", re_contents);
		return 1==sqlsession.update("Notice.modifyReply",datas);
	}

	public boolean deleteReply(int replynum) {
		return 1 == sqlsession.delete("Notice.deleteReply",replynum);
	}

	public boolean deleteReplyAll(int notice_num) {
		return 0!=sqlsession.delete("Notice.deleteReplyAll",notice_num);
	}

	public int getReplyCnt(int notice_num) {
		return (Integer)sqlsession.selectOne("Notice.getReplyCnt", notice_num);
	}

	public boolean deleteNotice(int notice_num) {
		return 1==sqlsession.delete("Notice.deleteNotice",notice_num);
	}
}













