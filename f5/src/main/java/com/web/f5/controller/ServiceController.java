package com.web.f5.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.web.f5.service.AdminBoardService;
import com.web.f5.service.AdminFaqService;
import com.web.f5.service.AdminQuestionService;
import com.web.f5.service.PageServiceImpl;
import com.web.f5.vo.AdminFaqVO;
import com.web.f5.vo.AdminQuestionVO;

@Controller
public class ServiceController {

	@Autowired
	private AdminFaqService adminFaqService;
	
	@Autowired
	private AdminQuestionService adminQuestionService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	@RequestMapping( value = "faq_list.do", method = RequestMethod.GET )
	public ModelAndView faq_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("faq_list");
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;
		
		if ( search == null ) {
			
			param = pageService.getPageResult(rpage, "faq", adminFaqService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminFaqService.getListResult(startCount, endCount);
		} else {
			
			param = pageService.getSearchResult(search_type, search, rpage, "faq_search", adminFaqService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminFaqService.getsearchListResult(startCount, endCount, search, search_type);
		}
		ArrayList<AdminFaqVO> list = new ArrayList<AdminFaqVO>();
	
		for ( Object obj : olist ) {
			
			list.add( (AdminFaqVO) obj );
		}
		
		mv.setViewName("service/faq_list");
	
		mv.addObject("list", list);
		mv.addObject("search_type", search_type);
		mv.addObject("search", search);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value = "/faq_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String faq_search_list(String rpage, String search, String search_type) {
		
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "faq_search", adminFaqService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminFaqVO> list = adminFaqService.getSearchJSONResult(startCount, endCount, search, search_type);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( AdminFaqVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("faqIdx", vo.getFaqIdx());
			obj.addProperty("faqTitle", vo.getFaqTitle());
			obj.addProperty("faqContent", vo.getFaqContent());
			obj.addProperty("faqDate", vo.getFaqDate());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
	
	@RequestMapping ( value = "/question_list.do", method = RequestMethod.GET )
	public ModelAndView question_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("question_list");
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;

		if ( search == null ) {
			
		param = pageService.getPageResult(rpage, "admin_Question", adminQuestionService);

		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		olist = adminQuestionService.getListResult(startCount, endCount);
		
		} else {
			
			param = pageService.getSearchResult(search_type, search, rpage, "question_search", adminQuestionService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminQuestionService.getSearchListResult(startCount, endCount, search, search_type);
		}
		ArrayList<AdminQuestionVO> list = new ArrayList<AdminQuestionVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminQuestionVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("dbCount", Integer.parseInt( param.get("dbCount") ));
		mv.addObject("pageSize", Integer.parseInt( param.get("pageSize") ));
		mv.addObject("reqPage", Integer.parseInt( param.get("reqPage") ));
		
		mv.setViewName("service/question_list");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping( value = "question_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String question_search_list(String search, String search_type, String rpage) {
		
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "question_search", adminQuestionService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminQuestionVO> list = adminQuestionService.getSearchJSONResult(startCount, endCount, search, search_type);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( AdminQuestionVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("questionIdx", vo.getQuestionIdx());
			obj.addProperty("memberId", vo.getMemberId());
			obj.addProperty("questionDate", vo.getQuestionDate());
			obj.addProperty("questionTitle", vo.getQuestionTitle());
			obj.addProperty("questionContent", vo.getQuestionContent());
			obj.addProperty("questionProceed", vo.getQuestionProceed());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
	
	@RequestMapping ( value = "question_write.do", method = RequestMethod.GET )
	public ModelAndView question_write() {
		
		adminBoardService.getInsertPageview("question_write");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("service/question_write");
		
		return mv;
	}
	
	@RequestMapping ( value = "question_write.do", method = RequestMethod.POST )
	public ModelAndView question_write(AdminQuestionVO vo, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		vo.setMemberId((String) session.getAttribute("memberId"));
		int result = adminQuestionService.getInsertResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/question_list.do");
		}
		
		return mv;
	}
	
	@RequestMapping ( value =  "question_content.do", method = RequestMethod.GET )
	public ModelAndView question_content(String idx) {
		
		ModelAndView mv = new ModelAndView();
		
		AdminQuestionVO vo = (AdminQuestionVO) adminQuestionService.getQuestionContent(idx);
		System.out.println(vo.getQuestionAnswer());
		mv.addObject("vo", vo);
		mv.setViewName("service/question_content");
		return mv;
	}
}
