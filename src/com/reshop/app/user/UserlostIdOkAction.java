package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.user.dao.UserDAO;


public class UserlostIdOkAction implements Action {
@Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	request.setCharacterEncoding("UTF-8");
	UserDAO udao = new UserDAO();
	
	
	String username = request.getParameter("username");
	String userphone = request.getParameter("userphone");
	ActionForward forward=null;
	
	request.setAttribute("lostId",udao.lostId(username,userphone));
//	forward = new ActionForward(true, request.getContextPath()+"/app/user/lostIdtrue.jsp");
	forward = new ActionForward(false,"/app/user/lostIdtrue.jsp");
	
//	
//	if(udao.lostId(username,userphone)) {
//		System.out.println("2번");
//		//어떤 페이지로 보내주어야 하는지
//		//어떤 방식으로 이동할 것인지(redirect/forward)
//		//Redirect 방식 : 이전의 root 경로도 없어지기 때문에 
//		//반드시 경로 앞에 request.getContextPath()를 연결해준다.
//		//Forward 방식 : / 앞의 root 경로가 남아있기 때문에 절대 연결해주면 안된다.
//		forward = new ActionForward(true, request.getContextPath()+"/app/user/lostIdtrue.jsp");
//	}
	return forward;
}
}
