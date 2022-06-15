package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.MemberDAO;
import com.web.f5.vo.AdminQuestionVO;
import com.web.f5.vo.BoardVO;
import com.web.f5.vo.MemberVO;
import com.web.f5.vo.StoreVO;

public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDao;

	@Override // MemberService
	public int getIdCheckResult(String id) {
		return memberDao.idCheck(id);
	}

	@Override
	public int login_result(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDao.select(vo);
	}

	@Override
	public int insert_result(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDao.insert(vo);
	}

	@Override
	public MemberVO select_result(String memberId) {
		// TODO Auto-generated method stub
		return (MemberVO) memberDao.select(memberId);
	}
	@Override
	public int insertCeoResult(StoreVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		return memberDao.insertCeo(vo,session);
	}
	@Override
	public int memberUpdateResult(MemberVO vo) {
		// TODO Auto-generated method stub
		return memberDao.memberUpdate(vo);
	}

	@Override
	public int getBoardCount(String memberId) {
		
		return memberDao.getBoardCount(memberId);
	}

	@Override
	public List<Object> getBoardList(String memberId) {
		
		return memberDao.getBoardList(memberId);
	}

	@Override
	public List<Object> getQuestionList(String memberId) {
		
		return memberDao.getQuestionList(memberId);
	}

	@Override
	public int getQuestionCount(String memberId) {
		
		return memberDao.getQuestionCount(memberId);
	}

	@Override
	public AdminQuestionVO getContent(String idx) {
		
		return memberDao.getQuestionContent(idx);
	}

	@Override
	public int getCEOrequest(String id) {
		
		return memberDao.getCEOrequest(id);
	}

	@Override
	public int getCEOcancel(String id) {
		
		return memberDao.getCEOcancel(id);
	}
}
