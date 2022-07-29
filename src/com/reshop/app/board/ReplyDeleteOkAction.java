package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NoticeDAO;


public class ReplyDeleteOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		int replynum = Integer.parseInt(request.getParameter("replynum"));
		
		String notice_num = request.getParameter("notice_num");
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(ndao.deleteReply(replynum)) {
			forward.setPath(request.getContextPath()+"/board/NoticeView.bo?notice_num="+notice_num);
		}else {
			forward.setPath(request.getContextPath()+"/board/NoticeView.bo?delete=false&notice_num="+notice_num);
		}
		return forward;
	}
}












