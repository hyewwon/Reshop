package com.reshop.app.admin.product.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class CartDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public CartDAO() {
		sqlsession = factory.openSession(true);
	}

	public List<CartDTO> getCartList() {
		return sqlsession.selectList("Order.getCartList");
	}
	public List<CartDTO> getCartList(String userid) {
		return sqlsession.selectList("Order.getCartList2",userid);
	}

	public boolean updateCartAdd(String userid, int prodnum) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("prodnum", prodnum);
		
		return 1==sqlsession.insert("Order.updateCartAdd", datas);
	}

	public boolean insertCartAdd(String userid, int prodnum) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("prodnum", prodnum);
		
		return 1==sqlsession.insert("Order.insertCartAdd", datas);
		
	}

	public boolean deleteCart(int ordernum) {
		
		return 1==sqlsession.insert("Order.deleteCart", ordernum);
	}

	public boolean deleteCartAll(String userid) {
		return 0<sqlsession.insert("Order.deleteCartAll",userid);
	}

	

	

	
	
	

}