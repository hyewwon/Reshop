package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NoticeDAO;
import com.reshop.app.board.dao.NoticeDTO;
import com.reshop.app.board.dao.FileDAO;

public class NoticeViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		NoticeDTO notice = ndao.getDetail(notice_num);
		if(!notice.getUserid().equals(userid)) {
			ndao.updateNotice_cnt(notice_num);
//			notice.setNotice_cnt(notice.getNotice_cnt()+1);
			notice = ndao.getDetail(notice_num);
		}
		request.setAttribute("files", fdao.getFiles(notice_num));
		request.setAttribute("replys", ndao.getReplys(notice_num));
		request.setAttribute("notice", notice);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/noticeview.jsp");
		return forward;
	}
}














