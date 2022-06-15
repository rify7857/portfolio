package com.web.f5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.f5.service.AdminMemberService;
import com.web.f5.service.MemberService;
import com.web.f5.vo.MemberVO;

@Controller
public class JoinController {
	
	@Autowired MemberService memberService;
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@ResponseBody
	@RequestMapping ( value = "/idChk.do", method = RequestMethod.GET )
	public String idChk(String id) {
		
		String msg = "";
		
		int result = adminMemberService.getIdChk(id);
		
		if ( result == 1 ) {
			
			msg = "fail";
		} else {
			
			msg = "succ";
		}
		
		return msg;
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String join() {
		return "member/join/join";
	}
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public ModelAndView join(MemberVO vo) {
		ModelAndView mv = new ModelAndView();
		int result = memberService.insert_result(vo);
		
		if(result == 1) {
			System.out.println("가입성공");
			mv.setViewName("member/login/login");
		}else {
			System.out.println("가입실패");
			mv.setViewName("join/join");
		}
		return mv;
	}
}
