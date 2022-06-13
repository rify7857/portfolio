package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import com.web.f5.vo.AdminFaqVO;

public interface AdminFaqService extends ObjService {

	List<Object> getListResult(int startCount, int endCount);
	List<Object> getSearchResult(int startCount, int endCount);
	int getListCount();
	Object getContent(String id);
	int getUpdateResult(Object obj);
	int getDeleteResult(String id);
	int getInsertResult(Object obj);
	List<Object> getsearchListResult(int startCount, int endCount, String search, String search_type);
	ArrayList<AdminFaqVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type);
}
