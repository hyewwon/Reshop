package com.reshop.app.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.app.admin.dao.DeliverDAO;
import com.reshop.app.admin.dao.DeliverDTO;
import com.reshop.app.admin.dao.OrderDAO;
import com.sun.istack.internal.NotNull;
import com.reshop.action.Action;
import com.reshop.action.ActionForward;

public class ShoppingInfoListAction implements Action {

	@SuppressWarnings("unused")
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String temp = request.getParameter("page");
			ActionForward forward = null;
			//if(temp.equals("0")) {temp = "1";}
			String sortColumn = request.getParameter("sort");
			if(sortColumn == null) {sortColumn="0";}
			//정렬할 컬럼타입
			request.setAttribute("sort",sortColumn);
			String condition = null;
			switch (sortColumn) {
			case "0":
				//단순 번호순
				sortColumn = "MNG_NUM ASC";
				break;
			case "1":
				//취소내역 조회	
				sortColumn = "CANCEL_REFUND ASC";
				condition = "CANCEL_REFUND LIKE '취소%'";
				break;
			case "2":
				//환불내역 조회
				sortColumn = "CANCEL_REFUND ASC";
				condition =  "CANCEL_REFUND LIKE '환불%'";
				break;
			case "3":
				//시간순
				sortColumn = "ORDERDATE ASC";
				break;
			case "4":
				//역시간순
				sortColumn = "ORDERDATE DESC";
				break;
			}
			
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("login_id");
			if(userid != null) {
			OrderDAO odao = new OrderDAO();
			//리스트에서 보여달라고 요청한 페이지
			int page = temp == null?1:Integer.parseInt(temp);
			//한 페이지에 보여질 게시글의 개수
			int pageSize = 20;
			//전체 게시글 개수
			int totalCnt = odao.getShoppingCnt(userid);
			//보여줘야되는 마지막 게시글의 rownum
			int endRow = page*pageSize;
			//보여줘야되는 첫번째 게시글의 rownum
			int startRow = endRow-(pageSize-1);
			
			//아래쪽 페이징처리의 보여지는 첫번째 페이지 번호
			int startPage = ((page-1)/pageSize)*pageSize+1;
			//아래쪽 페이징처리의 보여지는 마지막 페이지 번호
			int endPage = startPage+pageSize-1;
			//가장 마지막 페이지 번호
			int totalPage = (totalCnt-1)/pageSize+1;
			//가장 마지막 페이지 번호보다 연산으로 구해진 endPage가 더 큰 경우도 있다.
			//그때는 endPage를 가장 마지막 페이지로 바꾸어준다.
			endPage = endPage>totalPage?totalPage:endPage;
			
			//취소신청 확인, 요청없으면 null에러뜸 예외처리로 무시 
			try {
				String cancel = request.getParameter("cancel");
				if(cancel == null) {throw new NumberFormatException();}
				System.out.println("cancel"+cancel);
				if(odao.updateCancel(cancel)) {
					System.out.println("취소 성공");
				}else {
					request.setAttribute("cancelflag", false);
					System.out.println("취소 실패");
				}
				System.out.println(1);
			}catch(NumberFormatException e){}
			catch(Exception e) {
				System.out.println("cancel : "+e);
			}
			//환불신청 확인
			try {
				String refund = request.getParameter("refund");
				if(refund == null) {throw new NumberFormatException();}
				System.out.println("refund"+refund);
				if(odao.updateRefund(refund)) {
					System.out.println("환불요청 성공");
				}else {
					request.setAttribute("refundflag", false);
					System.out.println("환불 실패");
				}
			} catch(NumberFormatException e){}
			catch(Exception e) {
				System.out.println("refund : "+e);
			}
			
			//정렬번호 생성
			ArrayList<Integer> rownumList = new ArrayList<>();
			int rownum = (page-1)*pageSize;
			for (int i = 1; i <= pageSize; i++) {
				rownumList.add(rownum+i);
			}
			request.setAttribute("rownumList", rownumList);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("totalCnt", totalCnt);
			request.setAttribute("page", page);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("shoppingList", odao.getShoppingList(startRow,endRow,userid,sortColumn,condition));
			DeliverDAO ddao = new DeliverDAO();
			ArrayList<Integer> delumList = new ArrayList<>();
			if(ddao.getDelverynumList().size() != 0) {
				delumList = (ArrayList<Integer>) ddao.getDelverynumList();
			}else {
				delumList.add(0);
			}
			request.setAttribute("delnumList",delumList);
			
				forward = new ActionForward(false,"/app/admin/shoppinginfolist.jsp");
			}else {
				forward = new ActionForward(false,"/app/user/loginview.jsp?login=false");
			}
			return forward;
		}

}
