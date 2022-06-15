package com.web.f5.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.web.f5.service.BoardPageServiceImpl;
import com.web.f5.service.BoardServiceImpl;
import com.web.f5.service.FileServiceImpl;
import com.web.f5.service.ReplyServiceImpl;
import com.web.f5.vo.BoardVO;
import com.web.f5.vo.RecommendVO;
import com.web.f5.vo.ReplyVO;

@Controller
public class BoardController {

	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private ReplyServiceImpl replyService;
	
	@Autowired
	private BoardPageServiceImpl boardpageService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private FileServiceImpl fileService;
	
	// 게시글 분류
	@ResponseBody
	@RequestMapping(value="/board_change.do", method=RequestMethod.POST, produces = "application/text; charset=UTF-8")
	public String board_select(String boardCategory, String rpage, String search, String search_type) {
		//ModelAndView mv = new ModelAndView();
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		Map<String, String> param = null;

		
		if(search == "") {

			param = boardpageService.getPageResult(rpage, boardCategory);
			
			int startCount = Integer.parseInt(param.get("start"));
			int endCount = Integer.parseInt(param.get("end"));
			list = boardService.getSelectList(boardCategory, startCount, endCount);			
		} else {
			param = boardpageService.getBoardSearch(rpage, boardCategory, search, search_type);
			
			
			int startCount = Integer.parseInt(param.get("start"));
			int endCount = Integer.parseInt(param.get("end"));
			list = boardService.getSearchSelectList(boardCategory, startCount, endCount, search, search_type);
			System.out.println("null이 아닌 경우의 list = " + list);
		}
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		JsonArray plist = new JsonArray();
		Gson gson = new Gson();
		
		
		for(BoardVO bvo : list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("rno", bvo.getRno());
			obj.addProperty("boardIdx", bvo.getBoardIdx());
			obj.addProperty("memberId", bvo.getMemberId());
			obj.addProperty("boardHits", bvo.getBoardHits());
			obj.addProperty("boardTitle", bvo.getBoardTitle());
			obj.addProperty("boardContent", bvo.getBoardContent());
			obj.addProperty("boardDate", bvo.getBoardDate());
			obj.addProperty("boardUpdateDate", bvo.getBoardUpdateDate());
			obj.addProperty("boardCategory", bvo.getBoardCategory());
			
			jlist.add(obj);
		}
		
		JsonObject pobj = new JsonObject();
		
		pobj.addProperty("dbCount", Integer.parseInt(param.get("dbCount")));
		pobj.addProperty("pageSize", Integer.parseInt(param.get("pageSize")));
		pobj.addProperty("reqPage", Integer.parseInt(param.get("reqPage")));
		plist.add(pobj);
		
		jdata.add("jlist", jlist);
		jdata.add("plist", plist);
		
		System.out.println(gson.toJson(jdata));
		return gson.toJson(jdata);
		
		
		
		
	}
	
	// 게시판 삭제 처리
	@RequestMapping(value = "/board_delete.do", method=RequestMethod.POST)
	public String board_delete(String boardIdx) {
		boardService.getDeleteResult(boardIdx);
		
		
		return "redirect:/board_list.do";
	}
	
	
	// 게시판 수정처리
	@RequestMapping(value="/board_update.do", method=RequestMethod.POST) 
	public ModelAndView board_update(BoardVO vo, HttpServletRequest request) throws Exception {
	ModelAndView mv = new ModelAndView();
	
	List<String> oldFile = new ArrayList<String>();
	oldFile.add(vo.getBsFile1());
	oldFile.add(vo.getBsFile2());
	oldFile.add(vo.getBsFile3());
	oldFile.add(vo.getBsFile4());
	oldFile.add(vo.getBsFile5());

	vo = fileService.mutiFileCheck(vo);
	vo.setBoardContent(vo.getBoardContent().replaceAll("\r\n", "<br>"));
	int result = boardService.getContentUpdate(vo);
	
	if( result == 1 ) {
		int check = fileService.multiFileSave(vo, request, oldFile);

		if( check == 1 ) {
			vo.setbFile1(vo.getbFiles().get(0));
			vo.setbFile2(vo.getbFiles().get(1));
			vo.setbFile3(vo.getbFiles().get(2));
			vo.setbFile4(vo.getbFiles().get(3));
			vo.setbFile5(vo.getbFiles().get(4));
			vo.setBsFile1(vo.getBsFiles().get(0));
			vo.setBsFile2(vo.getBsFiles().get(1));
			vo.setBsFile3(vo.getBsFiles().get(2));
			vo.setBsFile4(vo.getBsFiles().get(3));
			vo.setBsFile5(vo.getBsFiles().get(4));
			
			boardService.getFileUpdateResult(vo);				
		}
	}
	

	mv.setViewName("redirect:/board_content.do?boardIdx="+vo.getBoardIdx());
	
	return mv;
	}
	
	// 게시글 추천
	@ResponseBody
	@RequestMapping(value="/board_recommend.do", method=RequestMethod.POST)
	public void board_Recommend(RecommendVO vo) {

		int result = boardService.getRecoCheckResult(vo.getBoardIdx(), vo.getMemberId());
		if(result == 0) {
			boardService.getRecoInsertResult(vo);

		} else {

			if(vo.getBoardRecommendCheck().equals("0") || vo.getBoardRecommendCheck().equals("1")) {

				boardService.getRecoUpdateResult(vo);
				
			} else if(vo.getBoardRecommendCheck().equals("2")) {
				boardService.getRecoDeleteResult(vo);
			}
		}
	}
	

	// 게시판 수정
	@RequestMapping(value = "/board_update.do", method = RequestMethod.GET)
	public ModelAndView board_update(String boardIdx) {
		
		adminBoardService.getInsertPageview("board_update");
		
		ModelAndView mv = new ModelAndView();
		BoardVO vo = boardService.getContentList(boardIdx);
		vo.setBoardContent(vo.getBoardContent().replace("<br>", "\r\n"));
		mv.addObject("vo", vo);
		mv.setViewName("/board/board_update");

		return mv;
	}

	// 게시판 상세
	@RequestMapping(value = "/board_content.do", method = RequestMethod.GET)
	public ModelAndView boardContent(String boardIdx, HttpSession session) {
		
		adminBoardService.getInsertPageview("board_content");
		
		ModelAndView mv = new ModelAndView();
		boardService.getUpdateHits(boardIdx);
		
		String memberId = null;
		
		if( (String)session.getAttribute("memberId") != null ) {
			memberId = (String)session.getAttribute("memberId");			
		} else {
			memberId = "Guest";
		}
		System.out.println(memberId);
		List<ReplyVO> rlist = new ArrayList<ReplyVO>();
		List<String> ridx = new ArrayList<String>();
		
		rlist = replyService.getSelectList(boardIdx);
		ridx = replyService.getSelectIdxList(boardIdx);		
		System.out.println(ridx);
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
		
		BoardVO vo = boardService.getContentList(boardIdx);
		
		RecommendVO brvo = null;
		
		if(boardService.getRecoCheckResult(boardIdx, memberId) !=0 ) {
			brvo = boardService.getRecoSelect(boardIdx, memberId);

			mv.addObject("brvo", brvo);
		}
		
		int reco = boardService.getRecoCountResult("0", boardIdx);
		int deco = boardService.getRecoCountResult("1", boardIdx);
		
		
		mv.addObject("vo", vo);
		mv.addObject("rlist", rlist);
		mv.addObject("memberId", memberId);
		mv.addObject("reco",reco);
		mv.addObject("deco",deco);
		mv.addObject("brvo", brvo);
		
		mv.setViewName("/board/board_content");
		return mv;
	}

	// 게시판 쓰기처리
	@RequestMapping(value = "/board_write.do", method = RequestMethod.POST)
	public ModelAndView board_write(BoardVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		vo = fileService.mutiFileCheck(vo);
		vo.setBoardCategory("일반");
		vo.setBoardContent(vo.getBoardContent().replaceAll("\r\n", "<br>"));
		int result = boardService.getInsertResult(vo);
		if( result == 1 ) {
			fileService.multiFileSave(vo, request);
		}
		
		mv.setViewName("redirect:/board_list.do");

		return mv;
	}

	// 게시판 쓰기
	@RequestMapping(value = "/board_write.do", method = RequestMethod.GET)
	public String board_write() {

		adminBoardService.getInsertPageview("board_write");
		
		return "/board/board_write";
	}
	
	
	
	
	
	
	// 게시판리스트
	@ResponseBody
	@RequestMapping(value = "/board_rlist.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String board_rlist(String rpage, String boardCategory, String search, String search_type) {
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		Map<String, String> param = null;
			
		if(search == null) {
			param = boardpageService.getPageResult(rpage, boardCategory);
			int startCount = Integer.parseInt(param.get("start"));
			int endCount = Integer.parseInt(param.get("end"));
			list = boardService.getSelectList(boardCategory, startCount, endCount);			
		} else {

			param = boardpageService.getBoardSearch(rpage, boardCategory, search, search_type);
			int startCount = Integer.parseInt(param.get("start"));
			int endCount = Integer.parseInt(param.get("end"));
			list = boardService.getSearchSelectList(boardCategory, startCount, endCount, search, search_type);

		}
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		
		for(BoardVO bvo : list) {
			JsonObject obj = new JsonObject();
			obj.addProperty("rno", bvo.getRno());
			obj.addProperty("boardIdx", bvo.getBoardIdx());
			obj.addProperty("memberId", bvo.getMemberId());
			obj.addProperty("boardHits", bvo.getBoardHits());
			obj.addProperty("boardTitle", bvo.getBoardTitle());
			obj.addProperty("boardContent", bvo.getBoardContent());
			obj.addProperty("boardDate", bvo.getBoardDate());
			obj.addProperty("boardUpdateDate", bvo.getBoardUpdateDate());
			obj.addProperty("boardCategory", bvo.getBoardCategory());
			
			jlist.add(obj);
		}
		jdata.add("jlist", jlist);
		System.out.println(gson.toJson(jdata));
		return gson.toJson(jdata);
		
	}
	
	
	// 게시판리스트 출력
	@RequestMapping(value = "/board_list.do", method = RequestMethod.GET)
	public ModelAndView board_list(String rpage, String boardCategory, String search, String search_type) {
		
		adminBoardService.getInsertPageview("board_list");
		
		ModelAndView mv = new ModelAndView();

		if(boardCategory == null) {
			boardCategory = "3";
		}
		
		Map<String, String> param = null;
		List<BoardVO> list = new ArrayList<BoardVO>();

		if(search == null) {

			param = boardpageService.getPageResult(rpage, boardCategory);
			int startCount = Integer.parseInt(param.get("start"));
			int endCount = Integer.parseInt(param.get("end"));
			list = boardService.getSelectList(boardCategory, startCount, endCount);			
		} else {

			param = boardpageService.getBoardSearch(rpage, boardCategory, search, search_type);
			int startCount = Integer.parseInt(param.get("start"));
			int endCount = Integer.parseInt(param.get("end"));
			list = boardService.getSearchSelectList(boardCategory, startCount, endCount, search, search_type);

		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("boardCategory", boardCategory);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		
		mv.setViewName("/board/board_list");

		return mv;
	}

}
