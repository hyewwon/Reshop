package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.FileDAO;
import com.reshop.app.board.dao.NewsDAO;
import com.reshop.app.board.dao.NewsDTO;

public class NewsViewAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NewsDAO wdao = new NewsDAO();
		FileDAO fdao = new FileDAO();
		int news_num = Integer.parseInt(request.getParameter("news_num"));
		
		NewsDTO news = wdao.getDetail(news_num);
		
		request.setAttribute("files", fdao.getFiles3(news_num));
		request.setAttribute("replys", wdao.getNewsReplys(news_num));
		request.setAttribute("news", news);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/newsview.jsp");
		return forward;
	}
}
