package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import com.web.f5.vo.AdminNoticeVO;

public interface AdminNoticeService extends ObjService{

	int getListCount();
	List<Object> getListResult(int startCount, int endCount);
	int getInsertResult(Object obj);
	Object getContent(String id);
	int getUpdateResult(Object obj);
	int getDeleteResult(String id);
	List<AdminNoticeVO> getLimitList();
	List<Object> getSearchListResult(int startCount, int endCount, String search, String search_type);
	ArrayList<AdminNoticeVO> getSearchJSONResult(int startCount, int endCount, String search, String search_type);
}
