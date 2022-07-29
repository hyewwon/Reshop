package com.reshop.app.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class DonaSellDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	public DonaSellDAO() {
		sqlsession = factory.openSession(true);
	}

	public int getDonaSellCnt() {
		return sqlsession.selectOne("DonaSell.getDonaSellCnt");
	}
	public int getDonaSellCnt(String userid) {
		return sqlsession.selectOne("DonaSell.getDonaSellCnt2",userid);
	}

	public List<DonaSellDTO> getDonaSellList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<DonaSellDTO> donaSellList = sqlsession.selectList("DonaSell.getDonaSellList", datas);
		return donaSellList;
	}
	public List<DonaSellDTO> getDonaSellList(int startRow, int endRow, String userid, String sortColumn) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("userid", userid);
		datas.put("sortColumn", sortColumn);
		List<DonaSellDTO> donasellList = sqlsession.selectList("DonaSell.getDonaSellList2",datas);
		return donasellList;
	}
	public int getDonaSellrevenug(String userid){
		return (Integer)sqlsession.selectOne("DonaSell.getDonaSellRevenug",userid);
	}

	public DonaSellDTO getDetail(int dosnum) {
		return sqlsession.selectOne("DonaSell.getDetail",dosnum);
	}

	public boolean updateConnoisseur(int dosnum, int price) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("dosnum", dosnum);
		datas.put("price", price);
		return 1 == sqlsession.update("DonaSell.updateConnoisseur",datas);
	}

	public boolean donadone(int dosnum) {
		return 1 == sqlsession.update("DonaSell.donadone",dosnum);
	}


}
