package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BookStoreDAO;
import com.example.demo.dao.BorrowDAO;
import com.example.demo.dao.FolderDAO;

@Controller
public class DetailBookController {
	@Autowired
	private BookDAO dao;

	public void setDao(BookDAO dao) {
		this.dao = dao;
	}

	@Autowired
	private FolderDAO fdao;
	
	public void setFdao(FolderDAO fdao) {
		this.fdao = fdao;
	}

	@Autowired
	private BorrowDAO bdao;
	
	public void setBdao(BorrowDAO bdao) {
		this.bdao = bdao;
	}





	@RequestMapping("/detailBook.do")
	public void list(int b_no, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		
		if (session.getAttribute("cust_no")==null) {
			model.addAttribute("d","로그인 후에 사용하실 수 있습니다");

		}else {
			HashMap map = new HashMap();
			int cust_no  =  (int) session.getAttribute("cust_no");

			System.out.println("cust_no : ddddddddd?s" + cust_no);
			map.put("cust_no",cust_no);
			model.addAttribute("f",fdao.findByNo(map));


		}
		//현재 재고 수량
		//int b_count = dao.calB_count(b_no);
		//사용자가 대여한 수량
		int b_count2 = bdao.calB_no(b_no);
		//int sumbook = b_count - b_count2;
		model.addAttribute("b", dao.findByNo(b_no));
		model.addAttribute("sumbook",b_count2);
		model.addAttribute("query", request.getParameter("query"));
		System.out.println(request.getParameter("query"));
	}
}
