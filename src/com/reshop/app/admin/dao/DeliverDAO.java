package com.reshop.app.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class DeliverDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	public DeliverDAO() {
		sqlsession = factory.openSession(true);
	}

	public boolean insertDeliver(DeliverDTO deliver) {
		return 1 == sqlsession.insert("Deliver.insertDeliver", deliver);
	}

	public int getDeliverCnt() {
		return sqlsession.selectOne("Deliver.getDeliverCnt");
	}

	public List<DeliverDTO> getDeliverList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<DeliverDTO> deliverList = sqlsession.selectList("Deliver.getDeliverList", datas);
		return deliverList;
	}
	
	public boolean deliverDone(String delivernum) {
		return 1 == sqlsession.update("Deliver.deliverDone",delivernum);
	}
	public List<Integer> getDelverynumList() {
		List<Integer> getDelnum = sqlsession.selectList("Deliver.getDelverynumList");
		return getDelnum;
	}
}
