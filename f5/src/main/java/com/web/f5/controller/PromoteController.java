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
import com.web.f5.service.BoardService;
import com.web.f5.service.BoardServiceImpl;
import com.web.f5.service.FileServiceImpl;
import com.web.f5.vo.BoardVO;

@Controller
public class PromoteController {
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Autowired
	private BoardPageServiceImpl boardpageService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private FileServiceImpl fileService;
	
	
	// CEO 체크
	@ResponseBody
	@RequestMapping(value="/ceo_check.do", method=RequestMethod.GET)
	public String ceo_check(HttpSession session) {
		
		String memberId = (String)session.getAttribute("memberId");
		
		if( memberId == null ) {
			memberId = "none";
		}

		int result = boardService.getCeoCheck(memberId);
		
		return String.valueOf(result);
	}
	
	
	// 홍보 삭제처리
	@RequestMapping(value="/promote_delete.do", method=RequestMethod.GET)
	public ModelAndView promote_delete(String boardIdx) {
		ModelAndView mv = new ModelAndView();
		
		boardService.getDeleteResult(boardIdx);
		
		mv.setViewName("redirect:/promote_list.do");
		
		return mv;
	}
	
	// 홍보 수정처리
	@RequestMapping(value="/promote_update.do", method=RequestMethod.POST)
	public ModelAndView promote_update(BoardVO vo, HttpServletRequest request) throws Exception {
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
		
		mv.setViewName("redirect:/promote_list.do");
		
		return mv;
	}
	
	
	// 홍보 수정
	@RequestMapping(value="/promote_update.do", method=RequestMethod.GET)
	public ModelAndView promote_update(String boardIdx) {
		
		adminBoardService.getInsertPageview("promote_update");
		
		ModelAndView mv = new ModelAndView();
		BoardVO vo = boardService.getContentList(boardIdx);
		vo.setBoardContent(vo.getBoardContent().replace("<br>", "\r\n"));
		mv.addObject("vo", vo);
		mv.setViewName("board/promote/promote_update");
		
		return mv;
	}
	
	
	
	// 홍보 쓰기 처리
	@RequestMapping(value="/promote_write.do", method=RequestMethod.POST)
	public ModelAndView promote_write(BoardVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		vo = fileService.mutiFileCheck(vo);
		vo.setBoardCategory("홍보");
		vo.setBoardContent(vo.getBoardContent().replaceAll("\r\n", "<br>"));
		int result = boardService.getInsertResult(vo);
		if( result == 1) {
			fileService.multiFileSave(vo, request);
		}
		
		mv.setViewName("redirect:/promote_list.do");
		
		return mv;
		
	}
	
	// 홍보 쓰기
	@RequestMapping(value="/promote_write.do", method=RequestMethod.GET)
	public String promote_write() {
		
		adminBoardService.getInsertPageview("promote_update");
		
		return "board/promote/promote_write";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/promote_rlist.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String board_rlist(String rpage, String boardCategory, String search, String search_type) {
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		Map<String, String> param = null;
		
		System.out.println(search);
		
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
			obj.addProperty("bsFile1", bvo.getBsFile1());
			
			jlist.add(obj);
		}
		jdata.add("jlist", jlist);
		System.out.println(gson.toJson(jdata));
		return gson.toJson(jdata);
		
	}
	
	
	// 홍보 리스트
	@RequestMapping(value="/promote_list.do", method=RequestMethod.GET)
	public ModelAndView promote_list(String rpage, String search, String search_type) {
		
		adminBoardService.getInsertPageview("promote_update");
		
		ModelAndView mv = new ModelAndView();
		List<BoardVO> list = new ArrayList<BoardVO>();
		String boardCategory = "1";
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
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("search_type", search_type);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		mv.setViewName("board/promote/promote_list");
		
		return mv;
	}
}








