package com.web.f5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyPageController {

	@RequestMapping(value="/mypage.do", method = RequestMethod.GET)
	public String mypage() {
		return "member/mypage/mypage";
	}


	@RequestMapping(value="/mypage_info.do", method = RequestMethod.GET)
	public String mypage_info() {
		return "member/mypage/mypage_info";
	}
	@RequestMapping(value="/mypage_ask.do", method = RequestMethod.GET)
	public String mypage_ask() {
		return "member/mypage/mypage_ask";
	}
	@RequestMapping(value="/mypage_comment.do", method = RequestMethod.GET)
	public String mypage_comment() {
		return "member/mypage/mypage_comment";
	}
	@RequestMapping(value="/mypage_major.do", method = RequestMethod.GET)
	public String mypage_major() {
		return "member/mypage/mypage_major";
	}
	@RequestMapping(value="/mypage_rez.do", method = RequestMethod.GET)
	public String mypage_rez() {
		return "member/mypage/mypage_rez";
	}
	@RequestMapping(value="/mypage_board.do", method = RequestMethod.GET)
	public String mypage_board() {
		return "member/mypage/mypage_board";
	}
}