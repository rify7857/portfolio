package com.web.f5.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.web.f5.vo.StoreVO;

public interface StoreService {
	public int insertResult(StoreVO vo);
	public ArrayList<StoreVO> select(int startCount,int endCount);
	public int totalCountResult();
	public StoreVO selectResult(String Store_idx);
	public StoreVO getmCountResult(String storeIdx);
	public int insertFileResult(StoreVO vo);
	public void fileSave(StoreVO vo, HttpServletRequest request);
	public String getStoreIdx();
}
