package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;

import com.reshop.app.board.dao.QuestDAO;

public class QReplyModifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QuestDAO qdao = new QuestDAO();
		request.setCharacterEncoding("UTF-8");
		int quest_num = Integer.parseInt(request.getParameter("quest_num"));
		String num = request.getParameter("num");
		String re_contents = request.getParameter("reply"+num);
		int replynum = Integer.parseInt(request.getParameter("replynum"));
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(qdao.modifyReply(replynum,re_contents)) {
			forward.setPath(request.getContextPath()+"/board/QuestView.qu?quest_num="+quest_num);
		}else {
			forward.setPath(request.getContextPath()+"/board/QuestView.qu?update=false&quest_num="+quest_num);
		}
		return forward;
	}
}






