package com.web.f5.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class PageServiceImpl {

	@Autowired
	private AdminMemberServiceImpl adminMemberService;
	
	@Autowired
	private AdminNoticeServiceImpl adminNoticeService;
	
	@Autowired
	private AdminBoardServiceImpl adminBoardService;
	
	@Autowired
	private AdminFaqServiceImpl adminFaqService;
	
	@Autowired
	private AdminQuestionServiceImpl adminQuestionService;
	
	@Autowired
	private AdminStoreServiceImpl adminStoreService;
	
	public Map<String, String> getPageResult(String rpage, String serviceName, ObjService service) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = 0;
		
		if ( serviceName.equals("admin_Member") ) {
			
			adminMemberService = (AdminMemberServiceImpl) service;
			dbCount = adminMemberService.getListCount();
		} else if ( serviceName.equals("admin_Notice") ) {
			
			adminNoticeService = (AdminNoticeServiceImpl) service;
			dbCount = adminNoticeService.getListCount();
		} else if ( serviceName.equals("admin_Board") ) {
			
			adminBoardService = (AdminBoardServiceImpl) service;
			dbCount = adminBoardService.getListCount();
		} else if ( serviceName.equals("admin_faq") ) {
			
			adminFaqService = (AdminFaqServiceImpl) service;
			dbCount = adminFaqService.getListCount();
		} else if ( serviceName.equals("faq") ) {
			
			adminFaqService = (AdminFaqServiceImpl) service;
			dbCount = adminFaqService.getListCount();
		} else if ( serviceName.equals("admin_Question") ) {
			
			adminQuestionService = (AdminQuestionServiceImpl) service;
			dbCount = adminQuestionService.getListCount();
		} else if ( serviceName.equals("admin_store") ) {
			
			adminStoreService = (AdminStoreServiceImpl) service;
			dbCount = adminStoreService.getListCount();
		} else if ( serviceName.equals("black_list") ) {
			
			adminMemberService = (AdminMemberServiceImpl) service;
			dbCount = adminMemberService.getBlackCount();
		} else if ( serviceName.equals("admin_ceo") ) {
			
			adminMemberService = (AdminMemberServiceImpl) service;
			dbCount = adminMemberService.getCeoCount();
		}
		
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
	
	public Map<String, String> getSearchResult(String search_type, String search, String rpage, String serviceName, ObjService service) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = 0;
		
		if ( serviceName.equals("admin_Member") ) {
			// member검색
			adminMemberService = (AdminMemberServiceImpl) service;
			dbCount = adminMemberService.getSearchCount(search_type, search);
		} else if ( serviceName.equals("admin_Notice") ) {
			// notice 검색
			adminNoticeService = (AdminNoticeServiceImpl) service;
			dbCount = adminNoticeService.getSearchCount(search_type, search);
		} else if ( serviceName.equals("question_search") ) {
			
			adminQuestionService = (AdminQuestionServiceImpl) service;
			dbCount = adminQuestionService.getSearchCount(search_type, search);
		} else if ( serviceName.equals("admin_board_search") ) {
			
			adminBoardService = (AdminBoardServiceImpl) service;
			dbCount = adminBoardService.getSearchCount(search_type, search);
		} else if ( serviceName.equals("notice_search") ) {
			
			adminNoticeService = (AdminNoticeServiceImpl) service;
			dbCount = adminNoticeService.getSearchCount(search_type, search);
		} else if ( serviceName.equals("faq_search") ) {
			
			adminFaqService = (AdminFaqServiceImpl) service;
			dbCount = adminFaqService.getSearchCount(search_type, search);
		} else if ( serviceName.equals("black_search_list") ) {
			
			adminMemberService = (AdminMemberServiceImpl) service;
			dbCount = adminMemberService.getBlackSearchCount(search_type, search);
		} else if ( serviceName.equals("store_search") ) {
			pageSize = 4;
			adminStoreService = (AdminStoreServiceImpl) service;
			dbCount = adminStoreService.getSearchCount(search_type, search);
		} else if ( serviceName.equals("admin_ceo_member_search") ) {
			
			adminMemberService = (AdminMemberServiceImpl) service;
			dbCount = adminMemberService.getCeoSearchCount(search_type, search);
		} else if ( serviceName.equals("ceo_search") ) {
			
			adminMemberService = (AdminMemberServiceImpl) service;
			dbCount = adminMemberService.getCeoSearchCount(search_type, search);
		}
		
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

	public Map<String, String> getQuestionSearch(String search, String search_type, String proceed, String rpage, String ServiceName, Object service) {
		
		Map<String, String> param = new HashMap<String, String>();
		
		int startCount = 0;
		int endCount = 0;
		int pageSize = 10;
		int reqPage = 1;
		int pageCount = 1;
		int dbCount = 0;
		
		if ( ServiceName.equals("questionSearch") ) {
			
			adminQuestionService = (AdminQuestionServiceImpl) service;
			dbCount = adminQuestionService.getQuestionSearchCount(search_type, search, proceed);
		}
		
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
