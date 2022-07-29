package com.reshop.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.ActionForward;

public class QuestFrontController extends HttpServlet {
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
		case "/board/QuestList.qu":
			try {
				forward = new QuestListAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("QuestList : " +e);
			}
			break;
		case "/board/QuestWrite.qu":
			forward = new ActionForward(false,"/app/board/questwriteview.jsp");
			req.setAttribute("page", req.getParameter("page"));
			break;
		case "/board/QuestWriteOk.qu":
			try {
				forward = new QuestWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("QuestWriteOk : "+e);
			}
			break;
		case "/board/QuestView.qu":
			try {
				forward = new QuestViewAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("QuestView : "+e);
			}
			break;
		case "/board/QReplyWriteOk.qu":
			try {
				forward = new QReplyWriteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("QReplyWriteOk : "+e);
			}
			break;
		case "/board/QReplyModifyOk.qu":
			try {
				forward = new QReplyModifyOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("QReplyModifyOk : "+e);
			}
			break;
		case "/board/QReplyDeleteOk.qu":
			try {
				forward = new QReplyDeleteOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("QReplyDeleteOk : "+e);
			}
			break;
		case "/board/FileDownload.qu":
			try {
				new FileDownloadAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("FileDownload : "+e);
			}
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
