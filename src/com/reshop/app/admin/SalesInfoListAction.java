package com.reshop.app.admin;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reshop.app.admin.dao.DonaSellDAO;
import com.reshop.app.admin.dao.DonaSellDTO;
import com.reshop.action.Action;
import com.reshop.action.ActionForward;

public class SalesInfoListAction implements Action {

	@SuppressWarnings("unused")
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String temp = request.getParameter("page");
			ActionForward forward = null;
			String sortColumn = request.getParameter("sort");
			if(sortColumn == null) {sortColumn="0";}
			//정렬할 컬럼타입
			request.setAttribute("sort",sortColumn);
			switch (sortColumn) {
			case "0":
				//단순 번호순
				sortColumn = "DOSNUM ASC";
				break;
			case "1":
				//저가순	
				//오름차순
				sortColumn = "CONNOISSEUR ASC";
				break;
			case "2":
				//고가순
				sortColumn = "CONNOISSEUR DESC NULLS LAST";
				break;
			case "3":
				//시간순
				sortColumn = "UPLOADTIME ASC";
				break;
			case "4":
				//역시간순
				sortColumn = "UPLOADTIME DESC";
				break;
			}
			
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("login_id");
			System.out.println(userid);
			
			if(userid != null) {
				DonaSellDAO ddao = new DonaSellDAO();
				//리스트에서 보여달라고 요청한 페이지
				int page = temp == null?1:Integer.parseInt(temp);
				//한 페이지에 보여질 게시글의 개수
				int pageSize = 20;
				//전체 게시글 개수
				int totalCnt = ddao.getDonaSellCnt(userid);
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
				request.setAttribute("totalPage", totalPage);
				request.setAttribute("totalCnt", totalCnt);
				request.setAttribute("page", page);
				request.setAttribute("startPage", startPage);
				request.setAttribute("endPage", endPage);
				request.setAttribute("donasellList", ddao.getDonaSellList(startRow,endRow,userid,sortColumn));
				//감정가에 ','추가
				//DecimalFormat : 숫자를 특정 format으로 출력하기
				DecimalFormat formatter = new DecimalFormat("###,###");
				ArrayList<DonaSellDTO> DonaSellList = new ArrayList<>(ddao.getDonaSellList(startRow,endRow,userid,sortColumn));
				ArrayList<Integer> rownumList = new ArrayList<>();
				int rownum = (page-1)*pageSize;
				int i = 0;
				ArrayList<String> connoisseurList = new ArrayList<>();
				for (DonaSellDTO value : DonaSellList) {
					i++;
					rownumList.add(rownum+i);
					int tmp = value.getConnoisseur();
					String tmp2 = formatter.format(tmp);
					connoisseurList.add(tmp2);
				}
				//','넣은 감정가
				request.setAttribute("connoisseurList", connoisseurList);
				request.setAttribute("rownumList", rownumList);
				
				String revenug = null;
				//수익
				try {
				 revenug = formatter.format(ddao.getDonaSellrevenug(userid));
				}catch (Exception e) {
					revenug = "0";
				}
				request.setAttribute("revenug", revenug);
				 forward = new ActionForward(false,"/app/admin/salesinfolist.jsp");
			}else {
				 forward = new ActionForward(false,"/app/user/loginview.jsp?login=false");
			}
			return forward;
		}

}
