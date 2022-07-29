package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDAO;

public class UserLoginOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		HttpSession session = request.getSession();
		
		ActionForward forward = null;
		if(udao.login(userid, userpw)) {
			session.setAttribute("login_id", userid);
			forward = new ActionForward(true,request.getContextPath()+"/index.jsp"); //로그인 후 이동할 페이지
		}else {
			forward = new ActionForward(true, request.getContextPath()+"/app/user/loginview.jsp?flag=false");
		}
		return forward;
	}
}








