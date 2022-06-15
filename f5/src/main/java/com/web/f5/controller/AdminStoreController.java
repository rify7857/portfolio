package com.web.f5.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.web.f5.service.AdminBoardService;
import com.web.f5.service.AdminStoreService;
import com.web.f5.service.ObjService;
import com.web.f5.service.PageServiceImpl;
import com.web.f5.vo.AdminStoreVO;
import com.web.f5.vo.ReviewVO;
import com.web.f5.vo.StoreVO;

@Controller
public class AdminStoreController {

	@Autowired
	private AdminStoreService adminStoreService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	@RequestMapping ( value = "admin/store_list.do", method = RequestMethod.GET )
	public ModelAndView admin_store_list(String rpage, String search, String search_type) {
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;
		
		if ( search == null ) {
			
			param = pageService.getPageResult(rpage, "admin_store", adminStoreService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminStoreService.getListResult(startCount, endCount);
		} else {
			
			param = pageService.getSearchResult(search_type, search, rpage, "admin_store_search", adminStoreService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminStoreService.getSearchList(startCount, endCount, search, search_type);
		}
		
		ArrayList<AdminStoreVO> list = new ArrayList<AdminStoreVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminStoreVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		
		mv.setViewName("admin/store/store_list");
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/store_information.do", method = RequestMethod.GET )
	public ModelAndView admin_store_information(String rpage, String idx, String rno) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;
		int pageCount = 0;
		int dbCount=0;
		int reqPage=1;
		
		AdminStoreVO storeList = adminStoreService.getContent(idx);
		
		dbCount = adminStoreService.getReviewCount(idx);
		
		if(dbCount % pageSize == 0){
			
			pageCount = dbCount/pageSize;
		}else{
			
			pageCount = dbCount/pageSize+1;
		}
		
		if( rpage != null ){
			
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		} else {
			
			startCount = 1;
			endCount = pageSize;
		}
		
		ArrayList<ReviewVO> reviewList = adminStoreService.getReview(startCount, endCount, idx);
		
		result.put("dbCount", dbCount);
		result.put("reqPage", reqPage);
		result.put("pageSize", pageSize);
		
		result.put("storeList", storeList);
		result.put("reviewList", reviewList);
		
		return new ModelAndView("admin/store/store_information", "result", result);
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/store_information_paging.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String admin_store_info_paging(String rpage, String idx) {
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 5;
		int pageCount = 0;
		int dbCount=0;
		int reqPage=1;
		
		dbCount = adminStoreService.getReviewCount(idx);
		
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		ArrayList<ReviewVO> list = adminStoreService.getReview(startCount, endCount, idx);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( ReviewVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			
			obj.addProperty("reviewIdx", vo.getReviewIdx());
			obj.addProperty("memberId", vo.getMemberId());
			obj.addProperty("reviewContent", vo.getReviewContent());
			obj.addProperty("storeIdx", vo.getStoreIdx());
			obj.addProperty("reviewScore", vo.getReviewScore());
			obj.addProperty("rno", vo.getRno());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/review_delete.do", method = RequestMethod.GET )
	public String review_delete(String idx, String ridx) {
		
		String msg = "";
		int result = adminStoreService.getReviewDelete(idx, ridx);
		
		if ( result == 1 ) {
			
			msg = "succ";
		} else {
			
			msg = "fail";
		}
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/store_close.do", method = RequestMethod.GET )
	public String store_close(String idx) {
		
		String msg = "";
		int result = adminStoreService.getStoreDelete(idx);
		
		if ( result == 1 ) {
			
			msg = "succ";
		} else {
			
			msg = "fail";
		}
		
		return msg;
	}
}
