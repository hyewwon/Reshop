package com.reshop.app.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.filechooser.FileNameExtensionFilter;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.reshop.action.Action;
import com.reshop.action.ActionForward;
import com.reshop.app.board.dao.NoticeDAO;
import com.reshop.app.board.dao.NoticeDTO;
import com.reshop.app.board.dao.FileDAO;
import com.reshop.app.board.dao.FileDTO;

public class NoticeModifyOkAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		NoticeDAO ndao = new NoticeDAO();
		FileDAO fdao = new FileDAO();
		String saveFolder = request.getServletContext().getRealPath("app/file");
		int size = 5 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request,saveFolder, size, "UTF-8",
				new DefaultFileRenamePolicy());

		String notice_title = multi.getParameter("notice_title");
		String notice_contents = multi.getParameter("notice_contents");
		int notice_num = Integer.parseInt(multi.getParameter("notice_num"));
		NoticeDTO notice = new NoticeDTO();
		notice.setNotice_title(notice_title);
		notice.setNotice_contents(notice_contents);
		notice.setNotice_num(notice_num);

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		if (ndao.updateNotice(notice)) {
			// 방금 수정을 통해서 올린 파일의 시스템네임 배열
			String[] filename = { multi.getFilesystemName("file1"), multi.getFilesystemName("file2") };
			// 방금 수정을 통해서 올린 파일의 원래 이름 배열
			String[] orgname = { multi.getOriginalFileName("file1"), multi.getOriginalFileName("file2") };
			// 원래 이 글에 등록되어있던 파일들의 정보들
			List<FileDTO> files = fdao.getFiles(notice_num);
			// 새롭게올린(혹은 수정이 안된) 파일들의 원래 이름 배열
			// ////////////////////////////////
	
			String[] filenames = multi.getParameterValues("filename");
			// 올린 파일들의 개수를 파악하기 위한 로직
			int cnt = 0;
			if (filenames != null) {
				for (int i = 0; i < filenames.length; i++) {
					if (filenames[i] != null && !filenames[i].equals("")) {
						cnt++;
					}
				}

				// 올린 파일들의 개수만큼 반복하면서
				for (int i = 0; i < cnt; i++) {
					if (filename[i] == null) {
					} else {
						if (files.size() >= cnt) {
							// 기존에 존재하던 파일을 객체로 불러오기
							File file = new File(saveFolder,
									files.get(i).getSystemname());
							// 실제 위치에 그 파일이 존재한다면
							if (file.exists()) {
								// 해당 파일 삭제
								file.delete();
							}

							// 실제 파일이 삭제되었으므로 DB상에서도 정보를 지워줘야 한다.
							fdao.deleteFileByName(files.get(i).getSystemname());
						}
						// DB에 새롭게 올린 파일의 정보를 등록하는 과정
						FileDTO fdto = new FileDTO();
						fdto.setNotice_num(notice_num);
						fdto.setSystemname(filename[i]);
						fdto.setOrgname(orgname[i]);
						fdao.insertFile(fdto);
					}
				}
			}
			forward.setPath(request.getContextPath() + "/board/NoticeView.bo?notice_num=" + notice_num);
		} else {
			forward.setPath(request.getContextPath() + "/board/NoticeList.bo?update=false");
		}
		return forward;
		
	}
	
}
