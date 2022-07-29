package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDAO;

public class DeleteUserAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		String userid = request.getParameter("userid");
		System.out.println("아이디!!+"+userid);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		
		if(udao.deleteuser(userid)) {
			forward.setPath(request.getContextPath()+"/user/ManageUser.us?update=true");
		}else {
			forward.setPath(request.getContextPath()+"/user/ManageUser.us?update=false");
		}
			
		return forward;
	}
}
