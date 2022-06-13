package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import com.web.f5.vo.AdminBoardVO;

public interface AdminBoardService extends ObjService {

	int getListCount();
	List<Object> getListResult(int startCount, int endCount);
	int getInsertResult(Object obj);
	Object getContent(String id);
	int getUpdateResult(Object obj);
	int getDeleteResult(String id);
	List<AdminBoardVO> getLimitList();
	ArrayList<AdminBoardVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type);
	List<Object> getSearchList(int startCount, int endCount, String search, String search_type);
	void getInsertPageview(String pageName);
	int getTotalPV();
	int getTodayPV();
}
