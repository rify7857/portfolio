package com.web.f5.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.web.f5.dao.ReviewDAO;
import com.web.f5.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{
	
	@Autowired ReviewDAO reviewDao;
	
	@Override
	public ArrayList<ReviewVO> selectListResult(int startCount, int endCount, String storeIdx) {
		// TODO Auto-generated method stub
		return reviewDao.select(startCount, endCount, storeIdx);
	}
	@Override
	public int insertResult(ReviewVO vo) {
		// TODO Auto-generated method stub
		return reviewDao.insert(vo);
	}
	@Override
	public int deleteResult(String reviewIdx) {
		// TODO Auto-generated method stub
		return reviewDao.delete(reviewIdx);
	}
	@Override
	public int updateResult(String reviewIdx, String reviewContent, int reviewScore) {
		// TODO Auto-generated method stub
		return reviewDao.update(reviewIdx, reviewContent, reviewScore);
	}
	@Override
	public ArrayList<ReviewVO> selectMyListResult(String memberId, int endCount,String storeIdx) {
		// TODO Auto-generated method stub
		return reviewDao.select(memberId, endCount,storeIdx);
	}
	@Override
	public float getAverageScore(String storeIdx) {
		// TODO Auto-generated method stub
		return reviewDao.getAverageScore(storeIdx);
	}
}
