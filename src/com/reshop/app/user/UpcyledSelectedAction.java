package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.product.dao.FileDAO;
import com.reshop.app.admin.product.dao.ProductDAO;
import com.reshop.app.admin.product.dao.ProductDTO;

public class UpcyledSelectedAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAO pdao = new ProductDAO();
		FileDAO fdao = new FileDAO();
		int prodnum = Integer.parseInt(request.getParameter("prodnum"));
		ProductDTO product = pdao.getDetail(prodnum);
		
		request.setAttribute("product", product);
		request.setAttribute("files", fdao.getFiles(prodnum));
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/order/upcycledselected.jsp");
		return forward;
	}

}
