package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NewsDAO;
import com.reshop.app.board.dao.ReplyDTO;

public class NewsReplyWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		NewsDAO wdao = new NewsDAO();

		int news_num = Integer.parseInt(request.getParameter("news_num"));

		String re_contents = request.getParameter("re_contents");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		ReplyDTO reply = new ReplyDTO();
		reply.setNotice_num(news_num);

		reply.setUserid(userid);
		
		reply.setRe_contents(re_contents);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(wdao.insertReply(reply)) {
			forward.setPath(request.getContextPath()+"/board/NewsView.bo?news_num="+news_num);
		}else {
			forward.setPath(request.getContextPath()+"/board/NewsView.bo?reply=false&news_num="+news_num);
		}
		return forward;
	}
}
