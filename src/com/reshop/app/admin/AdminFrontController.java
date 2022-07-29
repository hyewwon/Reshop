package com.reshop.app.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.ActionForward;

public class AdminFrontController extends HttpServlet {
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
		// 길 나누는 코드
		String requestURI = req.getRequestURI(); // 요청한 URI localhost:9090/user/UserJoin.us
		String contextPath = req.getContextPath(); // 최상위 경로 localhost:9090
		String command = requestURI.substring(contextPath.length());// /user/UserJoin.us
		System.out.println(command);
		ActionForward forward = null;
		switch (command) {
		case "/admin/home.ad":
			try {
				forward = new ActionForward(false,"/index.jsp");
			} catch (Exception e) {
				System.out.println("home : "+e);
			}
			break;
			
		case "/admin/ManageOrder.ad":
			try {
				forward = new OrderListAction().execute(req, resp);
			} catch (Exception e) {
				forward = new ActionForward(false,"/app/admin/orderlist.jsp?db=false");
				System.out.println("OrderListAction : "+e);
			}
			break;
		case "/admin/OrderView.ad":
			try {
				forward = new OrderViewAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("OrderViewAction : "+e);
			}
			break;
		case "/admin/OrderModifyOk.ad":
			try {
				forward = new OrderModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("OrderModifyOk : "+e);
			}
			break;
		case "/admin/DeliverInfo.ad":
			try {
				forward = new DeliverInfoAction().execute(req, resp);
				} catch (Exception e) {
				System.out.println("DeliverInfoAction : "+e);
			}
			break;
		case "/admin/DeliverOK.ad":
			try {
				forward = new DeliverOKAction().execute(req, resp);
				} catch (Exception e) {
				System.out.println("DeliverOKAction : "+e);
			}
			break;
		case "/admin/ManageDeliver.ad":
			try {
				forward = new DeliverListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DeliverListAction : "+e);
			}
			break;
		case "/admin/DeliverDone.ad":
			try {
				forward = new DeliverDoneAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DeliverDoneAction : "+e);
			}
			break;
		case "/admin/ManageRefund.ad":
			try {
				forward = new RefundListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("RefundListAction : "+e);
			}
			break;
		case "/admin/RefundDone.ad":
			try {
				forward = new RefundDoneAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("RefundDoneAction : "+e);
			}
			break;
		case "/admin/ManageDonaSell.ad":
			try {
				forward = new DonaSellListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("RefundDoneAction : "+e);
			}
			break;
		case "/admin/DonaSellInfo.ad":
			try {
				forward = new DonaSellInfoAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DonaSellInfoAction : "+e);
			}
			break;
		case "/admin/DonaSellPriceOk.ad":
			try {
				forward = new DonaSellPriceOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DonaSellPriceOkAction : "+e);
			}
			break;
		case "/admin/DonaDone.ad":
			try {
				forward = new DonaDoneAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DonaDoneAction : " + e);
			}
			break;
			
		//성훈	
		case "/admin/SalesOrder.ad":
			try {
				forward = new SalesListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("OrderListAction : "+e);
			}
			break;
		case "/admin/DateSearch.ad":
			try {
				forward = new DateSearchAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DateSearchAction : "+e);
			}
			break;
		//재열
		case "/admin/SalesInfoList.ad":
			try {
				forward = new SalesInfoListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("SalesInfoList : " + e);
			}
			break;
		case "/admin/ShoppingInfoList.ad":
			try {
				forward = new ShoppingInfoListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ShoppingInfoList : " + e);
			}
			break;
		}
		// 일괄처리
		// 어디인지, 어떤 방식인지는 몰라도 담겨있는대로 페이지 이동시키는 코드
		if (forward != null) {
			if (forward.isRedirect()) {
				// Redirect
				resp.sendRedirect(forward.getPath());
			} else {
				// Forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
