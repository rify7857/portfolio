package com.web.f5.service;

import java.util.List;

public interface ObjService {

	List<Object> getListResult(int startCount, int endCount);
	int getListCount();
	Object getContent(String id);
	int getUpdateResult(Object obj);
	int getDeleteResult(String id);
	int getInsertResult(Object obj);
	int getSearchCount(String search_type, String search);
}
