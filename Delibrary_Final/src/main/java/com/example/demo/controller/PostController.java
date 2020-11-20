package com.example.demo.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CustomerDAO;
import com.example.demo.dao.PostDAO;
import com.example.demo.dao.ReplyDAO;
import com.example.demo.vo.CustomerVO;
import com.example.demo.vo.PostVO;

@Controller
public class PostController {

	public static int pageSIZE =  10;
	public static int totalCount  = 0;
	public static int totalPage = 1;
	public static int updateHit=0;
	public static int nextId;
	public static int nextNo;
   
	@Autowired
	private PostDAO dao;
	public void setDao(PostDAO dao) {
		this.dao = dao;
	}

	@Autowired
	private ReplyDAO re_dao;
	public void setRe_dao(ReplyDAO re_dao) {
		this.re_dao = re_dao;
	}
	
	@Autowired
	private CustomerDAO c_dao;
	public void setC_dao(CustomerDAO c_dao) {
		this.c_dao = c_dao;
	}
   
	//전체 게시글 목록
	@RequestMapping("postList.do")
	public void postList(Model model, int group, @RequestParam(value = "pageNUM", defaultValue = "1") int pageNUM, String search, String option, HttpSession session) {

		System.out.println("search  :  "+search);
		System.out.println("option  :  "+option);
		if(search==null&&session.getAttribute("search")!=null) {
			search=(String)session.getAttribute("search");
			option=(String)session.getAttribute("option");
		}
		
		HashMap map=new HashMap();
		map.put("group", group);
		
		totalCount = dao.getTotalCount(map);
		totalPage = (int)Math.ceil( (double)totalCount/pageSIZE ) ;
		int start = (pageNUM-1)*pageSIZE + 1;
		int end = start + pageSIZE-2;
		if(end > totalCount) {
			end = totalCount;
		}
      
		model.addAttribute("list", dao.findAll(map));
		model.addAttribute("group", group);
		model.addAttribute("start", start-1);
		model.addAttribute("end", end);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);
	}

	//게시글 상세보기
	//전체 댓글목록
	@RequestMapping("postDetail.do")
	public void detail(int p_id, int group, Model model, HttpServletRequest request) {
		updateHit=dao.updateHit(p_id);
	      
		HashMap map=new HashMap();
		map.put("p_id", p_id);
		map.put("group", group);
  
		System.out.println("DETAIL 상세글 p_id  |  "+p_id);
		System.out.println("DETAIL 상세글 p_no  |  "+dao.findById(map).getP_no());
		System.out.println("DETAIL 상세글 cust_no |  "+dao.findById(map).getCust_no());
  
		model.addAttribute("post",dao.findById(map));
		model.addAttribute("group", group);
		model.addAttribute("listReply",re_dao.findAll(map));
		
		//로그인된 회원번호 받아오기
		HttpSession session=request.getSession(); 
		session.setAttribute("cust_no", session.getAttribute("cust_no"));
	}
   
	//새글 작성
	@RequestMapping(value="postInsert.do", method = RequestMethod.GET)
	public void insertForm(Model model, int cust_no, String nickname, int group, PostVO post) {
		nextId=dao.getNextId(group);
		post.setP_id(nextId);
		nextNo=dao.getNextNo(group);
		post.setP_no(nextNo);
		
		
		System.out.println("다음 글 id : "+nextId);
		System.out.println("다음 글 no : "+nextNo);
		System.out.println("group : "+group);
		System.out.println("cust_no : "+c_dao.findByCust_No(cust_no).getCust_no());
		model.addAttribute("p_id", nextId);
		model.addAttribute("p_no", nextNo);
		model.addAttribute("group", group);
		model.addAttribute("c", c_dao.findByCust_No(cust_no));
	}
	@RequestMapping(value="postInsert.do", method = RequestMethod.POST)
	public ModelAndView insertSubmit(PostVO pvo, int group,int cust_no, int p_id, int p_no, String p_title,String p_content, HttpServletRequest request) {
		
		System.out.println("동작!!");
		
		String path=request.getRealPath("img");
		System.out.println("path : "+path);
		
		MultipartFile uploadFile = pvo.getUploadFile();
		String fname = uploadFile.getOriginalFilename();
		
		System.out.println("uploadFile name  :  "+uploadFile);
		System.out.println("fname  :  "+fname);
		
		if(fname != null && !fname.equals("")) {
			try {
				byte[] data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				System.out.println("예외발생 : " + e.getMessage());
			}
			pvo.setFname(fname);
        } else{
        	pvo.setFname("");
        }
//		pvo.setFname(fname);
		
		
//		CustomerVO c=new CustomerVO();
		String p_writer=c_dao.findByCust_No(cust_no).getNickname();
		int p_hit=0;
		
		HashMap map=new HashMap();
		map.put("group", group);
		map.put("p_id", p_id);
		map.put("p_no", p_no);
		map.put("cust_no", cust_no);
		map.put("p_title", p_title);
		map.put("p_writer", p_writer);
		map.put("p_content", p_content);
		map.put("p_hit", p_hit);
		map.put("fname", fname);
				
		ModelAndView mav=new ModelAndView("redirect:/postList.do?group="+group);
		int re=dao.insert(map);
		if(re<=0) {
			mav.addObject("msg", "게시글 작성 실패");
			mav.setViewName("error");
		}
		return mav;
	}
	
	//게시글 수정
	@RequestMapping(value="postUpdate.do", method = RequestMethod.GET)
	public void update(int group, int p_id, int cust_no, String nickname, Model model) {
		System.out.println("group  :  "+group);

		HashMap map=new HashMap();
		map.put("p_id", p_id);
		map.put("group", group);
		map.put("cust_no", cust_no);
		
		
		System.out.println("글등록자 회원번호 : "+dao.findById(map).getCust_no());
		System.out.println("로그인된 회원번호 : "+c_dao.findByCust_No(cust_no).getCust_no());
	      
		model.addAttribute("group", group);
		model.addAttribute("c", c_dao.findByCust_No(cust_no));
		model.addAttribute("post", dao.findById(map));
	}
	@RequestMapping(value="postUpdate.do", method = RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request, PostVO m, int group, MultipartFile uploadFile) {

		System.out.println("group  :  "+group);
		
		
		String path = request.getRealPath("img");
		System.out.println("path: "+path);
		String oldFname = m.getFname();
		String fname = uploadFile.getOriginalFilename();
		if(fname != null && !fname.equals("")) {
			m.setFname(fname);
			try {
				byte[] data = uploadFile.getBytes();
				FileOutputStream fos = new FileOutputStream(path + "/" + fname);
				fos.write(data);
				fos.close();
			}catch (Exception e) {
				System.out.println("예외발생 : " + e.getMessage());
			}
			m.setFname(fname);
        } else{
        	// oldFname set으로 추가
           m.setFname(oldFname);
        }
		
		ModelAndView mav=new ModelAndView("redirect:/postDetail.do?p_id="+m.getP_id()+"&&group="+group);
		int re = dao.update(m);
		if(re<=0) {
			mav.addObject("msg", "게시글 수정 실패");
			mav.setViewName("error");
  		}else {
			if(fname != null && !fname.equals("") && !m.getFname().equals("")) {
				File file = new File(path + "/" + oldFname);
												// oldFname으로 변경
				file.delete();
			}
  		}
  		return mav;
	}
   
	@RequestMapping(value = "postDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public String delete(int p_id, int cust_no, int group, HttpServletRequest request) {
		int re=-1;
				
		System.out.println("DEL 받아온 cust_no :  "+cust_no);
		System.out.println("DEL 받아온 p_id  :  "+p_id);
		
		
		HashMap map=new HashMap();
		map.put("group", group);
		map.put("p_id",p_id);
		map.put("cust_no",cust_no);
		
		System.out.println("DEL map :  "+ map);
		
		re=dao.delete(map);
		
		System.out.println("DEL re:   "+re);
		return Integer.toString(re);
	}
}
