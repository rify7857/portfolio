package com.web.f5.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.web.f5.service.AdminMemberService;
import com.web.f5.service.AdminStoreService;
import com.web.f5.service.PageServiceImpl;
import com.web.f5.vo.AdminMemberVO;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private PageServiceImpl pageService;

	@RequestMapping ( value = "/admin/member_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public ModelAndView admin_member_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("member_list");
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;
		if ( search == null && search_type == null ) {
			
			param = pageService.getPageResult(rpage, "admin_Member", adminMemberService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminMemberService.getListResult(startCount, endCount);
		} else {
			
			param = pageService.getSearchResult(search_type, search, rpage,  "admin_Member", adminMemberService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );

			olist = adminMemberService.getSearchListResult(startCount, endCount, search, search_type);
		}
		ArrayList<AdminMemberVO> list = new ArrayList<AdminMemberVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminMemberVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search_type", search_type);
		mv.addObject("search", search);
		mv.addObject("dbCount", Integer.parseInt( param.get("dbCount") ));
		mv.addObject("pageSize", Integer.parseInt( param.get("pageSize") ));
		mv.addObject("reqPage", Integer.parseInt( param.get("reqPage") ));
		
		mv.setViewName("admin/member/member_list");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/member_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String admin_member_search_list(String rpage, String search, String search_type) {
		
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "admin_member_search", adminMemberService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminMemberVO> list = adminMemberService.getSearchJSONResult(startCount, endCount, search, search_type);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( AdminMemberVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("memberId", vo.getMemberId());
			obj.addProperty("memberName", vo.getMemberName());
			obj.addProperty("memberBirth", vo.getMemberBirth());
			obj.addProperty("memberAuthority", vo.getMemberAuthority());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/ceo_member_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String admin_ceo_member_search_list(String rpage, String search, String search_type) {
		
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "admin_ceo_member_search", adminMemberService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminMemberVO> list = adminMemberService.getCeoSearchJSONResult(startCount, endCount, search, search_type);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( AdminMemberVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("memberId", vo.getMemberId());
			obj.addProperty("memberName", vo.getMemberName());
			obj.addProperty("memberAuthority", vo.getMemberAuthority());
			obj.addProperty("storeIdx", vo.getStoreIdx());
			obj.addProperty("storeName", vo.getStoreName());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
	
	@RequestMapping ( value = "/admin/member_content.do", method = RequestMethod.GET )
	public ModelAndView admin_member_content(String id, String rno) {
		
		adminBoardService.getInsertPageview("member_content");
		
		ModelAndView mv = new ModelAndView();
		AdminMemberVO vo = (AdminMemberVO) adminMemberService.getContent(id);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		
		mv.setViewName("admin/member/member_content");
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/member_insert.do", method = RequestMethod.GET )
	public String admin_member_insert() {
		
		adminBoardService.getInsertPageview("member_insert");
		
		return "admin/member/member_insert";
	}
	
	@ResponseBody
	@RequestMapping ( value = "/admin/idChk.do", method = RequestMethod.GET )
	public String idChk(String id) {
		
		String msg = "";
		
		int result = adminMemberService.getIdChk(id);
		
		if ( result == 1 ) {
			
			msg = "fail";
		} else {
			
			msg = "succ";
		}
		
		return msg;
	}
	
	@RequestMapping ( value = "/admin/member_insert.do", method = RequestMethod.POST )
	public ModelAndView admin_member_insert(AdminMemberVO vo) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminMemberService.getInsertResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/member_list.do");
		} else {
			
			// error page
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/member_update.do", method = RequestMethod.GET )
	public ModelAndView admin_member_update(String id, String rno) {
		
		adminBoardService.getInsertPageview("member_update");
		
		ModelAndView mv = new ModelAndView();
		AdminMemberVO vo = (AdminMemberVO) adminMemberService.getContent(id);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		
		mv.setViewName("admin/member/member_update");
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/member_update.do", method = RequestMethod.POST )
	public ModelAndView admin_member_update(AdminMemberVO vo) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminMemberService.getUpdateResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/member_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/member_delete.do", method = RequestMethod.GET )
	public ModelAndView admin_member_delete(String id) {
		
		ModelAndView mv = new ModelAndView();
		int result = adminMemberService.getDeleteResult(id);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/member_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value = "/admin/chkMberAuthUpdate.do", method = RequestMethod.GET )
	public String chk_mber_auth_update(String id, String auth) {
		
		String msg = "";
		int result = adminMemberService.chkMberUpdate(id, auth);
		
		if ( result == 1 ) {
			
			msg = "success";
		} else {
			
			msg = "fail";
		}
		
		return msg;
	}
	
	@RequestMapping ( value = "/admin/ceo_member_list.do", method = RequestMethod.GET )
	public ModelAndView admin_ceo_member_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("ceo_member_list");
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;
		
		if ( search == null ) {
			
			param = pageService.getPageResult(rpage, "admin_ceo", adminMemberService);
			System.out.println(param);
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminMemberService.getCeoListResult(startCount, endCount);
		} else {
			
			param = pageService.getSearchResult(search_type, search, rpage, "ceo_search", adminMemberService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminMemberService.getCeoSearchResult(startCount, endCount, search, search_type);
		}
		
		ArrayList<AdminMemberVO> list = new ArrayList<AdminMemberVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminMemberVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		
		mv.setViewName("admin/member/ceo_member_list");
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/ceo_member_content.do", method = RequestMethod.GET )
	public ModelAndView admin_ceo_member_content(String id, String rno) {
		
		adminBoardService.getInsertPageview("ceo_member_content");
		
		ModelAndView mv = new ModelAndView();
		
		AdminMemberVO vo = (AdminMemberVO) adminMemberService.getContent(id);
		
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		
		mv.setViewName("admin/member/ceo_member_content");
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/ceo_member_update.do", method = RequestMethod.GET )
	public ModelAndView admin_ceo_member_update(String id) {
		
		adminBoardService.getInsertPageview("ceo_member_update");
		
		ModelAndView mv = new ModelAndView();
		
		AdminMemberVO vo = (AdminMemberVO) adminMemberService.getContent(id);
		
		mv.addObject("vo", vo);
		mv.setViewName("admin/member/ceo_member_update");
		return mv;
	}
	
	@RequestMapping ( value = "/admin/ceo_member_update.do", method = RequestMethod.POST )
	public ModelAndView admin_ceo_member_update(AdminMemberVO vo) {
		
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminMemberService.getUpdateResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/ceo_member_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/ceo_member_delete.do", method = RequestMethod.GET )
	public ModelAndView admin_ceo_member_delete(String id) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminMemberService.getDeleteResult(id);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/ceo_member_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "admin/black_member_list.do", method = RequestMethod.GET )
	public ModelAndView black_mber_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("black_member_list");
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;
		
		if ( search == null ) {
			
			param = pageService.getPageResult(rpage, "black_list", adminMemberService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminMemberService.getBlackListResult(startCount, endCount);
		} else {
			
			param = pageService.getSearchResult(search_type, search, rpage, "black_search_list", adminMemberService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminMemberService.getBlackMberSearch(startCount, endCount, search, search_type);
		}
		
		ArrayList<AdminMemberVO> list = new ArrayList<AdminMemberVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminMemberVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));		
		
		mv.setViewName("admin/member/black_list");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/black_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String black_search_list(String rpage, String search, String search_type) {
		
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "black_search_list", adminMemberService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminMemberVO> list = adminMemberService.getBlackSearchList(startCount, endCount, search, search_type);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( AdminMemberVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("memberId", vo.getMemberId());
			obj.addProperty("memberName", vo.getMemberName());
			obj.addProperty("memberTel", vo.getMemberTel());
			obj.addProperty("memberBirth", vo.getMemberBirth());
			obj.addProperty("memberAuthority", vo.getMemberAuthority());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
}
