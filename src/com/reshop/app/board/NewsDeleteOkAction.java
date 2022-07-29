package com.reshop.app.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.FileDAO;
import com.reshop.app.board.dao.FileDTO;
import com.reshop.app.board.dao.NewsDAO;

public class NewsDeleteOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NewsDAO wdao = new NewsDAO();
		FileDAO fdao = new FileDAO();
		int news_num = Integer.parseInt(request.getParameter("news_num"));
		boolean flag = true;
		boolean fflag = true;
		ActionForward forward = new ActionForward();
		String saveFolder = request.getServletContext().getRealPath("app/file");
		List<FileDTO> files = fdao.getFiles3(news_num);
		if(files.size()>0) {
			//검색된 무언가가 있다면
			for(FileDTO f : files) {
				//해당 DTO들 하나씩 꺼내오면서, 실존하는 파일 객체 만들기
				File file = new File(saveFolder, f.getSystemname());
				if(file.exists()) {
					//실제 파일이 있다면 지워주기
					file.delete();
				}
				//꺼내온 DTO의 실존파일은 삭제되었으므로 DB에서도 삭제해주기
				flag = fdao.deleteFileByName(f.getSystemname());
				if(!flag) {
					//DB에서 File정보 지우기 실패했다면 for문 탈출 후 삭제 진행 멈추기
					break;
				}
			}
		}
		
		if(!flag || !fflag) {

			forward.setPath(request.getContextPath()+"/board/NoticeList.bo?delete=false");
			return forward;
		}
		if(wdao.deleteNews(news_num)) {
			forward.setPath(request.getContextPath()+"/board/NoticeList.bo");
		}else {
			forward.setPath(request.getContextPath()+"/board/NoticeList.bo?delete=false");
		}
		return forward;
		
		
	}
}
