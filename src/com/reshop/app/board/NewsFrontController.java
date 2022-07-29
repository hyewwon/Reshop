package com.reshop.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.ActionForward;

public class NewsFrontController extends HttpServlet {
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
		String requestURI = req.getRequestURI(); // 요청한 URI localhost:9090/user/UserJoin.us
		String contextPath = req.getContextPath(); // 최상위 경로 localhost:9090
		String command = requestURI.substring(contextPath.length());// /user/UserJoin.us
		System.out.println(command);
		ActionForward forward = null;
		switch (command) {
		case "/board/NewsList.bo":
			try {
				forward = new NewsListAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewsList :" + e);
			}

			break;

		case "/board/NewsWrite.bo":

			forward = new ActionForward(false, "/app/board/newswriteview.jsp");
			req.setAttribute("page", req.getParameter("page"));

			break;

		case "/board/NewsWriteOk.bo":
			try {
				forward = new NewsWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewsWriteOk : " + e);
			}

			break;

		case "/board/NewsView.bo":

			try {
				forward = new NewsViewAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewsView : " + e);
			}

			break;

		case "/board/NewsModify.bo":

			try {
				forward = new NewsModifyAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewsModify :" + e);
			}

			break;

		case "/board/NewsModifyOk.bo":

			try {
				forward = new NewsModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewsModifyOk :" + e);
			}

			break;

		case "/board/NewsDeleteOk.bo":

			try {
				forward = new NewsDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewsDeleteOk : " + e);
			}

			break;

		case "/board/NewsReplyWriteOk.bo":

			try {
				forward = new NewsReplyWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("ReplyNewsWriteOK : " + e);
			}

			break;

		case "/board/NewsReplyModifyOk.bo ":

			try {
				forward = new NewsReplyModifyOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewsReplyModifyOK : " + e);
			}

			break;

		case "/board/NewsReplyDeleteOk.bo":

			try {
				forward = new NewsReplyDeleteOk().execute(req, resp);
			} catch (Exception e) {
				System.out.println("NewsReplyDeleteOk :" + e);
			}

			break;

		case "/board/FileDown.bo":
			try {
				new FileDownAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("FileDownload : " + e);
			}

		}

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
