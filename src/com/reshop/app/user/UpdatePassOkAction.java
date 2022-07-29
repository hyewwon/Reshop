package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDTO;
import com.reshop.app.user.dao.UserDAO;

public class UpdatePassOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		String userid = request.getParameter("userid");
		UserDTO user = udao.passenger(userid);
		request.setAttribute("user", user);
		ActionForward forward = new ActionForward(false, "/app/admin/pass_Update_view.jsp");
		return forward;
		
	}

}
