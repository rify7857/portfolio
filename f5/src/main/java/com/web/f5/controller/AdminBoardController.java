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
import com.web.f5.service.BoardServiceImpl;
import com.web.f5.service.PageServiceImpl;
import com.web.f5.service.ReplyServiceImpl;
import com.web.f5.vo.AdminBoardVO;
import com.web.f5.vo.BoardVO;
import com.web.f5.vo.RecommendVO;
import com.web.f5.vo.ReplyVO;

@Controller
public class AdminBoardController {

	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private ReplyServiceImpl replyService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	@RequestMapping ( value = "/admin/board_list.do", method = RequestMethod.GET )
	public ModelAndView admin_board_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("board_list");
		
		ModelAndView mv = new ModelAndView();
		Map<String, String> param = null;
		List<Object> olist = null;

		if ( search == null ) {
			
			param = pageService.getPageResult(rpage, "admin_Board", adminBoardService);

			int startCount = Integer.parseInt(param.get("start"));
			int endCount = Integer.parseInt(param.get("end"));
			
			olist = adminBoardService.getListResult(startCount, endCount);
		} else {
			
			param = pageService.getSearchResult(search_type, search, rpage, "admin_board_search", adminBoardService);
			
			int startCount = Integer.parseInt( param.get("start") );
			int endCount = Integer.parseInt( param.get("end") );
			
			olist = adminBoardService.getSearchList(startCount, endCount, search, search_type);
		}
		
		ArrayList<AdminBoardVO> list = new ArrayList<AdminBoardVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminBoardVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		
		mv.setViewName("/admin/board/board_list");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/board_search_list.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String admin_board_search_list(String rpage, String search, String search_type) {
		System.out.println(search);
		System.out.println(search_type);
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "admin_board_search", adminBoardService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminBoardVO> list = adminBoardService.getSearchJSONResult(startCount, endCount, search, search_type);
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( AdminBoardVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("boardIdx", vo.getBoardIdx());
			obj.addProperty("memberId", vo.getMemberId());
			obj.addProperty("boardHits", vo.getBoardHits());
			obj.addProperty("boardTitle", vo.getBoardTitle());
			obj.addProperty("boardContent", vo.getBoardContent());
			obj.addProperty("boardDate", vo.getBoardDate());
			obj.addProperty("boardCategory", vo.getBoardCategory());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
	
	@RequestMapping ( value = "/admin/board_content.do", method = RequestMethod.GET )
	public ModelAndView admin_board_content(String idx, String rno, HttpSession session) {
		
		adminBoardService.getInsertPageview("board_content");
		
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
		
		mv.setViewName("admin/board/board_content");
		
		return mv;
	}
	
	@RequestMapping ( value = "/admin/board_delete.do", method = RequestMethod.GET )
	public ModelAndView admin_board_delete(String idx) {
		
		ModelAndView mv = new ModelAndView();
		
		int result = adminBoardService.getDeleteResult(idx);
		
		if ( result == 1 ) {
			
			mv.setViewName("redirect:/admin/board_list.do");
		} else {
			
			// errorPage
		}
		
		return mv;
	}
	
	// 댓글삭제
	@ResponseBody
	@RequestMapping(value="admin/reply_delete.do", method=RequestMethod.GET)
	public void board_reply_delete(String replyIdx, String boardIdx) {
		replyService.getDeleteResult(replyIdx);
	}
}
