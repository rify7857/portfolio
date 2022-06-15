package com.web.f5.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.f5.service.MemberService;
import com.web.f5.service.ReservationService;
import com.web.f5.service.ReviewService;
import com.web.f5.vo.BoardVO;
import com.web.f5.vo.MemberVO;
import com.web.f5.vo.ReservationVO;
import com.web.f5.vo.ReviewVO;

@Controller
public class MyPageController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ReservationService reservationService;
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String mypage(HttpSession session) {
		return "member/mypage/mypage";
	}


	@RequestMapping(value="/mypage_info.do", method = RequestMethod.GET)
	public ModelAndView mypage_info(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MemberVO vo = new MemberVO();
		vo = memberService.select_result(String.valueOf(session.getAttribute("memberId")));
		
		mv.addObject("vo",vo);
		mv.setViewName("member/mypage/mypage_info");
		return mv;
	}
	@RequestMapping(value="/memberUpdate.do", method = RequestMethod.POST)
	public ModelAndView memberUpdate(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		int result = memberService.memberUpdateResult(vo);
		if(result ==1) {
			mv.setViewName("redirect:/mypage.do");
			return mv;
		}else {
			mv.setViewName("redirect:/mypage_info.do");
			return mv;
		}
		
	}
	@RequestMapping(value="/mypage_ask.do", method = RequestMethod.GET)
	public ModelAndView mypage_ask(String rpage, HttpSession session) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;
		int pageCount = 0;
		int dbCount=0;
		int reqPage=1;
		
		List<Object> list = memberService.getQuestionList(String.valueOf(session.getAttribute("memberId")));
		
		dbCount = memberService.getQuestionCount(String.valueOf(session.getAttribute("memberId")));
		
if(dbCount % pageSize == 0){
			
			pageCount = dbCount/pageSize;
		}else{
			
			pageCount = dbCount/pageSize+1;
		}
		
		if( rpage != null ){
			
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		} else {
			
			startCount = 1;
			endCount = pageSize;
		}
		
		result.put("dbCount", dbCount);
		result.put("reqPage", reqPage);
		result.put("pageSize", pageSize);
		result.put("list", list);
		
		return new ModelAndView("member/mypage/mypage_ask", "result", result);
	}
	@RequestMapping(value="/mypage_comment.do", method = RequestMethod.GET)
	public ModelAndView mypage_comment(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		
		list = reviewService.selectList(String.valueOf(session.getAttribute("memberId")));
		
		mv.addObject("list",list);
		mv.setViewName("member/mypage/mypage_comment");
		return mv;
	}
	@RequestMapping(value="/mypage_major.do", method = RequestMethod.GET)
	public String mypage_major() {
		return "member/mypage/mypage_major";
	}
	@RequestMapping(value="/mypage_rez.do", method = RequestMethod.GET)
	public ModelAndView mypage_rez(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MemberVO vo = new MemberVO();
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		vo = memberService.select_result(String.valueOf(session.getAttribute("memberId")));
		list = reservationService.select(String.valueOf(session.getAttribute("memberId")));
		
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.setViewName("member/mypage/mypage_rez");
		
		return mv;
	}
	@RequestMapping(value="/mypage_board.do", method = RequestMethod.GET)
	public ModelAndView mypage_board(String rpage, HttpSession session) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;
		int pageCount = 0;
		int dbCount=0;
		int reqPage=1;
		
		List<Object> boardList = memberService.getBoardList(String.valueOf(session.getAttribute("memberId")));
		
		dbCount = memberService.getBoardCount(String.valueOf(session.getAttribute("memberId")));
		
		if(dbCount % pageSize == 0){
			
			pageCount = dbCount/pageSize;
		}else{
			
			pageCount = dbCount/pageSize+1;
		}
		
		if( rpage != null ){
			
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		} else {
			
			startCount = 1;
			endCount = pageSize;
		}
		
		result.put("dbCount", dbCount);
		result.put("reqPage", reqPage);
		result.put("pageSize", pageSize);
		result.put("boardList", boardList);
		
		return new ModelAndView("member/mypage/mypage_board", "result", result);
	}
	
	@ResponseBody
	@RequestMapping ( value = "/reviewUpdate.do", method = RequestMethod.GET )
	public String reviewUpdate(String idx, String content, String score) {
		String msg = "";
		int scoreInt = Integer.parseInt(score);
		
		int result = reviewService.updateResult(idx, content, scoreInt);
		
		if ( result == 1 ) {
			
			msg = "succ";
		} else {
			msg = "fail";
		}
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping ( value = "CEOrequest.do", method = RequestMethod.GET )
	public String CEOrequest(String id) {
		
		String msg = "";
		
		int result = memberService.getCEOrequest(id);
		System.out.println(result);
		if ( result == 1 ) {
			
			msg = "succ";
		} else {
			
			msg = "fail";
		}
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping ( value = "CEOcancel.do", method = RequestMethod.GET )
	public String CEOcancel(String id) {
		
		String msg = "";
		
		int result = memberService.getCEOcancel(id);
		
		if ( result == 1 ) {
			
			msg = "succ";
		} else {
			
			msg = "fail";
		}
		
		return msg;
	}
}