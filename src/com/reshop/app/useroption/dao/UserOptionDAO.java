package com.reshop.app.useroption.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class UserOptionDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;

	public UserOptionDAO() {
		sqlsession = factory.openSession(true);
	}

	public boolean option(UserOptionDTO user) {
		// sqlsession.insert() 는 수정된 행의 개수가 리턴된다.
				
		return 1 == sqlsession.insert("User.option", user);
		
		
		
		
	}

	public int selectdosnum(UserOptionDTO uodto) {
		return sqlsession.selectOne("User.selectdosnum",uodto);
	}

}
