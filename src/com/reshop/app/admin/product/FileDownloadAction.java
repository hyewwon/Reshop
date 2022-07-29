package com.reshop.app.admin.product;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.reshop.action.Action;
import com.reshop.action.ActionForward;

public class FileDownloadAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		//sysname : 현재 서버에 저장되어 있는 파일의 이름
		String sysname = request.getParameter("filename");//day011.txt
		//orgname : 그 파일을 올릴 때의 이름
		String orgname = request.getParameter("orgname");//day01.txt
		//실제로 파일이 저장되어 있는 폴더 위치
		String savefolder = request.getServletContext().getRealPath("app/file");//D:\.....\file
		
		//실제폴더위치와 저장되어있는 파일 이름을 연결해서 파일의 경로 완성
		//				D:\.....\file	\	day011.txt
		String filename = savefolder+"\\"+sysname;
		System.out.println(filename);
		
		//다운로드를 위한 통로역할
		InputStream is = null;//파일을 쪼개서 읽어올 통로
		OutputStream os = null;//쪼개진 파일을 써줄 통로
		
		//다운받으려는 파일을 자바로 객체로 가져옴
		File file = new File(filename);
		
		//file객체를 읽어오기 위한 통로 개설
		is = new FileInputStream(file);
		
		//현재 다운로드를 원하는 사용자의 로컬정보가 담긴 헤더
		String client = request.getHeader("User-Agent");
		response.reset();
		
		//파일 다운로드 준비를 위한 세팅
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Description", "JSP Generated Data");
		
		//우리가 실제로 다운로드 했을 때 다운로드 될 파일의 이름을 담을 문자열 변수
		String dwName = "";
		
		try {
			try {
				//orgname으로 바꾸어주는 과정 - 만약 orgname과 systemname이 동일하다면 오류발생
				dwName = URLEncoder.encode(orgname,"UTF-8").replaceAll("\\+", "%20");
			}catch(Exception e) {
				//file객체의 이름으로 dwName을 설정
				dwName = URLEncoder.encode(file.getName(),"UTF-8").replaceAll("\\+", "%20");
			}
			//dwName을 인코딩
			dwName = new String(dwName.getBytes("UTF-8"),"ISO-8859-1");
			
			//유저의 로컬정보가 담긴 헤더에 MSIE가 포함되어 있는지를 비교(포함되어 있으면 -1이 아니고 없으면 -1)
			if(client.indexOf("MSIE") != -1) {
				//MSIE 인 경우												fileName=day01.txt
				response.setHeader("Content-Disposition", "attachment; fileName="+dwName); 
			}else {
				//그 외													fileName="day01.txt"
				response.setHeader("Content-Disposition", "attachment; fileName=\""+dwName+"\""); 
				response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
			}
			response.setHeader("Content-Length",file.length()+"");
			
			//사용자가 다운로드를 요청했을 때 실제 파일을 전송해주기 위한 통로
			os = response.getOutputStream();
			
			//파일을 바이트단위로 쪼개서 담아줄 배열
			byte[] b = new byte[(int)file.length()];
			int leng=0;
			//파일의 끝이 오기 전까지 계속 반복
			while((leng = is.read(b,0,b.length))!=-1) {
				//os 통로를 통해 사용자의 컴퓨터에 파일 내용 써주기
				os.write(b,0,leng);
			}
		} catch (Exception e) {
			System.out.println("FileDownloadAction : "+e);
		} finally {
			if(is!=null) {
				is.close();
			}
			if(os!=null) {
				os.close();
			}
		}
		return null;
	}
}
