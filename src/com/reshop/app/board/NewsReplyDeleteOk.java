package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NewsDAO;

public class NewsReplyDeleteOk implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NewsDAO wdao = new NewsDAO();
		int replynum = Integer.parseInt(request.getParameter("replynum"));
		
		String news_num = request.getParameter("news_num");
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(wdao.newsDeleteReply(replynum)) {
			forward.setPath(request.getContextPath()+"/board/NewsView.bo?news_num="+news_num);
		}else {
			forward.setPath(request.getContextPath()+"/board/NewsView.bo?delete=false&news_num="+news_num);
		}
		return forward;
	}
}
