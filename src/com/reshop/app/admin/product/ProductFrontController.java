package com.reshop.app.admin.product;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.ActionForward;

public class ProductFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI(); 
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null;
		switch(command) {
		case "/admin/ProductList.pd":
			try {
				forward = new ProductListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductList : "+e);
			}
			break;
			
		case "/admin/ProductUpdate.pd" :
			forward = new ActionForward(false,"/app/product/productUpdateview.jsp"); 
			req.setAttribute("page", req.getParameter("page"));
			break;
			
		case "/admin/ProductUpdateOk.pd":
			try {
				forward = new ProductUpdateOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductUpdateOk : "+e);
			}
			break;
			
		case  "/admin/ProductView.pd":
			try {
				forward = new ProductViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductView : "+e);
			}
			break;
			
		case "/admin/ProductModify.pd" :
			try {
				forward = new ProductModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("productModify : "+e);
			}
			break;
			
		case "/admin/ProductModifyOk.pd":
			try {
				forward = new ProductModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductModifyOk :" +e);
			}
			break;
		case "/admin/ProductDeleteOk.pd":
			try {
				forward = new ProductDeleteOkAtion().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductDeleteOk : "+e);
			}
			
			break;
			
		case "/admin/ProductCheck.pd":
			try {
				forward = new ProductCheckAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductCheck : "+e);
			}
			break;
			
			
		case "/admin/FileDownload.pd" :
			
			try {
				new FileDownloadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FileDownload :"+e);
			}
			break;
			
		case "/admin/FileDelete.pd" :
			try {
				forward = new FileDeleteAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FileDelete :"+e);
			}
			break;
			
			//신예찬(사용자를 위한 상품 리스트 불러오기)
		case "/admin/ProductListForUser.pd":
			try {
				forward = new ProductListForUserAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductListForUser : "+e);
			}
			break;	
		case "/admin/ProductListForUser2.pd":
			try {
				forward = new ProductListForUserAction2().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductListForUser2 : "+e);
			}
			break;	
			
			//구매하기
		case "/admin/ProductBuyOk.pd" :
			try {
				forward = new ProductBuyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductBuyOk :"+e);
			}
			break;
			
			//장바구니담기
		case "/admin/ProductAddCartOk.pd" :
			try {
				forward = new ProductAddCartOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductAddCartOk :"+e);
			}
			break;
			
			//장바구니담기
			
		case "/admin/ProductCart.pd" :
			try {
				forward = new ProductCartAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductCart :"+e);
			}
			break;
			
		case "/admin/ProductCartDeleteOk.pd" :
			try {
				forward = new ProductCartDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductCartDeleteOk :"+e);
			}
			break;
			
		case "/admin/ProductOrder.pd" :
			try {
				forward = new ProductOrderAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductOrder :"+e);
			}
			break;
		
		case "/admin/ProductOrderOk.pd" :
			try {
				forward = new ProductOrderOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ProductOrderOk :"+e);
			}
			break;
		}
			
		
		if(forward!=null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
		
}
}
