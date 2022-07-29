package com.reshop.app.admin.product;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.product.dao.FileDAO;
import com.reshop.app.admin.product.dao.FileDTO;
import com.reshop.app.admin.product.dao.ProductDAO;
import com.reshop.app.admin.product.dao.ProductDTO;
import com.reshop.app.user.dao.UserDAO;
import com.reshop.app.user.dao.UserDTO;

import sun.util.resources.cldr.fr.CalendarData_fr_TD;

public class ProductBuyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		ProductDAO pdao = new ProductDAO();
		System.out.println(1);
		int prodnum = Integer.parseInt(request.getParameter("prodnum"));
		System.out.println(prodnum);
		ProductDTO productInfo = pdao.getProductInfo(prodnum);
		int prodcnt = productInfo.getProdcnt();
		boolean prodcntcheck=true;
		if(prodcnt <= 0) {
			prodcntcheck=false;
		}
		
		ArrayList<ProductDTO> productInfoList = new ArrayList<>();
		productInfoList.add(productInfo);
		
		//rownum 1개만
		ArrayList<Integer> rownumList = new ArrayList<>();
		for (int j = 1; j <= 2; j++) {
			rownumList.add(j);
		}
		
		//사진 가져오기
		FileDAO fdao = new FileDAO();
		ArrayList<FileDTO> fileList = new ArrayList<>();
		fileList.addAll(fdao.getFiles(prodnum));
		
		//user 정보
		UserDAO udao = new UserDAO();
		UserDTO userInfo =  udao.passenger(userid);
		
		//총액
		int totalAmount = 0;
		totalAmount += productInfo.getPrice();
		
		request.setAttribute("userInfo", userInfo);
		request.setAttribute("rownumList", rownumList);
		request.setAttribute("fileList", fileList);
		request.setAttribute("totalAmount", totalAmount);
		session.setAttribute("productInfoList", productInfoList);
		session.removeAttribute("cartCheck");
		ActionForward forward = null;
		if(prodcntcheck) {
			 forward = new ActionForward(false, "/app/order/paymentview.jsp");
		}else {
			//품절체크
			 forward = new ActionForward(false,"/app/order/shoppingview.jsp?prodcntcheck=false");
		}
		return forward;
	}
}
