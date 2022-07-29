package com.reshop.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.DeliverDAO;

public class DeliverDoneAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		DeliverDAO ddao = new DeliverDAO();
		
		String deliverynum = request.getParameter("deliverynum");

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);

		if (ddao.deliverDone(deliverynum)) {
			forward.setPath(request.getContextPath()+"/admin/ManageDeliver.ad?deliverdone=true");
		} else {
			forward.setPath(request.getContextPath()+"/admin/ManageDeliver.ad?deliverdone=false");
		}

		return forward;
	}
}
