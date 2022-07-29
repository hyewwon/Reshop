package com.reshop.app.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.ActionForward;

public class UserFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String requestURI = req.getRequestURI();  		//요청한 URI
		String contextPath = req.getContextPath(); 		//최상위 경로
		String command = requestURI.substring(contextPath.length());
		ActionForward forward = null; 
		
		switch(command) {
		//신영환
		case "/user/UserJoinOk.us":
			//회원가입
			try {
				forward = new UserJoinOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserJoinOk : "+e);
			}
			break;
			
		case "/user/CheckIdOk.us":
			try {
				forward = new UserCheckIdOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("CheckIdOk : "+e);
			}
			break;
			
		case "/user/UserlostIdOk.us":
			try {
				forward = new UserlostIdOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserlostIdOk : "+e);
			}
			break;
		case "/user/UserLoginOk.us":
			try {
				forward = new UserLoginOkAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserLoginOk : "+e);
			}
			break;
			
		//신예찬 : 로그아웃 추가
		case "/user/UserLogoutOk.us":
			try {
				forward = new UserLoginOutAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("UserLoginOut : "+e);
			}
			break;
			
		//김도현
		case "/user/UserOption.us":
			// 판매 혹은 기부
			try {
				forward = new UserOptionAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("UserOption : " + e);
			}
			break;
			
		//박성훈
		 case "/user/ManageUser.us":
	         //고객관리
	         try {
	            forward = new UserListAction().execute(req, resp);
	         } catch (Exception e) {
	            System.out.println("UserListAction : "+e);
	         }
	         break;
		case "/user/PassengerCheck.us":
			//고객관리
			try {
				forward = new PassengerCheckAction().execute(req, resp);
			} catch (Exception e) {
					System.out.println("PassengerCheckAction : "+e);
			}
			break;
		case "/user/PassUpdateCheck.us":
			//고객 정보 수정
			try {
				forward = new UpdatePassOkAction().execute(req, resp);
			} catch (Exception e) {
					System.out.println("UpdatePassOkAction : "+e);
			}
			break;
		case "/user/PassModifyOk.us":
			try {
				forward = new PassModifyOkAction().execute(req, resp);
			} catch (Exception e) {
					System.out.println("PassModifyOkAction : "+e);
			}
			break;
		case "/user/DeleteUser.us":
			try {
				forward = new DeleteUserAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("DeleteUserAction : "+e);
			}
			break;
			
		//김혜원
			case "/user/NormprodSelected.us" :
				
				try {
					forward = new NormprodSelectedAction().execute(req,resp);
				} catch (Exception e) {
					System.out.println("ProductSelected :"+ e);
				}
				
				break;
				
			case "/user/UpcyledSelected.us" :
				
				try {
					forward = new UpcyledSelectedAction().execute(req,resp);
				} catch (Exception e) {
					System.out.println("UpcyledSelected : "+e);
				}
				break;
		
			//신예찬
			case "/user/MyProfile.us" :
				
				try {
					forward = new MyProfileAction().execute(req,resp);
				} catch (Exception e) {
					System.out.println("MyProfile : "+e);
				}
				break;
			case "/user/MyprofileModifyOk.us" :
				
				try {
					forward = new MyprofileModifyOkAction().execute(req,resp);
				} catch (Exception e) {
					System.out.println("MyprofileModifyOk : "+e);
				}
				break;
			case "/user/MyprofileDelete.us" :
				
				try {
					forward = new MyprofileDeleteOkAction().execute(req,resp);
				} catch (Exception e) {
					System.out.println("MyprofileModifyOk : "+e);
				}
				break;
		}
		
		//이동하는 경로
		if(forward!=null) {
			if(forward.isRedirect()) {
				//Redirect
				resp.sendRedirect(forward.getPath());
			}else {
				//Forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
	}
}
