package com.reshop.app.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.dao.OrderDAO;
import com.reshop.app.admin.dao.OrderDTO;

public class DateSearchAction implements Action {
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      String temp = request.getParameter("page");
      OrderDAO odao = new OrderDAO();
      //리스트에서 보여달라고 요청한 페이지
      int page = temp == null?1:Integer.parseInt(temp);
      //한 페이지에 보여질 게시글의 개수
      int pageSize = 10;
      //전체 게시글 개수
      int totalCnt = odao.getOrderCnt();
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
      
      int startyear = Integer.parseInt(request.getParameter("startyear"));
      String startmonth = request.getParameter("startmonth");
      int startday = Integer.parseInt(request.getParameter("startday"));
      int finishyear = Integer.parseInt(request.getParameter("finishyear"));
      String finishmonth = request.getParameter("finishmonth");
      int finishday = Integer.parseInt(request.getParameter("finishday"));

      if(startmonth.length() == 1) {
          startmonth = "0"+startmonth;
       }
       if(finishmonth.length() == 1) {
          finishmonth = "0"+finishmonth;
       }

      
      String startdate = startyear+"-"+startmonth+"-"+startday;
      String finishdate = finishyear+"-"+finishmonth+"-"+finishday;
      System.out.println(finishdate);
      
      
      List<OrderDTO> odto = odao.datesearch(startdate, finishdate);
      request.setAttribute("datelist", odto);
      
      
      request.setAttribute("totalPage", totalPage);
      request.setAttribute("totalCnt", totalCnt);
      request.setAttribute("page", page);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      request.setAttribute("OrderList", odao.getOrderList(startRow,endRow));
      request.setAttribute("totalSales", odao.getTotalSales());
      ActionForward forward = new ActionForward(false, "/app/admin/datesearchlist.jsp");
      return forward;
   }
}
//String startdate = startyear+"-"+startmonth+"-"+startday;
//SELECT * FROM PRODSALE WHERE TO_CHAR(UPLOADTIME,'YYYY-MM-DD') BETWEEN #{startdate} AND #{finishdate}