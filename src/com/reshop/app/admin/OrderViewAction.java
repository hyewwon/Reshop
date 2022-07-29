package com.reshop.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.OrderDAO;
import com.reshop.app.admin.dao.OrderDTO;

public class OrderViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int mng_num = Integer.parseInt(request.getParameter("mng_num"));
		OrderDAO odao = new OrderDAO();
		
		OrderDTO order = odao.getDetail(mng_num);
		
		request.setAttribute("order", order);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/admin/orderview.jsp");
		return forward;
	}
}