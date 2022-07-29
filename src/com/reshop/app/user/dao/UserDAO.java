package com.reshop.app.user.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;


public class UserDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public UserDAO() {
		//지어진 공장에서 생수병 받아오기
		//openSession(true) : 오토커밋
		sqlsession = factory.openSession(true);
	}
	
	public boolean checkId(String userid) {
		//User 네임스페이스 안의 checkId 쿼리문을 userid 넘겨주면서 사용
		int result = 0;
		result = sqlsession.selectOne("User.checkId", userid);
		return result == 0;
	}
	public boolean join(UserDTO user) {
		//sqlsession.insert() 는 수정된 행의 개수가 리턴된다.
		return 1==sqlsession.insert("User.join",user);
	}
	public boolean login(String userid,String userpw) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		return 1==(Integer)sqlsession.selectOne("User.login",datas);
	}
	//아이디 찾기
	public String lostId(String username,String userphone) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("username", username);
		datas.put("userphone", userphone);
		String lostId = (String)sqlsession.selectOne("User.lostId",datas);
		if(lostId==null) {
			lostId="찾을수 없습니다.";
		}else {
			lostId=lostId+"입니다.";
		}
		return lostId;
	}
	
	public UserDTO passenger(String userid) {
		return sqlsession.selectOne("User.checkpass", userid);

	}

	public int getUserCnt() {
		return sqlsession.selectOne("User.getUserCnt");
	}

	public List<UserDTO> getUserList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<UserDTO> userList = sqlsession.selectList("User.getUserList", datas);
		return userList;
	}

	public boolean updatepass(UserDTO udto) {
		return 1 == sqlsession.update("User.updatepass",udto); 
	}

	public boolean deleteuser(String userid) {
		return 1 == sqlsession.update("User.deleteuser", userid);
	}

	
	
	public boolean myprofileupdate(UserDTO udto) {
		return 1 == sqlsession.update("User.myprofileupdate",udto); 
	}
	public boolean myprofiledelete(String userid) {
		return 1 == sqlsession.update("User.myprofiledelete", userid);
	}
}












