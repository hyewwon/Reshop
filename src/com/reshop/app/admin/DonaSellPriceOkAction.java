package com.reshop.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.DonaSellDAO;

public class DonaSellPriceOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		DonaSellDAO dsdao = new DonaSellDAO();
		
		int dosnum = Integer.parseInt(request.getParameter("dosnum"));
		int price = Integer.parseInt(request.getParameter("price"));

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);

		if (dsdao.updateConnoisseur(dosnum,price)) {
			forward.setPath(request.getContextPath()+"/admin/ManageDonaSell.ad?update=true");
		} else {
			forward.setPath(request.getContextPath()+"/admin/ManageDonaSell.ad?update=false");
		}

		return forward;
	}
} 

