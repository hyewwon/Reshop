package com.reshop.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class QuestDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public QuestDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public int getQuestCnt() {
		return sqlsession.selectOne("Quest.getQuestCnt");
	}

	public List<QuestDTO> getQuestList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<QuestDTO> questList = sqlsession.selectList("Quest.getQuestList",datas);
		return questList;
	}

	public boolean insertQuest(QuestDTO quest) {
		return 1==sqlsession.insert("Quest.insertQuest",quest);
	}

	public int getSeq(String userid) {
		return (Integer)sqlsession.selectList("Quest.getSeq",userid).get(0);
	}

	public QuestDTO getDetail(int quest_num) {
		return sqlsession.selectOne("Quest.getDetail",quest_num);
	}

	public void updateQuest_cnt(int quest_num) {
		sqlsession.update("Quest.updateQuest_cnt",quest_num);
	}

	public boolean updateQuest(QuestDTO quest) {
		return 1 == sqlsession.update("Quest.updateQuest",quest);
	}

	public boolean insertReply(ReplyDTO reply) {
		return 1==sqlsession.insert("Quest.insertReply",reply);
	}

	public List<ReplyDTO> getReplys(int quest_num) {
		List<ReplyDTO> replys = sqlsession.selectList("Quest.getReplys",quest_num);
		return replys;
	}

	public boolean modifyReply(int replynum, String re_contents) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("replynum", replynum);
		datas.put("re_contents", re_contents);
		return 1==sqlsession.update("Quest.modifyReply",datas);
	}

	public boolean deleteReply(int replynum) {
		return 1 == sqlsession.delete("Quest.deleteReply",replynum);
	}

	public boolean deleteReplyAll(int quest_num) {
		return 0!=sqlsession.delete("Quest.deleteReplyAll",quest_num);
	}

	public int getReplyCnt(int quest_num) {
		return (Integer)sqlsession.selectOne("Quest.getReplyCnt", quest_num);
	}

	public boolean deleteQuest(int quest_num) {
		return 1==sqlsession.delete("Quest.deleteQuest",quest_num);
	}
}
