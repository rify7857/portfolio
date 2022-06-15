package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import com.web.f5.vo.AdminQuestionVO;

public interface AdminQuestionService extends ObjService {

	@Override
	public int getInsertResult(Object obj);

	public List<Object> getSearchListResult(int startCount, int endCount, String search, String search_type);
	
	public int receiveBefore(String idx);

	public ArrayList<AdminQuestionVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type);

	public ArrayList<AdminQuestionVO> getQuestionProceed(int startCount, int endCount, String proceed);

	public List<AdminQuestionVO> getLimitList();

	public List<Object> getQuestionSearchList(int startCount, int endCount, String search, String search_type, String proceed);

	public ArrayList<AdminQuestionVO> getProceedSearchJSONResult(int startCount, int endCount, String search, String search_type, String proceed);

	public int getWaitingCnt();

	public int getAnsweringCnt();

	public int getAnswerCompleteCnt();

	public AdminQuestionVO getQuestionContent(String idx);
}
