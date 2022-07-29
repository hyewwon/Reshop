package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NoticeDAO;
import com.reshop.app.board.dao.NoticeDTO;
import com.reshop.app.board.dao.FileDAO;

public class NoticeModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		NoticeDTO notice = ndao.getDetail(notice_num);
		request.setAttribute("notice", notice);
		request.setAttribute("files", fdao.getFiles(notice_num));
		ActionForward forward = new ActionForward(false, "/app/board/modifyview.jsp");
		return forward;
	}
}











