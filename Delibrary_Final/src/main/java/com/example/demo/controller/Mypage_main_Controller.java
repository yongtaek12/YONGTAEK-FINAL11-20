package com.example.demo.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.vo.CustomerVO;

@Controller
public class Mypage_main_Controller {
	@Autowired
	private CustomerDAO dao;

	public void setDao(CustomerDAO dao) {
		this.dao = dao;
	}
	
	//나의도서정보 연결
	@RequestMapping("/mypage_main.do")
	public void detail2(Model model, HttpServletRequest request) {
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		CustomerVO c = dao.findByCust_No(cust_no);

		request.setAttribute("c", c);
		String Email = c.getEmail();
		String id = Email.substring(0, Email.indexOf("@"));
		String email = Email.substring(Email.indexOf("@")+1);
		request.setAttribute("id", id);
		request.setAttribute("email", email);

		// 현왕 주소 유지되게끔 설정 ==================================================================================
		String addr2 = c.getAddr2();
		String addr_num = addr2.substring(0, addr2.indexOf(","));
		String addr_ref = addr2.substring(addr2.indexOf(",")+1);

		String addr = c.getAddr();
		String addr_1 = addr.substring(0, addr.indexOf(","))+addr_ref;
		String addr_2 = addr.substring(addr.indexOf(",")+1);

		request.setAttribute("addr_1", addr_1);
		request.setAttribute("addr_2", addr_2);
		request.setAttribute("addr_num", addr_num);
		request.setAttribute("addr_ref", addr_ref);
		// =====================================================================================================>

		model.addAttribute("c",dao.findByCust_No(cust_no));
	}

}