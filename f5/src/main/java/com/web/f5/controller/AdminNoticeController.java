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
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.web.f5.service.AdminBoardService;
import com.web.f5.service.AdminNoticeService;
import com.web.f5.service.BoardServiceImpl;
import com.web.f5.service.PageServiceImpl;
import com.web.f5.service.ReplyServiceImpl;
import com.web.f5.vo.AdminNoticeVO;
import com.web.f5.vo.BoardVO;
import com.web.f5.vo.RecommendVO;
import com.web.f5.vo.ReplyVO;

@Controller
public class AdminNoticeController {

	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private ReplyServiceImpl replyService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	@RequestMapping ( value = "/admin/notice_list.do", method = RequestMethod.GET )
	public ModelAndView admin_notice_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("notice_list");
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;
		
		if ( search == null ) {
			
			param = pageService.getPageResult(rpage, "admin_Notice", adminNoticeService);
				
				int startCount = Integer.parseInt(param.get("start"));
				int endCount = Integer.parseInt(param.get("end"));
				
			olist = adminNoticeService.getListResult(startCount, endCount);
		} else {
			
			param = pageService.getSearchResult(search_type, search, rpage, "notice_search", adminNoticeService);
			
			int startCount = Integer.parseInt(param.get("start"));
			int endCount = Integer.parseInt(param.get("end"));
			
			olist = adminNoticeService.getSearchListResult(startCount, endCount, search, search_type);
		}
		ArrayList<AdminNoticeVO> list = new ArrayList<AdminNoticeVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminNoticeVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		
		mv.setViewName("admin/notice/notice_list");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value =  "/admin/notice_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String notice_search_list(String search, String search_type, String rpage) {
		
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "notice_search", adminNoticeService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminNoticeVO> list = adminNoticeService.getSearchJSONResult(startCount, endCount, search, search_type);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( AdminNoticeVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("boardIdx", vo.getBoardIdx());
			obj.addProperty("memberId", vo.getMemberId());
			obj.addProperty("boardHits", vo.getBoardHits());
			obj.addProperty("boardTitle", vo.getBoardTitle());
			obj.addProperty("boardContent", vo.getBoardContent());
			obj.addProperty("boardDate", vo.getBoardDate());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
	
	@RequestMapping ( value = "/admin/notice_content.do", method = RequestMethod.GET )
	public ModelAndView admin_notice_content(String idx, String rno, HttpSession session) {
		
		adminBoardService.getInsertPageview("notice_content");
		
ModelAndView mv = new ModelAndView();
		
		String memberId = null;
		
		if( (String)session.getAttribute("memberId") != null ) {
			memberId = (String)session.getAttribute("memberId");			
		} else {
			memberId = "Guest";
		}
		
		List<ReplyVO> rlist = new ArrayList<ReplyVO>();
		List<String> ridx = new ArrayList<String>();
		
		rlist = replyService.getSelectList(idx);
		ridx = replyService.getSelectIdxList(idx);		
		
		for(ReplyVO lvo : rlist) {
			
			for(String r : ridx) {
				if(lvo.getreplyIdx().equals(r)) {
					int recount = replyService.getRecoCountResult("0", r);
					int decount = replyService.getRecoCountResult("1", r);
					lvo.setRecoCount(recount);
					lvo.setDerecoCount(decount);
					
					ReplyVO vo = lvo;
					//int result = replyService.getRecoCheckResult(vo);
					
					vo.setReplyRecommendCheck(replyService.getSelectReCheck(r, memberId));
						
				}
			
			}
		}
		
		BoardVO vo = boardService.getContentList(idx);
		
		RecommendVO brvo = null;
		
		if(boardService.getRecoCheckResult(idx, memberId) !=0 ) {
			brvo = boardService.getRecoSelect(idx, memberId);

			mv.addObject("brvo", brvo);
		}
		
		int reco = boardService.getRecoCountResult("0", idx);
		int deco = boardService.getRecoCountResult("1", idx);
		
		
		mv.addObject("vo", vo);
		mv.addObject("rlist", rlist);
		mv.addObject("memberId", memberId);
		mv.addObject("reco",reco);
		mv.addObject("deco",deco);
		mv.addObject("brvo", brvo);
		
		mv.setViewName("admin/notice/notice_content");
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/notice_write.do", method = RequestMethod.GET )
	public String admin_notice_write() {
		
		adminBoardService.getInsertPageview("notice_write");
		
		return "admin/notice/notice_write";
	}
	
	@RequestMapping ( value = "/admin/notice_write.do", method = RequestMethod.POST )
	public ModelAndView admin_notice_write(AdminNoticeVO vo) {
		
		ModelAndView mv = new ModelAndView();
		vo.setBoardContent(vo.getBoardContent().replace("\r\n", "<br>"));
		int result = adminNoticeService.getInsertResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/notice_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/notice_update.do", method = RequestMethod.GET )
	public ModelAndView admin_notice_update(String idx, String rno) {
		
		adminBoardService.getInsertPageview("notice_update");
		
		ModelAndView mv = new ModelAndView();
		AdminNoticeVO vo = (AdminNoticeVO) adminNoticeService.getContent(idx);
		vo.setBoardContent(vo.getBoardContent().replace("<br>", "\r\n"));
		mv.addObject("vo", vo);
		mv.addObject("rno", rno);
		
		mv.setViewName("admin/notice/notice_update");
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/notice_update.do", method = RequestMethod.POST )
	public ModelAndView admin_notice_update(AdminNoticeVO vo) {
		
		ModelAndView mv = new ModelAndView();
		vo.setBoardContent(vo.getBoardContent().replace("\r\n", "<br>"));
		int result = adminNoticeService.getUpdateResult(vo);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/notice_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/notice_delete.do", method = RequestMethod.GET )
	public ModelAndView admin_notice_delete(String idx) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminNoticeService.getDeleteResult(idx);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/notice_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
}
