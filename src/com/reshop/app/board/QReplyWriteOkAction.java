package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;

import com.reshop.app.board.dao.QuestDAO;
import com.reshop.app.board.dao.ReplyDTO;

public class QReplyWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		QuestDAO qdao = new QuestDAO();

		int quest_num = Integer.parseInt(request.getParameter("quest_num"));
		String re_contents = request.getParameter("re_contents");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		
		ReplyDTO reply = new ReplyDTO();

		reply.setQuest_num(quest_num);
		reply.setUserid(userid);
		
		reply.setRe_contents(re_contents);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
	
		if(qdao.insertReply(reply)) {
			forward.setPath(request.getContextPath()+"/board/QuestView.qu?quest_num="+quest_num);
		}else {
			forward.setPath(request.getContextPath()+"/board/QuestView.qu?reply=false&quest_num="+quest_num);
		}
		return forward;
		
	}
}









