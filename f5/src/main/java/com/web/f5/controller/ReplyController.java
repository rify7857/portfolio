package com.web.f5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.f5.service.ReplyServiceImpl;
import com.web.f5.vo.RecommendVO;
import com.web.f5.vo.ReplyVO;


@Controller
public class ReplyController {
	
	@Autowired
	private ReplyServiceImpl replyService;
	
	
	// 댓글추천
	@ResponseBody
	@RequestMapping(value="/reply_recommend.do", method=RequestMethod.POST)
	public void reply_Recommend(ReplyVO vo) {

		int result = replyService.getRecoCheckResult(vo);
		if(result == 0) {
			replyService.getRecoInsertResult(vo);
			System.out.println(result);
		} else {
			System.out.println("update");
			System.out.println(vo.getReplyRecommendCheck());
			if(vo.getReplyRecommendCheck().equals("0") || vo.getReplyRecommendCheck().equals("1")) {
				System.out.println(vo.getReplyRecommendCheck());
				replyService.getRecoUpdateResult(vo);
				System.out.println("처리완료");
			} else if(vo.getReplyRecommendCheck().equals("2")) {
				replyService.getRecoDeleteResult(vo);
			}
		}
	}
	
	// 댓글수정
	@ResponseBody
	@RequestMapping(value="/reply_update.do", method=RequestMethod.POST)
	public void reply_update(ReplyVO vo) {

		replyService.getUpdateResult(vo);
	}
	
	// 댓글삭제
	@ResponseBody
	@RequestMapping(value="/reply_delete.do", method=RequestMethod.GET)
	public void board_reply_delete(String replyIdx, String boardIdx) {
		replyService.getDeleteResult(replyIdx);
		
		//return "redirect:/board_content.do?boardIdx=" + boardIdx;
	}
	
	// 댓글쓰기
	@RequestMapping(value="/reply_write.do", method=RequestMethod.POST)
	public ModelAndView board_reply_write(ReplyVO vo) {
		ModelAndView mv = new ModelAndView();
		replyService.getInsertResult(vo);

		mv.addObject("re_vo", vo);		
		mv.setViewName("redirect:/board_content.do?boardIdx="+vo.getboardIdx());
		return mv;
		
	}
	
}
