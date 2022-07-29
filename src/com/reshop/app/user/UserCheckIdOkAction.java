package com.reshop.app.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDAO;

public class UserCheckIdOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserDAO udao = new UserDAO();
		String userid = request.getParameter("userid");
		PrintWriter out = response.getWriter();
		if(udao.checkId(userid)) {
			out.write("O");
		}else {
			out.write("X");
		}
		out.close();
		return null;
	}
}













