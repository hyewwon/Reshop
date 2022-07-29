package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDAO;

public class UserLoginOutAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.getSession().setAttribute("login_id", null);
		ActionForward forward = null;
		forward = new ActionForward(true,request.getContextPath()+"/index.jsp"); //로그아웃 후 이동할 페이지
		return forward;
	}
}








