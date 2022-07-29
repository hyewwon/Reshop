package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDAO;
import com.reshop.app.user.dao.UserDTO;

public class MyProfileAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		UserDAO udao = new UserDAO();
		
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("login_id");
		
		System.out.println(userid);
		
		ActionForward forward = new ActionForward();
		
		if(userid==null) {
			forward = new ActionForward(false, "/app/user/loginview.jsp?login=false");
			return forward;
		}
		
		
		UserDTO user = udao.passenger(userid);
		
		request.setAttribute("user", user);
		
		forward = new ActionForward(false, "/app/user/myprofile.jsp");
		
		return forward;
	}
}
