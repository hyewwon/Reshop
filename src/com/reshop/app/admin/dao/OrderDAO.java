package com.reshop.app.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.admin.product.dao.ProductDTO;
import com.reshop.app.mybatis.SqlMapConfig;
import com.reshop.app.user.dao.UserDTO;

public class OrderDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public OrderDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public int getOrderCnt() {
		return sqlsession.selectOne("Order.getOrderCnt");
	}

	public List<OrderDTO> getOrderList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<OrderDTO> orderList = sqlsession.selectList("Order.getOrderList",datas);
		return orderList;
	}

	public OrderDTO getDetail(int mng_num) {
		return sqlsession.selectOne("Order.getDetail",mng_num);
	}

	public boolean updateOrder(OrderDTO odto) {
		return 1 == sqlsession.update("Order.updateOrder",odto);
	}

	public int getRefundCnt() {
		return sqlsession.selectOne("Order.getRefundCnt");
	}

	public List<OrderDTO> getRefundList(int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<OrderDTO> RefundList = sqlsession.selectList("Order.getRefundList",datas);
		return RefundList;
	}

	public boolean refundDone(int mng_num) {
		return 1 == sqlsession.update("Order.refundDone",mng_num);
	}
	
	public int getTotalSales() {
		return sqlsession.selectOne("Order.getTotalSales");
	}

	public List<OrderDTO> datesearch(String startdate, String finishdate) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("startdate", startdate);
		datas.put("finishdate", finishdate);
		List<OrderDTO> datelist = sqlsession.selectList("Order.getdatelist", datas);
		return datelist;
	}
	
	public int getShoppingCnt(String userid) {
		return sqlsession.selectOne("Order.getShoppingCnt",userid);
	}
	public List<OrderDTO> getShoppingList(int startRow, int endRow, String userid, String sortColumn, String condition) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		datas.put("userid", userid);
		datas.put("sortColumn", sortColumn);
		datas.put("condition", sortColumn);
		List<OrderDTO> shoppingList = sqlsession.selectList("Order.getShoppingList",datas);
		return shoppingList;
	}

	public boolean updateRefund(String refund) {
		return 1==sqlsession.update("Order.updateRefund",refund);
	}

	public boolean updateCancel(String cancel) {
		return 1==sqlsession.update("Order.updateCancel",cancel);
	}
	public boolean getOrderCheck(int prodnum, String userid) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("prodnum", prodnum);
		datas.put("userid", userid);
		return 0==(Integer)sqlsession.selectOne("Order.getOrderCheck",datas);
	}

	public boolean insertOrder(UserDTO user, ProductDTO productInfo) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", user.getUserid());
		datas.put("username", user.getUsername());
		datas.put("userphone", user.getUserphone());
		datas.put("zipcode", user.getZipcode());
		datas.put("useraddr", user.getUseraddr());
		datas.put("useraddrdetail", user.getUseraddrdetail());
		datas.put("useraddretc", user.getUseraddretc());
		datas.put("prodnum", productInfo.getProdnum());
		datas.put("prodcnt", productInfo.getProdcnt());
		System.out.println(user.getUserid()+"\n"+user.getUsername()+"\n"+user.getUserphone()+"\n"+user.getZipcode()+"\n"+user.getUseraddr()+"\n"+user.getUseraddrdetail()+"\n"+
				user.getUseraddretc()+"\n"+productInfo.getProdnum()+"\n"+productInfo.getProdcnt());
		return 1==sqlsession.insert("Order.insertOrder",datas);
	}

	public boolean updateOrder(int prodnum, String userid) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("prodnum", prodnum);
		datas.put("userid", userid);
		return 1==sqlsession.insert("Order.updateOrder2",datas);
	}
	
	
}













