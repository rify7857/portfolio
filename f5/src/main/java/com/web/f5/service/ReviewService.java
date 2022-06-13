package com.web.f5.service;

import java.util.ArrayList;

import com.web.f5.vo.ReviewVO;
import com.web.f5.vo.StoreVO;

public interface ReviewService {
	public ArrayList<ReviewVO> selectListResult(int startCount, int endCount, String storeidx);
	public int insertResult(ReviewVO vo);
	public int deleteResult(String reviewIdx);
	public int updateResult(String reviewIdx,String reviewContent,int reviewScore);
	public ArrayList<ReviewVO> selectMyListResult(String memberId, int endCount,String storeIdx);
	public float getAverageScore(String storeIdx);
}
