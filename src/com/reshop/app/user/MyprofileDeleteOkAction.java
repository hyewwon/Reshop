package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDAO;

public class MyprofileDeleteOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		String userid = request.getParameter("userid");
		System.out.println("아이디!!+"+userid);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		
		if(udao.myprofiledelete(userid)) {
			request.getSession().setAttribute("login_id", null);
			forward.setPath(request.getContextPath()+"/app/user/loginview.jsp?delete=delete");
		}else {
			forward.setPath(request.getContextPath()+"/user/MyProfile.us?userid=${login_id}&update=false");
		}
			
		return forward;
	}
}
