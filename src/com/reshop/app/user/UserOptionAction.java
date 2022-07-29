package com.reshop.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.useroption.dao.UserOptionDAO;
import com.reshop.app.useroption.dao.UserOptionDTO;

public class UserOptionAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();

		UserOptionDAO uodao = new UserOptionDAO();
		UserOptionDTO uodto = new UserOptionDTO();

		String userid = (String) session.getAttribute("login_id");
		String classify_prod = "";
		String dosdivision = request.getParameter("dosdivision");
		int clothingcnt = Integer.parseInt(request.getParameter("clothingcnt"));
		String brand = request.getParameter("brand");
		String doorpw = request.getParameter("doorpw");
		String useraddr = request.getParameter("useraddr");
		String useraddrdetail = request.getParameter("useraddrdetail");
		String useraddretc = request.getParameter("useraddretc");
		String userphone = request.getParameter("userphone");

		String items[] = request.getParameterValues("item");
		classify_prod = items[0];
		for (int i = 1; i < items.length; i++) {
			classify_prod += "@" + items[i];
		}

		ActionForward forward = new ActionForward();

		uodto.setDosdivision(dosdivision);
		uodto.setUserid(userid);
		uodto.setClassify_prod(classify_prod);
		uodto.setClothingcnt(clothingcnt);
		uodto.setBrand(brand);
		uodto.setDoorpw(doorpw);
		uodto.setUseraddr(useraddr);
		uodto.setUseraddrdetail(useraddrdetail);
		uodto.setUseraddretc(useraddretc);
		uodto.setUserphone(userphone);

		uodto.setUserid(userid);
		uodto.setClassify_prod(classify_prod);
		uodto.setClothingcnt(clothingcnt);
		uodto.setBrand(brand);
		uodto.setDoorpw(doorpw);
		uodto.setUseraddr(useraddr);
		uodto.setUseraddrdetail(useraddrdetail);
		uodto.setUseraddretc(useraddretc);
		uodto.setUserphone(userphone);

		if (uodao.option(uodto)) {
			forward.setRedirect(true);
			forward = new ActionForward(true, request.getContextPath() + "/app/user/sellordonateview.jsp");
		}

		return forward;
	}

}
