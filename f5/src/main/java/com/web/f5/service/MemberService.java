package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.web.f5.vo.AdminQuestionVO;
import com.web.f5.vo.BoardVO;
import com.web.f5.vo.MemberVO;
import com.web.f5.vo.StoreVO;

public interface MemberService {
	public int login_result(MemberVO vo);	
	public int insert_result(MemberVO vo);
	public MemberVO select_result(String memberId);
	public int getIdCheckResult(String id);
	public int insertCeoResult(StoreVO vo, HttpSession session);
	public int memberUpdateResult(MemberVO vo);
	public int getBoardCount(String memberId);
	public List<Object> getBoardList(String memberId);
	public List<Object> getQuestionList(String memberId);
	public int getQuestionCount(String memberId);
	public AdminQuestionVO getContent(String idx);
	public int getCEOrequest(String id);
	public int getCEOcancel(String id);
}
