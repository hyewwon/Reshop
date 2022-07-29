package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.QuestDAO;

public class QReplyDeleteOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		QuestDAO qdao = new QuestDAO();
		int replynum = Integer.parseInt(request.getParameter("replynum"));
		
		String quest_num = request.getParameter("quest_num");
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);

		if(qdao.deleteReply(replynum)) {
			forward.setPath(request.getContextPath()+"/board/QuestView.qu?quest_num="+quest_num);
		}else {
			forward.setPath(request.getContextPath()+"/board/QuestView.qu?delete=false&quest_num="+quest_num);
		}
		return forward;
	}
}












