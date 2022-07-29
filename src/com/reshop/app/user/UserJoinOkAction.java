package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.app.user.dao.UserDAO;
import com.reshop.app.user.dao.UserDTO;
import com.reshop.action.Action;
import com.reshop.action.ActionForward;

public class UserJoinOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//회원가입 처리
		request.setCharacterEncoding("UTF-8");
		UserDAO udao = new UserDAO();
		UserDTO user = new UserDTO();
		
		user.setUserid(request.getParameter("userid"));
		user.setUserpw(request.getParameter("userpw"));
		user.setUsername(request.getParameter("username"));
		user.setUsernick(request.getParameter("usernick"));
		user.setUserage(Integer.parseInt(request.getParameter("userage")));
		user.setUserphone(request.getParameter("userphone"));
		user.setZipcode(request.getParameter("zipcode"));
		user.setUseraddr(request.getParameter("useraddr"));
		user.setUseraddrdetail(request.getParameter("useraddrdetail"));
		user.setUseraddretc(request.getParameter("useraddretc"));
		user.setMileage(0);
		user.setDonation(0);
		user.setBuy(0);
		user.setUsergender(request.getParameter("usergender"));
		user.setUserclass(0);
		ActionForward forward=null;
		if(udao.join(user)) {
			//어떤 페이지로 보내주어야 하는지
			//어떤 방식으로 이동할 것인지(redirect/forward)
			//Redirect 방식 : 이전의 root 경로도 없어지기 때문에 
			//반드시 경로 앞에 request.getContextPath()를 연결해준다.
			//Forward 방식 : / 앞의 root 경로가 남아있기 때문에 절대 연결해주면 안된다.
			forward = new ActionForward(true, request.getContextPath()+"/app/user/loginview.jsp");
		}
		return forward;
	}
}












