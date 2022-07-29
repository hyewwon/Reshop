package com.reshop.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.OrderDAO;

public class RefundDoneAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		OrderDAO odao = new OrderDAO();
		
		int mng_num = Integer.parseInt(request.getParameter("mng_num"));

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);

		if (odao.refundDone(mng_num)) {
			forward.setPath(request.getContextPath()+"/admin/ManageRefund.ad?refunddone=true");
		} else {
			forward.setPath(request.getContextPath()+"/admin/ManageRefund.ad?refunddone=false");
		}

		return forward;
	}
}