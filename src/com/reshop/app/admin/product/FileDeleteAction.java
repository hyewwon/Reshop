package com.reshop.app.admin.product;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.admin.product.dao.FileDAO;
import com.reshop.app.admin.product.dao.FileDTO;

public class FileDeleteAction implements Action{
 @Override
public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	 FileDAO fdao = new FileDAO();
	 int prodnum = Integer.parseInt(request.getParameter("prodnum"));
	 System.out.println("qqqq"+prodnum);
	 boolean flag = true;
	 
	 
	 ActionForward forward = new ActionForward();
	 forward.setRedirect(true);
	 List<FileDTO> files = fdao.getFiles(prodnum);
	 if(files.size()>0) {
		 for(FileDTO f : files) {
			 File file = new File("D:\\1900_WEB_SYC\\JSP\\workspace\\RESHOP\\WebContent\\app\\file", f.getSystemname());
				if(file.exists()) {
					//실제 파일이 있다면 지워주기
					file.delete();
				}
				//꺼내온 DTO의 실존파일은 삭제되었으므로 DB에서도 삭제해주기
				flag = fdao.deleteFileByName(f.getSystemname());
				forward.setPath(request.getContextPath()+"/admin/ProductModify.pd");
				if(!flag) {
					//DB에서 File정보 지우기 실패했다면 for문 탈출 후 삭제 진행 멈추기
					break;
				}
		 }
	 }
	 return forward;
	 
	 
}
}
