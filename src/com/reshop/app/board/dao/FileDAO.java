package com.reshop.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.reshop.app.mybatis.SqlMapConfig;

public class FileDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public FileDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public boolean insertFile(FileDTO file) {
		return 1 == sqlsession.insert("Boardfile.insertFile",file);
	}
	
	public boolean insertFile2(FileDTO file) {
		return 1 == sqlsession.insert("Boardfile.insertFile2",file);
	}
	
	public boolean insertFile3(FileDTO file) {
		return 1 == sqlsession.insert("Boardfile.insertFile3",file);
	}
	
	public List<FileDTO> getFiles(int notice_num) {
		List<FileDTO> files = sqlsession.selectList("Boardfile.getFiles",notice_num);
		return files;
	}

	public List<FileDTO> getFiles2(int quest_num) {
		List<FileDTO> files = sqlsession.selectList("Boardfile.getFiles2",quest_num);
		return files;
	}
	
	public List<FileDTO> getFiles3(int news_num) {
		List<FileDTO> files = sqlsession.selectList("Boardfile.getFiles3",news_num);
		return files;
	}
	
	public boolean deleteFileByName(String systemname) {
		return 1==sqlsession.delete("Boardfile.deleteFileByName",systemname);
	}
}








