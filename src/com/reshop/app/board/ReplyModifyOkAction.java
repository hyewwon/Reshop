package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NoticeDAO;


public class ReplyModifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		request.setCharacterEncoding("UTF-8");
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));;
		String num = request.getParameter("num");
		String re_contents = request.getParameter("reply"+num);
		int replynum = Integer.parseInt(request.getParameter("replynum"));
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(ndao.modifyReply(replynum,re_contents)) {
			forward.setPath(request.getContextPath()+"/board/NoticeView.bo?notice_num="+notice_num);
		}else {
			forward.setPath(request.getContextPath()+"/board/NoticeView.bo?update=false&notice_num="+notice_num);
		}
		return forward;
	}
}






