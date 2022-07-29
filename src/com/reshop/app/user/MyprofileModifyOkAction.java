package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDAO;
import com.reshop.app.user.dao.UserDTO;

public class MyprofileModifyOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		UserDAO udao = new UserDAO();
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String username = request.getParameter("username");
		String usernick = request.getParameter("usernick");
		int userage = Integer.parseInt(request.getParameter("userage"));
		String userphone = request.getParameter("userphone");
		String useraddr = request.getParameter("useraddr");
		String useraddrdetail = request.getParameter("useraddrdetail");
		String useraddretc = request.getParameter("useraddretc");
		
		System.out.println(userpw);
		
		
		UserDTO udto = new UserDTO();
		
		udto.setUserid(userid);
		udto.setUserpw(userpw);
		udto.setUsername(username);
		udto.setUsernick(usernick);
		udto.setUserage(userage);
		udto.setUserphone(userphone);
		udto.setUseraddr(useraddretc);
		udto.setUseraddrdetail(useraddrdetail);
		udto.setUseraddretc(useraddretc);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(udao.myprofileupdate(udto)) {
			forward.setPath(request.getContextPath()+"/user/MyProfile.us?update=true");
		}else {
			forward.setPath(request.getContextPath()+"/user/MyProfile.us?update=false");
			
		}
		return forward;
	}
	}
