package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.QuestDAO;
import com.reshop.app.board.dao.QuestDTO;
import com.reshop.app.board.dao.FileDAO;

public class QuestViewAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QuestDAO qdao = new QuestDAO();
		FileDAO fdao = new FileDAO();
		int quest_num = Integer.parseInt(request.getParameter("quest_num"));
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		QuestDTO quest = qdao.getDetail(quest_num);
		if(!quest.getUserid().equals(userid)) {
			qdao.updateQuest_cnt(quest_num);
//			notice.setNotice_cnt(notice.getNotice_cnt()+1);
			quest = qdao.getDetail(quest_num);
		}
		request.setAttribute("files", fdao.getFiles(quest_num));
		request.setAttribute("replys", qdao.getReplys(quest_num));
		request.setAttribute("quest", quest);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/app/board/questview.jsp");
		return forward;
	}
}














