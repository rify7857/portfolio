package com.web.f5.controller;

import java.util.ArrayList;
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
import com.web.f5.service.AdminQuestionService;
import com.web.f5.service.PageServiceImpl;
import com.web.f5.vo.AdminQuestionVO;

@Controller
public class AdminQuestionController {
	
	@Autowired
	private AdminQuestionService adminQuestionService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	@RequestMapping ( value = "admin/question_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8"  )
	public ModelAndView admin_question_list(String rpage, String search, String search_type, String proceed) {
		
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
			
			param = pageService.getQuestionSearch(search, search_type, proceed, rpage, "questionSearch", adminQuestionService);
			
			int startCount = Integer.parseInt( param.get("start") ); 
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminQuestionService.getQuestionSearchList(startCount, endCount, search, search_type, proceed);
		}
		
		ArrayList<AdminQuestionVO> list = new ArrayList<AdminQuestionVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminQuestionVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("proceed", proceed);
		mv.addObject("dbCount", Integer.parseInt( param.get("dbCount") ));
		mv.addObject("pageSize", Integer.parseInt( param.get("pageSize") ));
		mv.addObject("reqPage", Integer.parseInt( param.get("reqPage") ));
		
		mv.setViewName("admin/question/question_list");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/question_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8"  )
	public String admin_question_search_list(String rpage, String search, String search_type, String proceed) {
		
		Map<String, String> param = pageService.getQuestionSearch(search, search_type, proceed, rpage, "question_search", adminQuestionService);
		
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
	
	@ResponseBody
	@RequestMapping ( value = "admin/question_search_proceed.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String question_search_proceed(String rpage, String search, String search_type, String proceed) {
		
		Map<String, String> param = pageService.getQuestionSearch(search, search_type, proceed, rpage, "question_search", adminQuestionService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminQuestionVO> list = adminQuestionService.getProceedSearchJSONResult(startCount, endCount, search, search_type, proceed);
		
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
	
	@RequestMapping ( value = "admin/question_content.do", method = RequestMethod.GET )
	public ModelAndView admin_question_content(String idx, String rno) {
		
		adminBoardService.getInsertPageview("question_content");
		
		ModelAndView mv = new ModelAndView();
		
		AdminQuestionVO vo = (AdminQuestionVO) adminQuestionService.getContent(idx);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		
		mv.setViewName("admin/question/question_content");
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/question_delete.do", method = RequestMethod.GET )
	public ModelAndView admin_question_delete(String idx, String rno) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminQuestionService.getDeleteResult(idx);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/question_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/question_receive.do", method = RequestMethod.GET )
	public ModelAndView admin_question_receive(String idx, String rno) {
		
		adminBoardService.getInsertPageview("question_receive");
		
		ModelAndView mv = new ModelAndView();
		AdminQuestionVO vo = null;
		int result = adminQuestionService.receiveBefore(idx);
		
		if ( result == 1 ) {
			
			vo = (AdminQuestionVO) adminQuestionService.getContent(idx);
		} else {
			
			//errorPage
		}
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		
		mv.setViewName("admin/question/question_receive");
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/question_receive.do", method = RequestMethod.POST )
	public ModelAndView admin_question_receive(AdminQuestionVO vo) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminQuestionService.getUpdateResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/question_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
}
