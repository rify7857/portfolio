package com.web.f5.service;

import java.util.ArrayList;
import java.util.List;

import com.web.f5.vo.AdminStoreVO;
import com.web.f5.vo.ReviewVO;

public interface AdminStoreService extends ObjService{

	int getListCount();
	
	ArrayList<ReviewVO> getReview(int startCount, int endCount, String storeIdx);

	List<Object> getListResult(int startCount, int endCount);

	List<Object> getSearchList(int startCount, int endCount, String search, String search_type);

	AdminStoreVO getContent(String id);

	int getReviewCount(String id);

	int getReviewDelete(String idx, String ridx);

	int getStoreDelete(String idx);

	ArrayList<AdminStoreVO> getsearchJSONResult(int startCount, int endCount, String search, String search_type);
}