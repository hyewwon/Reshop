package com.reshop.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.ActionForward;

public class NoticeFrontController extends HttpServlet {
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
		//길 나누는 코드
		String requestURI = req.getRequestURI(); //요청한 URI	localhost:9090/user/UserJoin.us
		String contextPath = req.getContextPath(); //최상위 경로 localhost:9090
		String command = requestURI.substring(contextPath.length());// /user/UserJoin.us
		System.out.println(command);
		ActionForward forward = null;
		switch(command) {
		case "/board/NoticeList.bo":
			try {
				forward = new NoticeListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeList : " +e);
			}
			break;
		case "/board/NoticeWrite.bo":
			forward = new ActionForward(false,"/app/board/writeview.jsp");
			req.setAttribute("page", req.getParameter("page"));
			break;
		case "/board/NoticeWriteOk.bo":
			try {
				forward = new NoticeWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeWriteOk : "+e);
			}
			break;
		case "/board/NoticeView.bo":
			try {
				forward = new NoticeViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeView : "+e);
			}
			break;
		case "/board/NoticeModify.bo":
			try {
				forward = new NoticeModifyAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeModify : "+e);
			}
			break;
		case "/board/NoticeModifyOk.bo":
			try {
				forward = new NoticeModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeModifyOk : "+e);
			}
			break;
		case "/board/ReplyWriteOk.bo":
			try {
				forward = new ReplyWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReplyWriteOk : "+e);
			}
			break;
		case "/board/ReplyModifyOk.bo":
			try {
				forward = new ReplyModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReplyModifyOk : "+e);
			}
			break;
		case "/board/ReplyDeleteOk.bo":
			try {
				forward = new ReplyDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("ReplyDeleteOk : "+e);
			}
			break;
		case "/board/NoticeDeleteOk.bo":
			try {
				forward = new NoticeDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("NoticeDeleteOk : "+e);
			}
			break;
		case "/board/FileDownload.bo":
			try {
				new FileDownloadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FileDownload : "+e);
			}
		 break;
			
		}
		
			
		//일괄처리
		//어디인지, 어떤 방식인지는 몰라도 담겨있는대로 페이지 이동시키는 코드
		if(forward!=null) {
			if(forward.isRedirect()) {
				//Redirect
				resp.sendRedirect(forward.getPath());
			}else {
				//Forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
