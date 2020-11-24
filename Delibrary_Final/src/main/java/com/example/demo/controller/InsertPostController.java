package com.example.demo.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.Message;
import com.example.demo.dao.BookDAO;
import com.example.demo.dao.BorrowDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.vo.BookVO;
import com.example.demo.vo.BorrowVO;
import com.example.demo.vo.PostVO;
import com.google.gson.Gson;

@Controller
public class InsertPostController {
	//용택 ajax - insert post and book
	@Autowired
	private PostDAO pdao;
		
	public void setPdao(PostDAO pdao) {
		this.pdao = pdao;
	}
	@Autowired
	private BookDAO bdao;
	
	
	
	public void setBdao(BookDAO bdao) {
		this.bdao = bdao;
	}
	@Autowired
	private BorrowDAO bbdao;
	

	public void setBbdao(BorrowDAO bbdao) {
		this.bbdao = bbdao;
	}

	@RequestMapping(value = "/insertPost", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String insertPost(HttpSession session, HttpServletRequest request) {
		int group=50;
		int fol_no=Integer.parseInt(request.getParameter("FOL_NO"));
		//System.out.println(" 내용 가지나??"+fol_no);

		int p_id=pdao.getNextId(group);
		int p_no = pdao.getNextNo(group);
		
		String fname = request.getParameter("fname");
		String p_title = "내서재의"+fol_no+"글";  
		String p_writer="알수없음";
        int p_hit = 0;
		String p_content = "내용을 입력해주세요";
		int cust_no = Integer.parseInt(request.getParameter("cust_no"));
		
		
		
		PostVO p = new PostVO();
		p.setP_id(p_id);
		p.setP_no(p_no);
		p.setP_title(p_title);
		p.setP_writer(p_writer);
		p.setP_content(p_content);
		p.setP_hit(p_hit);
		p.setFname(fname);
		p.setCust_no(cust_no);
		p.setFol_no(fol_no);
		//		(#{p_id},#{p_no},#{p_title},#{p_writer},#{p_content},#{p_hit},sysdate,#{fname},#{cust_no})



		int re =pdao.insert2(p);		
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}
	
	//대여시 추가되는 책
	@RequestMapping(value = "/insertBook", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String insertBook(HttpSession session, HttpServletRequest request) {
		
		int b_no = bdao.getNextNo();
		String b_title = request.getParameter("b_title");
		String b_publisher = "알수없음";
		String b_writer = request.getParameter("b_writer");
		String String_b_year = request.getParameter("b_year");
		//2015-12-07T00:00:00.000+09:00 나와서 분리 시켜서 db에 넣어야한다.
		StringTokenizer tokenizer = new StringTokenizer(String_b_year, "T");
		String firstToken = tokenizer.nextToken();

		//DATE 변환
		java.sql.Date b_year = java.sql.Date.valueOf(firstToken);



		
		int b_price = Integer.parseInt(request.getParameter("b_price"));

		String b_image = request.getParameter("b_image");
		String b_detail = ""+request.getParameter("b_detail");

		System.out.println("값을 받아옵니다++"+b_detail);

		String b_index = "목차";
		int b_count = 10;

		
		//values(#{b_no},#{b_title},#{b_publisher},#{b_writer},#{b_year},#{b_price},#{b_image},#{b_detail})

		
		BookVO b = new BookVO();
		b.setB_no(b_no);
		b.setB_title(b_title);
		b.setB_publisher(b_publisher);
		b.setB_writer(b_writer);
		b.setB_year(b_year);
		b.setB_price(b_price);
		b.setB_image(b_image);
		b.setB_detail(b_detail);
		b.setB_index(b_index);
		b.setB_count(b_count);
		b.setC_no(1);



		int re =bdao.insertBook(b);		
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
	}
	
	//ajax -borrow 수정
	@RequestMapping(value = "/updateborrow", 
			produces = "application/json;charset=utf8")
	@ResponseBody 
	public String updateDept(HttpSession session, HttpServletRequest request) {
		session = request.getSession(true);
		int cust_no  =  (int) session.getAttribute("cust_no");
		int bor_no = Integer.parseInt(request.getParameter("bor_no"));

		int b_no = Integer.parseInt(request.getParameter("b_no"));

		String return_ok = request.getParameter("return_ok");
		String String_bor_date = request.getParameter("bor_date");
		String String_return_date = request.getParameter("return_date");
		java.sql.Date bor_date = java.sql.Date.valueOf(String_bor_date);
		java.sql.Date return_date = java.sql.Date.valueOf(String_return_date);
		

		BorrowVO b = new BorrowVO();
		b.setB_no(b_no);
		b.setBor_date(bor_date);
		b.setBor_no(bor_no);
		b.setCust_no(cust_no);
		b.setReturn_date(return_date);
		b.setReturn_ok(return_ok);
		int re =bbdao.update(b);		


		
		
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
		//그성공여부를 제이슨으로 반환하고 싶다 인트-->스트링 변환
	}
	
	@RequestMapping(value = "/deleteborrow", 
			produces = "application/json;charset=utf8")
	@ResponseBody
	public String deleteDept(int bor_no) {
		System.out.println("수신된 데이터:"+bor_no);
		int re = bbdao.delete(bor_no);		
		Gson gson = new Gson();
		return gson.toJson(new Message(re+""));
	}
}
