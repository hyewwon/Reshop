package com.reshop.app.admin.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.product.dao.ProductDAO;

public class ProductListForUserAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String temp = request.getParameter("page");
		
		String sortColumn = request.getParameter("sort");
		if(sortColumn == null) {sortColumn="4";}
		
		//정렬할 컬럼타입
		request.setAttribute("sort",sortColumn);
		
		//기본값이 4: 신상품순
		switch (sortColumn) {
		case "1":
			//저가순	
			sortColumn = "PRICE ASC";
			break;
		case "2":
			//고가순
			sortColumn = "PRICE DESC NULLS LAST";
			break;
		case "3":
			//오래된 상품순
			sortColumn = "UPLOADTIME ASC";
			break;
		case "4":
			//신상품순
			sortColumn = "UPLOADTIME DESC";
			break;
		}
		
		ProductDAO pdao = new ProductDAO();
		//리스트에서 보여달라고 요청한 페이지
		int page = temp == null?1:Integer.parseInt(temp);
		//한 페이지에 보여질 게시글의 개수
		int pageSize = 9;
		//전체 게시글 개수
		int totalCnt = pdao.getProdCntForUser();
		//보여줘야되는 마지막 게시글의 rownum
		int endRow = page*pageSize;
		//보여줘야되는 첫번째 게시글의 rownum
		int startRow = endRow-(pageSize-1);
		
		//아래쪽 페이징처리의 보여지는 첫번째 페이지 번호
		int startPage = ((page-1)/pageSize)*pageSize+1;
		//아래쪽 페이징처리의 보여지는 마지막 페이지 번호
		int endPage = startPage+9;
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
		
		request.setAttribute("prodList", pdao.getProdListForUser(startRow,endRow,sortColumn));
		
		ActionForward forward = new ActionForward(false,"/app/order/shoppingview.jsp");
		return forward;
	}
	

}
