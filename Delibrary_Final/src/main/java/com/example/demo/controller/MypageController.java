package com.example.demo.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.MypageDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.dao.ReplyDAO;
import com.example.demo.vo.PostVO;

@Controller
public class MypageController {
	
	public static int totalFol = 0;
	public static int totalFile = 0;
	
	public static int updateHit=0;
	public static int pageSIZE =  2;
	public static int totalCount  = 0;
	public static int totalPage = 1;
	public static int nextId;
	public static int nextNo;
	
	@Autowired
	private MypageDAO dao;
	public void setDao(MypageDAO dao) {
		this.dao = dao;
	}
	
	@Autowired
	private CustomerDAO dao2;
	public void setDao2(CustomerDAO dao2) {
		this.dao2 = dao2;
	}
	
	@Autowired
	private PostDAO dao3;
	public void setDao3(PostDAO dao3) {
		this.dao3 = dao3;
	}
	
	@Autowired
	private ReplyDAO re_dao;
	public void setRe_dao(ReplyDAO re_dao) {
		this.re_dao = re_dao;
	}
	
	// 마이페이지 폴더 보기2
	@RequestMapping("/MyPage_Folder.do")
	public void mypageFolder2(int cust_no, HttpServletRequest request, Model model) {
		cust_no = Integer.parseInt(request.getParameter("cust_no"));
		request.setAttribute("c", dao2.findByCust_No(cust_no));
		request.setAttribute("flist", dao.getUserFolder(cust_no));
		request.setAttribute("cust_no", cust_no);
		
		totalFol = dao.folder_cnt(cust_no);
		
		model.addAttribute("totalFol", totalFol);
	}
	// 마이페이지 폴더에서 클릭하면 파일 나열하기2
	@RequestMapping("/MyPage_File.do")
	public void postList2(int cust_no, int fol_no, HttpServletRequest request,  HttpSession session, Model model, String group, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM) {
		cust_no = Integer.parseInt(request.getParameter("cust_no"));
		fol_no = Integer.parseInt(request.getParameter("fol_no"));

		HashMap map=new HashMap();
		map.put("group", group);
		map.put("cust_no", cust_no);
		map.put("fol_no", fol_no);
		
		request.setAttribute("c", dao2.findByCust_No(cust_no));
		request.setAttribute("f", dao.getFol_one(map));
		request.setAttribute("cust_no", cust_no);
		request.setAttribute("fol_no", fol_no);
		
		model.addAttribute("list", dao3.findAll_fol(map));
		model.addAttribute("group", group);
	}
	
	// 마이페이지 파일 상세보기
	@RequestMapping("/MyPage_DetailFile.do")
	public void detail(int p_id, String group, Model model, HttpServletRequest request,  HttpSession session) {
		HashMap map = new HashMap();
		map.put("p_id", p_id);
		map.put("group", group);
		PostVO p = dao3.findById(map);

		if(session.getAttribute("p_content") != null) {
			String p_content = (String) session.getAttribute("p_content");
			p.setP_content(p_content);
		}
		
		model.addAttribute("group",group);
		model.addAttribute("p", p);
		model.addAttribute("listReply",re_dao.findAll(map));
		
//		int cust_no = (int)session.getAttribute("cust_no");
//		request.setAttribute("c", dao2.findByCust_No(cust_no));
		
	}
	
}
