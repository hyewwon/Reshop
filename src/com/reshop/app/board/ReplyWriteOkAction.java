package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NoticeDAO;

import com.reshop.app.board.dao.ReplyDTO;

public class ReplyWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		NoticeDAO ndao = new NoticeDAO();

		int notice_num = Integer.parseInt(request.getParameter("notice_num"));

		String re_contents = request.getParameter("re_contents");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		ReplyDTO reply = new ReplyDTO();
		reply.setNotice_num(notice_num);

		reply.setUserid(userid);
		
		reply.setRe_contents(re_contents);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if(ndao.insertReply(reply)) {
			forward.setPath(request.getContextPath()+"/board/NoticeView.bo?notice_num="+notice_num);
		}else {
			forward.setPath(request.getContextPath()+"/board/NoticeView.bo?reply=false&notice_num="+notice_num);
		}
		return forward;
	}
}









