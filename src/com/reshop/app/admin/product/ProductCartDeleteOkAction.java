package com.reshop.app.admin.product;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.product.dao.CartDAO;
import com.reshop.app.admin.product.dao.CartDTO;
import com.reshop.app.admin.product.dao.FileDAO;
import com.reshop.app.admin.product.dao.FileDTO;
import com.reshop.app.admin.product.dao.ProductDAO;
import com.reshop.app.admin.product.dao.ProductDTO;

public class ProductCartDeleteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int ordernum = Integer.parseInt(request.getParameter("ordernum"));
		CartDAO cdao = new CartDAO();
		boolean deleteResult = cdao.deleteCart(ordernum);
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		
		FileDAO fdao = new FileDAO();
		ProductDAO pdao = new ProductDAO();
		ProductDTO productInfo = new ProductDTO();
		ArrayList<ProductDTO> productInfoList = new ArrayList<>();
		ArrayList<FileDTO> fileList = new ArrayList<>();
		ArrayList<CartDTO> cartList = (ArrayList<CartDTO>) cdao.getCartList(userid);
		int totalAmount = 0;
		int i = 0;
		for (CartDTO cart : cartList) {
			int prodnum = cart.getProdnum();
			//특정 상품의 정보
			fileList.addAll(fdao.getFiles(prodnum));
			productInfo = pdao.getProductInfo(prodnum);
			//모든 상품가격 총합
			totalAmount += productInfo.getPrice();
			productInfoList.add(productInfo);
			i++;
		}
		
		ArrayList<Integer> rownumList = new ArrayList<>();
		for (int j = 1; j <= cartList.size(); j++) {
			rownumList.add(j);
		}
		
		
		request.setAttribute("cartList", cartList);
		session.setAttribute("productInfoList", productInfoList);
		request.setAttribute("fileList", fileList);
		request.setAttribute("totalAmount", totalAmount);
		request.setAttribute("rownumList", rownumList);
		
		
		ActionForward forward = null;
		 if(deleteResult){
			 forward = new ActionForward(false, "/app/order/cartview.jsp");
		 }else {
			 forward = new ActionForward(false, "/app/order/cartview.jsp?cartDelete=false");
		 }
		
		return forward;
	}

}
