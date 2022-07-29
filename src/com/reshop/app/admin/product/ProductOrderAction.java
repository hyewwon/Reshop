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
import com.reshop.app.user.dao.UserDAO;
import com.reshop.app.user.dao.UserDTO;

public class ProductOrderAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		System.out.println(userid);
		CartDAO cdao = new CartDAO();
		FileDAO fdao = new FileDAO();
		ProductDAO pdao = new ProductDAO();
		ProductDTO productInfo = new ProductDTO();
		ArrayList<ProductDTO> productInfoList = new ArrayList<>();
		ArrayList<FileDTO> fileList = new ArrayList<>();
		ArrayList<CartDTO> cartList = (ArrayList<CartDTO>) cdao.getCartList(userid);
		int totalAmount = 0;
		int i = 0;
		boolean prodcntCheck = true; 
		ArrayList<ProductDTO> soldOutList = new ArrayList<>();
		ArrayList<ProductDTO> outStockList = new ArrayList<>();
		for (CartDTO cart : cartList) {
			int prodnum = cart.getProdnum();
			//특정 상품의 정보
			fileList.addAll(fdao.getFiles(prodnum));
			productInfo = pdao.getProductInfo(prodnum);
			
			//품절, 재고없음  체크
			if(productInfo.getProdcnt() <= 0){
				soldOutList.add(productInfo);
				prodcntCheck = false;
			}else if(cart.getProdcnt() > productInfo.getProdcnt()) {
				outStockList.add(productInfo);
				prodcntCheck = false;
			}
			//모든 상품가격 총합
			totalAmount += productInfo.getPrice();
			productInfoList.add(productInfo);
			i++;
		}
		System.out.println(1);
		
		//rownum 생성
		ArrayList<Integer> rownumList = new ArrayList<>();
		for (int j = 1; j <= cartList.size(); j++) {
			rownumList.add(j);
		}
		
		//user 정보
		UserDAO udao = new UserDAO();
		UserDTO userInfo =  udao.passenger(userid);
		request.setAttribute("userInfo", userInfo);
		request.setAttribute("cartList", cartList);
		//request.setAttribute("productInfoList", productInfoList);
		request.setAttribute("fileList", fileList);
		request.setAttribute("totalAmount", totalAmount);
		request.setAttribute("rownumList", rownumList);
		session.setAttribute("productInfoList", productInfoList);
		session.removeAttribute("cartCheck");
		session.setAttribute("cartCheck", "true");
		
		ActionForward forward = null;
		if(prodcntCheck) {
			 forward = new ActionForward(false,"/app/order/paymentview.jsp");
		}else {
			//품절과, 재고부족 체크
			if(soldOutList.size()>0) {
				request.setAttribute("soldOutList", soldOutList);
			}
			if(outStockList.size()>0) {
				request.setAttribute("outStockList", outStockList);
			}
			forward = new ActionForward(false,"/app/order/cartview.jsp");
		}
		System.out.println(forward.getPath());
		return forward;
	}

}
