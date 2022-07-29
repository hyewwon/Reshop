package com.reshop.app.admin.product.dao;

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
		return 1 == sqlsession.insert("File.insertFile",file);
	}

	public List<FileDTO> getFiles(int prodnum) {
		List<FileDTO> files = sqlsession.selectList("File.getFiles",prodnum);
		return files;
	}

	public boolean deleteFileByName(String systemname) {
		return 1==sqlsession.delete("File.deleteFileByName",systemname);
	}

	
}