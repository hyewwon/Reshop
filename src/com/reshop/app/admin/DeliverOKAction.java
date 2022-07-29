package com.reshop.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.DeliverDAO;
import com.reshop.app.admin.dao.DeliverDTO;

public class DeliverOKAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int mng_num = Integer.parseInt(request.getParameter("mng_num"));
		String invoicenum = request.getParameter("invoicenum");
		DeliverDAO ddao = new DeliverDAO();
		DeliverDTO ddto = new DeliverDTO();
		
		ddto.setMng_num(mng_num);
		ddto.setInvoicenum(invoicenum);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(ddao.insertDeliver(ddto)) {
			forward.setPath(request.getContextPath()+"/admin/ManageOrder.ad?deliver=true");
		}else {
			forward.setPath(request.getContextPath()+"/admin/ManageOrder.ad?deliver=false");
		}
		return forward;
	}
	
}
