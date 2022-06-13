package com.web.f5.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.web.f5.service.AdminFaqService;
import com.web.f5.service.PageServiceImpl;
import com.web.f5.vo.AdminFaqVO;

@Controller
public class AdminFaqController {

	@Autowired
	private AdminFaqService adminFaqService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	@RequestMapping ( value = "admin/faq_list.do", method = RequestMethod.GET )
	public ModelAndView faq_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("admin/faq_list");
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;
		
		if ( search == null ) {
			
			param = pageService.getPageResult(rpage, "admin_faq", adminFaqService);
				
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
		
		mv.setViewName("admin/faq/faq_list");

		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/faq_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String admin_faq_search_list(String rpage, String search, String search_type) {
		
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
	@RequestMapping ( value = "admin/faq_write.do", method = RequestMethod.GET )
	public ModelAndView faq_write() {
		
		adminBoardService.getInsertPageview("admin/faq_write");
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("admin/faq/faq_write");
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/faq_write.do", method = RequestMethod.POST )
	public ModelAndView faq_write( AdminFaqVO vo ) {
		
		ModelAndView mv = new ModelAndView();
		vo.setFaqContent(vo.getFaqContent().replaceAll("\r\n", "<br>"));
		int result = adminFaqService.getInsertResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/faq_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/faq_update.do", method = RequestMethod.GET )
	public ModelAndView faq_update( String idx, String rno ) {
		
		adminBoardService.getInsertPageview("admin/faq_update");
		
		ModelAndView mv = new ModelAndView();
		AdminFaqVO vo = (AdminFaqVO) adminFaqService.getContent(idx);
		vo.setFaqContent(vo.getFaqContent().replaceAll("<br>", "\r\n"));
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		
		mv.setViewName("admin/faq/faq_update");
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/faq_update.do", method = RequestMethod.POST )
	public ModelAndView faq_update(AdminFaqVO vo) {
		
		ModelAndView mv = new ModelAndView();
		vo.setFaqContent(vo.getFaqContent().replaceAll("\r\n", "<br>"));
		int result = adminFaqService.getUpdateResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/faq_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/faq_delete.do", method = RequestMethod.GET )
	public ModelAndView faq_delete(String idx) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminFaqService.getDeleteResult(idx);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/faq_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
}
