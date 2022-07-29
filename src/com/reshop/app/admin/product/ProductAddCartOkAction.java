package com.reshop.app.admin.product;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.product.dao.CartDAO;
import com.reshop.app.admin.product.dao.CartDTO;
import com.reshop.app.admin.product.dao.ProductDAO;
import com.reshop.app.admin.product.dao.ProductDTO;

public class ProductAddCartOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ProductDAO pdao = new ProductDAO();
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		int prodnum = Integer.parseInt(request.getParameter("prodnum"));
		ProductDTO product = pdao.getProductInfo(prodnum);
		CartDAO cdao = new CartDAO();
		
		//한 유저가 중복 주문하면 update 아니면 insert
		//update, insert 선택에 이용될 변수
		boolean check = true;
		//성공 실패 체크
		boolean result = false;  
		 for (CartDTO cart : cdao.getCartList()) {
			if(cart.getProdnum()==prodnum && cart.getUserid().equals(userid)) {
				result=cdao.updateCartAdd(userid,product.getProdnum());
				check = false;
				break;
			}
		} 
		 if(check) {
			 result=cdao.insertCartAdd(userid,product.getProdnum());
		 }
		 ActionForward forward = null;
		 if(result) {
			 forward = new ActionForward(false, "/app/order/shopintro.jsp?result=true");
		 }else {
			 forward = new ActionForward(false, "/app/order/shopintro.jsp?result=false");
		 }
		return forward;
	}

}
