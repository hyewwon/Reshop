package com.reshop.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.OrderDAO;
import com.reshop.app.admin.dao.OrderDTO;

public class OrderModifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		OrderDAO odao = new OrderDAO();

		int mng_num = Integer.parseInt(request.getParameter("mng_num"));
		String deli_name_modified = request.getParameter("deli_name_modified");
		String deli_phone_modified = request.getParameter("deli_phone_modified");
		String deli_addr_modified = request.getParameter("deli_addr_modified");
		String deli_addr_detail_modified = request.getParameter("deli_addr_detail_modified");
		String deli_addr_etc_modified = request.getParameter("deli_addr_etc_modified");

		OrderDTO odto = new OrderDTO();
		odto.setMng_num(mng_num);
		odto.setDeli_name(deli_name_modified);
		odto.setDeli_phone(deli_phone_modified);
		odto.setDeli_addr(deli_addr_modified);
		odto.setDeli_addr_detail(deli_addr_detail_modified);
		odto.setDeli_addr_etc(deli_addr_etc_modified);
		
		System.out.println("수정한 이름 : "+odto.getDeli_name());
		System.out.println("수정한 주소 : "+odto.getDeli_addr());

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);

		if (odao.updateOrder(odto)) {
			forward.setPath(request.getContextPath()+"/admin/OrderView.ad?update=true&mng_num="+mng_num);
		} else {
			forward.setPath(request.getContextPath()+"/admin/OrderView.ad?update=false&mng_num="+mng_num);
		}

		return forward;
	}
}