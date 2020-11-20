package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.FolderVO;

public class MyPageManager {

public static SqlSessionFactory sqlSessionFactory;
	
	static {
		String resource = "com/example/demo/db/sqlMapConfig.xml";
		try {
		InputStream inputStream=Resources.getResourceAsStream(resource);		
		sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
		}catch (Exception e) {
			System.out.print("�삁�쇅諛쒖깮:"+e.getMessage());
		}
	}
	
	// 마이페이지 폴더목록
	public static List<FolderVO> getUserFolder(int cust_no){
		List<FolderVO> flist = null;
		SqlSession session = sqlSessionFactory.openSession();
		flist = session.selectList("mypage.selectAllFolder", cust_no);
		session.close();
		return flist;
	}

	// 마이페이지 폴더개수
	public static int folder_cnt(int cust_no){
		int re = 0;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.selectOne("mypage.selectFolder_cnt", cust_no);
		session.close();
		return re;
	}
	
	// 폴더 속 파일 목록
	public static FolderVO finbyFol_no(HashMap map) {
		FolderVO f = null;
		SqlSession session = sqlSessionFactory.openSession();
		f = session.selectOne("mypage.selectByFolder", map);
		session.close();
		return f;
	}
}
