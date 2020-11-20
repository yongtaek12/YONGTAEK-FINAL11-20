package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.MyPageManager;
import com.example.demo.vo.FolderVO;

@Repository
public class MypageDAO {

	public List<FolderVO> getUserFolder(int cust_no) {
		return MyPageManager.getUserFolder(cust_no);
	}
	
	public int folder_cnt(int cust_no) {
		return MyPageManager.folder_cnt(cust_no);
	}
	
	public FolderVO getFol_one(HashMap map) {
		return MyPageManager.finbyFol_no(map);
	}
}
