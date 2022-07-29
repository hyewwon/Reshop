package com.reshop.app.admin.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.product.dao.ProductDAO;
import com.reshop.app.admin.product.dao.ProductDTO;

public class ProductCheckAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAO pdao = new ProductDAO();
		int prodnum = Integer.parseInt(request.getParameter("prodnum"));
		ProductDTO product = pdao.checkProduct(prodnum);
		request.setAttribute("product", product);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/product/checkProdview.jsp");
		return forward;
	}
}
