package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.AdminQuestionDAO;
import com.web.f5.vo.AdminQuestionVO;

public class AdminQuestionServiceImpl implements AdminQuestionService {

	@Autowired
	private AdminQuestionDAO adminQuestionDAO;
	
	@Override
	public List<Object> getListResult(int startCount, int endCount) {
		
		return adminQuestionDAO.select(startCount, endCount);
	}

	@Override
	public int getListCount() {
		
		return adminQuestionDAO.execTotalCount();
	}

	@Override
	public int getSearchCount(String search_type, String search) {
		
		return adminQuestionDAO.getCountResult(search_type, search);
	}

	@Override
	public Object getContent(String idx) {
		
		return adminQuestionDAO.select(idx);
	}

	@Override
	public int getUpdateResult(Object obj) {
		
		AdminQuestionVO vo = (AdminQuestionVO) obj;
		
		return adminQuestionDAO.update(vo);
	}

	@Override
	public int getDeleteResult(String id) {
		
		return adminQuestionDAO.delete(id);
	}

	@Override
	public int getInsertResult(Object obj) {
		
		AdminQuestionVO vo = (AdminQuestionVO) obj;
		
		return adminQuestionDAO.insert(vo);
	}

	@Override
	public List<Object> getSearchListResult(int startCount, int endCount, String search, String search_type) {
		
		return adminQuestionDAO.select(startCount, endCount, search, search_type);
	}

	@Override
	public int receiveBefore(String idx) {
		
		return adminQuestionDAO.update(idx);
	}

	@Override
	public ArrayList<AdminQuestionVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type) {
		
		return adminQuestionDAO.getSearchJSONResult(startCount, endCount, search, search_type);
	}

	@Override
	public ArrayList<AdminQuestionVO> getQuestionProceed(int startCount, int endCount, String proceed) {
		
		return adminQuestionDAO.getSearchJSONProceed(startCount, endCount, proceed);
	}

	@Override
	public List<AdminQuestionVO> getLimitList() {
		
		return adminQuestionDAO.getLimitList();
	}

	public int getQuestionSearchCount(String search_type, String search, String proceed) {
		
		return adminQuestionDAO.getQuestionSearchCount(search_type, search, proceed);
	}

	@Override
	public List<Object> getQuestionSearchList(int startCount, int endCount, String search, String search_type, String proceed) {
		
		return adminQuestionDAO.getQuestionSearchList(startCount, endCount, search, search_type, proceed);
	}

	@Override
	public ArrayList<AdminQuestionVO> getProceedSearchJSONResult(int startCount, int endCount, String search, String search_type, String proceed) {
		
		return adminQuestionDAO.getProceedSearchList(startCount, endCount, search, search_type, proceed);
	}

	@Override
	public int getWaitingCnt() {
		
		return adminQuestionDAO.getWaitingCnt();
	}

	@Override
	public int getAnsweringCnt() {
		
		return adminQuestionDAO.getAnsweringCnt();
	}

	@Override
	public int getAnswerCompleteCnt() {
		
		return adminQuestionDAO.getAnswerCompleteCnt();
	}

	@Override
	public AdminQuestionVO getQuestionContent(String idx) {
		
		return adminQuestionDAO.getQuestionContent(idx);
	}
}
