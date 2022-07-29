package com.reshop.app.admin.product;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.OrderDAO;
import com.reshop.app.admin.product.dao.CartDAO;
import com.reshop.app.admin.product.dao.ProductDTO;
import com.reshop.app.user.dao.UserDTO;

public class ProductOrderOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String userid = (String)session.getAttribute("login_id");
		OrderDAO odao = new OrderDAO();
		UserDTO udto = new UserDTO();
		ArrayList<ProductDTO> productList = new ArrayList<>();
		udto.setUserid(request.getParameter("userid"));
		udto.setUsername(request.getParameter("username"));
		udto.setUserphone(request.getParameter("userphone"));
		udto.setZipcode(request.getParameter("zipcode"));
		udto.setUseraddr(request.getParameter("useraddr"));
		udto.setUseraddrdetail(request.getParameter("useraddrdetail"));
		udto.setUseraddretc(request.getParameter("useraddretc"));
		
		
		productList =  (ArrayList<ProductDTO>)session.getAttribute("productInfoList");
		for (ProductDTO productInfo : productList) {
			int prodnum = productInfo.getProdnum();
			if(odao.getOrderCheck(prodnum,userid)) {
				if(odao.insertOrder(udto,productInfo)) {
					System.out.println("주문정보 삽입성공");
				}else {
					System.out.println("주문정보 삽입실패");
				}
			}else {
				if(odao.updateOrder(prodnum,userid)) {
					System.out.println("상품개수추가 성공");
				}else {
					System.out.println("상품개수추가 실패");
				}				
			}
		}
		CartDAO cdao = new CartDAO();
		//장바구니 비우기
		String cartCheck = (String) session.getAttribute("cartCheck");
		if(cartCheck != null)
		{
			if(cdao.deleteCartAll(userid)) {
				System.out.println("장바구니 비우기 성공");
			}else {
				System.out.println("장바구니 비우기 실패");
			}
		}
		ActionForward forward = null;
		forward = new ActionForward(false, "/app/order/shopintro.jsp");
		return forward;
	}

}
