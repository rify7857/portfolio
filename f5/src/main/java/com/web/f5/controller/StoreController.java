package com.web.f5.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthOptionPaneUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.web.f5.service.MemberService;
import com.web.f5.vo.MemberVO;
import com.web.f5.service.AdminMemberService;
import com.web.f5.service.CEOService;
import com.web.f5.service.ReservationService;
import com.web.f5.service.ReviewService;
import com.web.f5.service.StoreService;
import com.web.f5.vo.AdminMemberVO;
import com.web.f5.vo.ReservationVO;
import com.web.f5.vo.ReviewVO;
import com.web.f5.vo.StoreVO;
@Controller
public class StoreController {

	@Autowired
	AdminMemberService adminMemberService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	StoreService storeService;
	@Autowired
	ReservationService reservationService;
	@Autowired
	MemberService memberService;
	@Autowired
	CEOService CeoService;
		

		@RequestMapping(value = "/store_join.do", method = RequestMethod.GET)
		public String Store_join() {
			
			return "store/store_join";
		}
	
		@RequestMapping(value = "/store.do" , method = RequestMethod.GET)
		public ModelAndView store(String rpage) {
			ModelAndView mv = new ModelAndView();
			int startCount = 0;
			int endCount = 0;
			int pageSize = 4;
			int pageCount = 0;
			int dbCount=0;
			int reqPage=1;
			
			dbCount = storeService.totalCountResult();
			if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}
			if(rpage != null){
				reqPage = Integer.parseInt(rpage);
				startCount = (reqPage-1) * pageSize+1;
				endCount = reqPage *pageSize;
			}else{
				startCount = 1;
				endCount = pageSize;
			}
			ArrayList<StoreVO> list = new ArrayList<StoreVO>();
			list = storeService.select(startCount, endCount);
			mv.setViewName("store/store");
			mv.addObject("dbCount",dbCount);
			mv.addObject("pageSize",pageSize);
			mv.addObject("reqPage",reqPage);
			mv.addObject("list", list);
			return mv;
		}
	
		@RequestMapping(value = "/store_information.do" , method = RequestMethod.GET)
		public ModelAndView store_infor(String storeIdx,String rpage,HttpSession session) {
			StoreVO vo = new StoreVO();
			ModelAndView mv = new ModelAndView();
			
			
//			int startCount = 1;
//			int endCount=0;
//			if(rpage!= null) {
//				endCount = Integer.parseInt(rpage);
//			}else {
//				endCount = 5;
//			}
			vo = storeService.selectResult(storeIdx);
//			ArrayList<ReviewVO> list = reviewService.selectListResult(startCount,endCount);
//			session.setAttribute("rpage",rpage);
//			mv.addObject("rpage",endCount);
			mv.addObject("storeIdx",vo.getStoreIdx());
			mv.addObject("vo",vo);
//			mv.addObject("list",list);
			mv.setViewName("store/store_information");
			return mv;
		}
		
		
		@RequestMapping(value = "/store_join.do", method = RequestMethod.POST)
		public ModelAndView store_join(StoreVO vo,HttpServletRequest request, HttpSession session) {
//			System.out.println(vo.getStoreCategory());
			ModelAndView mv = new ModelAndView();
			
			int result = storeService.insertResult(vo);
			if(result ==1) {
				String storeIdx = storeService.getStoreIdx();
				vo.setStoreIdx(storeIdx);
			}
			int fileResult = storeService.insertFileResult(vo);
			int ceoResult = memberService.insertCeoResult(vo,session);
			if (fileResult == 1 && result ==1) {
				storeService.fileSave(vo, request);
				mv.setViewName("redirect:/store.do");
			}
			else {
				//에러페이지;
			}
			return mv;
		}
		@RequestMapping(value = "/store_information.do" , method = RequestMethod.POST)
		public ModelAndView store_infor(ReviewVO rvo,ReservationVO revo,HttpSession session) {
			ModelAndView mv = new ModelAndView();
			StoreVO vo = new StoreVO();
			int result = 0;
			int reviewResult = 0;
			if(revo.getReservationTimeDate() != null) {
		    	revo.setMemberId((String)session.getAttribute("memberId"));
			    result = reservationService.insertResult(revo);
			    vo= storeService.selectResult(revo.getStoreIdx());
			}
			if(rvo.getReviewContent() !=null) {
				rvo.setMemberId((String)session.getAttribute("memberId"));
				reviewResult = reviewService.insertResult(rvo);
				vo= storeService.selectResult(rvo.getStoreIdx());
			}
			if(result == 1 || reviewResult==1) {
				mv.addObject("vo",vo);
				mv.setViewName("redirect:/store_information.do?storeIdx="+vo.getStoreIdx());
				return mv;
			}else {
				System.out.println("실패");
				mv.setViewName("redirect:/store_information.do?storeIdx="+vo.getStoreIdx());
				return mv;
			}
		}
		
		@ResponseBody
		@RequestMapping(value = "/store_information_review.do" , method = RequestMethod.GET,  produces = "application/text; charset=UTF-8")
		public String store_infor_review(String rpage, String storeIdx) {
			int startCount = 1;
			int endCount = Integer.parseInt(rpage)*5;
			ArrayList<ReviewVO> rlist = reviewService.selectListResult(startCount, endCount, storeIdx);
			
			JsonObject jdata = new JsonObject();
			JsonArray jlist = new JsonArray();
			Gson gson = new Gson();
			for(ReviewVO vo : rlist) {
				JsonObject obj = new JsonObject();
				obj.addProperty("memberId",vo.getMemberId());
				obj.addProperty("reviewContent", vo.getReviewContent());
				obj.addProperty("reviewScore", vo.getReviewScore());
				obj.addProperty("reviewIdx",vo.getReviewIdx());
				jlist.add(obj);

			}
			jdata.add("jlist", jlist);

			return gson.toJson(jdata);
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/store_review_delete.do" , method = RequestMethod.GET)
		public String review_delete(String reviewIdx) {
			int result = reviewService.deleteResult(reviewIdx);
			
			return String.valueOf(result);
		}

		@ResponseBody
		@RequestMapping(value = "/store_review_update.do" , method = RequestMethod.GET)
		public String review_update(String reviewIdx, String reviewContent, int reviewScore) {
			int result = reviewService.updateResult(reviewIdx,reviewContent,reviewScore);
			return String.valueOf(result);
		}
		@ResponseBody
		@RequestMapping(value = "/store_information_myreview.do" , method = RequestMethod.GET,  produces = "application/text; charset=UTF-8")
		public String store_infor_myreview(String mpage,String memberId,String storeIdx) {
			int endCount = Integer.parseInt(mpage)*5;
			ArrayList<ReviewVO> mrlist = reviewService.selectMyListResult(memberId, endCount,storeIdx);
			JsonObject jdata = new JsonObject();
			JsonArray jlist = new JsonArray();
			Gson gson = new Gson();
			for(ReviewVO vo : mrlist) {
				JsonObject obj = new JsonObject();
				obj.addProperty("memberId",vo.getMemberId());
				obj.addProperty("reviewContent", vo.getReviewContent());
				obj.addProperty("reviewScore", vo.getReviewScore());
				obj.addProperty("reviewIdx",vo.getReviewIdx());
				jlist.add(obj);
			}
			jdata.add("jlist", jlist);

			return gson.toJson(jdata);
		}
		@ResponseBody
		@RequestMapping(value = "/store_reservation_count_check.do" , method = RequestMethod.GET)
		public String store_reservation_count_check(String rDate,String storeIdx,int rTime) {
			
			int mCount = storeService.getmCountResult(storeIdx).getStoreMaxCount();
			int cuCount =Integer.parseInt(reservationService.getcuCountResult(rDate,storeIdx,rTime));
			int tNumber = reservationService.getTNumber(rDate,storeIdx,rTime);
			int result = mCount-cuCount;
			Gson gson = new Gson();
			JsonObject jdata = new JsonObject();
			jdata.addProperty("tNumber",tNumber );
			jdata.addProperty("result", result);
			
			return gson.toJson(jdata);
			
		}
		@ResponseBody
		@RequestMapping(value = "/store_information_score.do" , method = RequestMethod.GET)
		public String store_information_score(String storeIdx) {
		float result = reviewService.getAverageScore(storeIdx);
			return String.format("%.2f", result);
		}
		@RequestMapping(value = "/store_join_update.do" , method = RequestMethod.GET)
		public ModelAndView store_join_update(String memberId) {
			ModelAndView mv= new ModelAndView();
			String storeIdx = CeoService.selectStore(memberId);
			StoreVO vo = storeService.selectResult(storeIdx);
			StoreVO fileVO = storeService.selectSufiles(storeIdx);
			
			mv.addObject("vo",vo);
			mv.addObject("fileVO",fileVO);
			mv.setViewName("store/store_join_update");
			return mv;
		}
		
		
}