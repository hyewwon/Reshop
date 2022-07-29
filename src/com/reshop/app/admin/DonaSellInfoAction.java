package com.reshop.app.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.DonaSellDAO;
import com.reshop.app.admin.dao.DonaSellDTO;

public class DonaSellInfoAction  implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int dosnum = Integer.parseInt(request.getParameter("dosnum"));
		String priceon = request.getParameter("priceon");
		
		DonaSellDAO dsdao = new DonaSellDAO();
		DonaSellDTO dsdto = dsdao.getDetail(dosnum);
		
		request.setAttribute("dsdto", dsdto);
		request.setAttribute("priceon", priceon);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/admin/donasellinfo.jsp");
		return forward;
	
	}
}
