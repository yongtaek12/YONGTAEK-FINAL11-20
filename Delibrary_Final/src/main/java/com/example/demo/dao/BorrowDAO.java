package com.example.demo.dao;



import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.BookManager;
import com.example.demo.db.BorrowManager;
import com.example.demo.db.CustomerManager;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.BorrowVO2;

@Repository
public class BorrowDAO {
	
	 public int insertBorrow(BorrowVO b) {
		return BorrowManager.insertBorrow(b);
	}
	
	
	public int getNextNo() {
		return BorrowManager.getNextNo();
	}
	//북카트 목록 출력
	public List<BorrowVO2> selectBycust_No(HashMap map){
		return BorrowManager.selectBycust_No(map);
	}


	public int update(BorrowVO b) {
		// TODO Auto-generated method stub
		return BorrowManager.update(b);
	}
	//


	public int delete(int bor_no) {
		// TODO Auto-generated method stub
		return BorrowManager.delete(bor_no);
	}
	public int calB_no(int cust_no) {
		return BorrowManager.calB_no(cust_no);
	}
	// 모든 정보 가져오기[재성]
	public List<BorrowVO> findAll() {
		return BorrowManager.findAll();

	}
}
