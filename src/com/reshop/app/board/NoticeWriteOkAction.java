package com.reshop.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NoticeDAO;
import com.reshop.app.board.dao.NoticeDTO;
import com.reshop.app.board.dao.FileDAO;
import com.reshop.app.board.dao.FileDTO;

public class NoticeWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		request.setCharacterEncoding("UTF-8");
		
		//파일이 저장될 경로
		String saveFolder = request.getServletContext().getRealPath("app/file");
		int size = 5*1024*1024;
		
		//form에서 enctype을 multipart/form-data 로 보냈다면 필요한 객체
		MultipartRequest multi = new MultipartRequest(request, saveFolder,
				size,"UTF-8",new DefaultFileRenamePolicy());
		
		boolean fcheck1 = false;
		boolean fcheck2 = false;
		
		//파일을 올렸을 때 실제 서버에 저장되어 있는 파일의 이름
		String filename1 = multi.getFilesystemName("file1");
		if(filename1 == null) {
			//file1 태그에 아무 파일도 업로드 하지 않은경우
			fcheck1 = true;
		}
		//파일을 올릴 때 사용자가 올렸던 이름(다운로드시에는 이 이름으로 다운로드 되게 해야함)
		String orgname1 = multi.getOriginalFileName("file1");
		
		String filename2 = multi.getFilesystemName("file2");
		if(filename2 == null) {
			//file2 태그에 아무 파일도 업로드 하지 않은경우
			fcheck2 = true;
		}
		String orgname2 = multi.getOriginalFileName("file2");
		
		//fcheck1이나 fcheck2가 false로 남아있다면 어떤 파일을 올렸다는 뜻
		//multipart/form-data 로 보냈다면 request가 아니라 위에서 만들어준 MultipartRequest 객체로
		//보내준 데이터들을 받아야 한다.
		String notice_title = multi.getParameter("notice_title");
		String notice_contents = multi.getParameter("notice_contents");
		String userid = multi.getParameter("userid");
		
		NoticeDTO notice = new NoticeDTO();
		notice.setNotice_title(notice_title);
		notice.setNotice_contents(notice_contents);
		notice.setUserid(userid);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		
		if(ndao.insertNotice(notice)) {
			//현재 추가된 보드 번호(해당 파일들이 올라가있는 게시글 번호)
			int notice_num = ndao.getSeq(userid);
			
			if(!fcheck1) {
				FileDTO file = new FileDTO();
				file.setNotice_num(notice_num);
				file.setSystemname(filename1);
				file.setOrgname(orgname1);
				//DB에다가 파일 정보 추가
				//파일 정보를 디비에 추가 시도(실패했다면 fcheck1이 false로 남아있음 / 성공이라면 true로 바뀜)
				fcheck1 = fdao.insertFile(file);
			}
			if(!fcheck2) {
				FileDTO file = new FileDTO();
				file.setNotice_num(notice_num);
				file.setSystemname(filename2);
				file.setOrgname(orgname2);
				//DB에다가 파일 정보 추가
				fcheck2 = fdao.insertFile(file);
			}
			
			//fcheck1과 fcheck2가 둘다 true라는 뜻은 아무 파일도 안올렸거나, 파일 업로드를 성공한 경우
			if(fcheck1 && fcheck2) {
				forward.setPath(request.getContextPath()+"/board/NoticeView.bo?notice_num="+notice_num);
			}else {
				forward.setPath(request.getContextPath()+"/board/NoticeList.bo?flag=false");
				ndao.deleteNotice(notice_num);
			}
		}else {
			forward.setPath(request.getContextPath()+"/board/NoticeList.bo?flag=false");
		}
		return forward;
	}
}











