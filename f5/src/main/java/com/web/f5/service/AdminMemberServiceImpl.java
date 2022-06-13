package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.AdminMemberDAO;
import com.web.f5.vo.AdminMemberVO;

public class AdminMemberServiceImpl implements AdminMemberService {

	@Autowired
	private AdminMemberDAO adminMemberDAO;
	
	@Override
	public int getInsertResult(Object obj) {
		
		AdminMemberVO vo = (AdminMemberVO) obj;
		
		return adminMemberDAO.insert(vo);
	}
	
	@Override
	public List<Object> getListResult( int startCount, int endCount ){
		return adminMemberDAO.select(startCount, endCount);
	}

	@Override
	public int getListCount() {
		
		return adminMemberDAO.execTotalCount();
	}
	
	@Override
	public int getSearchCount(String search_type, String search) {
		
		return adminMemberDAO.searchCount(search_type, search);
	}
	
	@Override
	public Object getContent(String id) {
		
		return adminMemberDAO.select(id);
	}
	
	@Override
	public int getUpdateResult(Object obj) {
		
		AdminMemberVO vo = (AdminMemberVO) obj;
		
		return adminMemberDAO.update(vo);
	}
	
	@Override
	public int getDeleteResult(String id) {
		
		return adminMemberDAO.delete(id);
	}

	@Override
	public List<AdminMemberVO> getLimitList() {
		
		return adminMemberDAO.select();
	}
	
	@Override
	public int getmberTotalCnt() {
		
		return adminMemberDAO.mberTotalCnt();
	}
	
	@Override
	public int getmberTodayCnt() {
		
		return adminMemberDAO.mberTodayCnt();
	}

	@Override
	public List<Object> getSearchListResult(int startCount, int endCount, String search, String search_type) {
		
		return adminMemberDAO.select(startCount, endCount, search, search_type);
	}

	@Override
	public int chkMberUpdate(String id, String auth) {
		
		return adminMemberDAO.chkMberUpdate(id, auth);
	}

	@Override
	public int getBlackInsert(String id) {
		
		return adminMemberDAO.getBlackInsert(id);
	}

	@Override
	public int getBlackOut(String id) {
		
		return adminMemberDAO.getBlackOut(id);
	}

	@Override
	public ArrayList<AdminMemberVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		return adminMemberDAO.getSearchJSONResult(startCount, endCount, search, search_type);
	}

	@Override
	public List<Object> getCeoListResult(int startCount, int endCount) {
		
		return adminMemberDAO.getCeoListResult(startCount, endCount);
	}

	@Override
	public List<Object> getCeoSearchResult(int startCount, int endCount, String search, String search_type) {
		
		return adminMemberDAO.getCeoSearchResult(startCount, endCount, search, search_type);
	}

	@Override
	public int getCEOTotal() {
		
		return adminMemberDAO.getCEOTotal();
	}

	@Override
	public int getCEORequest() {
		
		return adminMemberDAO.getCEORequest();
	}

	@Override
	public List<Object> getBlackListResult(int startCount, int endCount) {
		
		return adminMemberDAO.getBlackListResult(startCount, endCount);
	}

	public int getBlackCount() {
		
		return adminMemberDAO.getBlackCount();
	}

	public int getBlackSearchCount(String search_type, String search) {
		
		return adminMemberDAO.getBlackSearchCount(search_type, search);
	}

	@Override
	public List<Object> getBlackMberSearch(int startCount, int endCount, String search, String search_type) {
		
		return adminMemberDAO.getBlackMberSearch(startCount, endCount, search, search_type);
	}

	@Override
	public ArrayList<AdminMemberVO> getBlackSearchList(int startCount, int endCount, String search, String search_type) {
		
		return adminMemberDAO.getBlackSearchList(startCount, endCount, search, search_type);
	}

	@Override
	public int getIdChk(String id) {
		
		return adminMemberDAO.getIdChk(id);
	}

	public int getCeoSearchCount(String search_type, String search) {
		
		return adminMemberDAO.getCeoSearchCount(search_type, search);
	}

	@Override
	public ArrayList<AdminMemberVO> getCeoSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		return adminMemberDAO.getCeoSearchJSONResult(startCount, endCount, search, search_type);
	}

	public int getCeoCount() {
		
		return adminMemberDAO.getCeoCount();
	}
}
