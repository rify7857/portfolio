package com.web.f5.service;

import javax.servlet.http.HttpSession;

import com.web.f5.vo.MemberVO;
import com.web.f5.vo.StoreVO;

public interface MemberService {
	public int login_result(MemberVO vo);	
	public int insert_result(MemberVO vo);
	public MemberVO select_result(String memberId);
	public int getIdCheckResult(String id);
	public int insertCeoResult(StoreVO vo, HttpSession session);
}
