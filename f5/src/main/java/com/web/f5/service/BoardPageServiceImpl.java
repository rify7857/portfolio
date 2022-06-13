package com.web.f5.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;


public class BoardPageServiceImpl {
	
	@Autowired BoardServiceImpl boardService;
	
	/**
	 * 페이징 처리 
	 */
	public Map<String, String> getPageResult(String rpage, String boardCategory) {
		Map<String,String> param = new HashMap<String,String>();
		
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 7;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = 0;    //DB에서 가져온 전체 행수

		dbCount = boardService.getListCount(boardCategory);

		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		
		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("dbCount", String.valueOf(dbCount));
		param.put("pageSize", String.valueOf(pageSize));
		param.put("reqPage", String.valueOf(reqPage));
		
				
		return param;
	}
	
	public Map<String, String> getBoardSearch(String rpage, String boardCategory, String search, String search_type) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 7;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = 0;
		
		
		dbCount = boardService.getBoardSearchCount(search, search_type, boardCategory);
		
		if ( dbCount % pageSize == 0 ) {
			
			pageCount = dbCount / pageSize;
		} else {
			
			pageCount = dbCount / pageSize + 1;
		}
		
		if ( rpage != null ) {
			
			reqPage = Integer.parseInt(rpage);
			startCount = ( reqPage - 1 ) * pageSize + 1;
			endCount = reqPage * pageSize;
		} else {
			
			startCount = 1;
			endCount = pageSize;
		}
		
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("dbCount", String.valueOf(dbCount));
		param.put("pageSize", String.valueOf(pageSize));
		param.put("reqPage", String.valueOf(reqPage));
		
		return param;
	}
	
	
}
