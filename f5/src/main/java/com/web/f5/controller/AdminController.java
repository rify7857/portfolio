package com.web.f5.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import com.web.f5.service.AdminMemberService;
import com.web.f5.service.AdminQuestionService;
import com.web.f5.vo.AdminBoardVO;
import com.web.f5.vo.AdminMemberVO;
import com.web.f5.vo.AdminQuestionVO;

@Controller
public class AdminController {

	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private AdminQuestionService adminQuestionService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@RequestMapping ( value = "admin/admin.do", method = RequestMethod.GET )
	public ModelAndView admin(String rpage) {
		
		String todayCnt = "0";
		String totalCnt = "0";
		String questionTotalCnt = "0";
		String questionTodayCnt = "0";
		String CEOTotalCnt = "0";
		String CEORequestCnt = "0";
		
		// �궃�닔 泥섎━
		Random rnd =new Random();
		StringBuffer buf =new StringBuffer();
		
		for ( int i = 0; i < 10; i++ ) {
			
			if ( rnd.nextBoolean() ) {
				
				buf.append( (char)( (int)( rnd.nextInt(26) ) + 97 ) );
			}else{
				buf.append( ( rnd.nextInt(5) ) ); 
			}
		}
		
		System.out.println("난수 --->" + buf);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<AdminMemberVO> memberList = adminMemberService.getLimitList();
		List<AdminQuestionVO> questionList = adminQuestionService.getLimitList();
		
		
		result.put("memberList", memberList);
		result.put("questionList", questionList);
		
		return new ModelAndView("admin/dashboard", "result", result);
	}
	
	@ResponseBody
	@RequestMapping ( value = "/admin/member_black_insert.do", method = RequestMethod.GET )
	public String member_black_insert(String id) {
		
		String msg = "";
		
		int result = adminMemberService.getBlackInsert(id);
		
		if ( result == 1 ) {
			
			msg = "success";
		} else {
			
			msg = "fail";
		}
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping ( value = "/admin/member_black_out.do", method = RequestMethod.GET )
	public String member_black_out(String id) {
		
		String msg = "";
		
		int result = adminMemberService.getBlackOut(id);
		
		if ( result == 1 ) {
			
			msg = "success";
		} else {
			
			msg = "fail";
		}
		
		return msg;
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/member_chart.do", method = RequestMethod.GET )
	public String member_chart() {
		
		int totalCnt = adminMemberService.getmberTotalCnt();
		int todayCnt = adminMemberService.getmberTodayCnt();
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		JsonObject obj1 = new JsonObject();
		obj1.addProperty("totalCnt", totalCnt);
		obj1.addProperty("todayCnt", todayCnt);
		jlist.add(obj1);
		
		jdata.add("jlist", jlist);
		return gson.toJson(jdata);
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/question_chart.do", method = RequestMethod.GET )
	public String question_chart() {
		
		
		int waiting = adminQuestionService.getWaitingCnt();
		int answering = adminQuestionService.getAnsweringCnt();
		int answerComplete = adminQuestionService.getAnswerCompleteCnt();
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		JsonObject obj1 = new JsonObject();
		obj1.addProperty("waiting", waiting);
		obj1.addProperty("answering", answering);
		obj1.addProperty("answerComplete", answerComplete);
		jlist.add(obj1);
		
		jdata.add("jlist", jlist);
		return gson.toJson(jdata);
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/CEOreq_chart.do", method = RequestMethod.GET )
	public String ceo_req_chart() {
		
		int totalCnt = adminMemberService.getCEOTotal();
		int reqCnt = adminMemberService.getCEORequest();
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		JsonObject obj1 = new JsonObject();
		obj1.addProperty("totalCnt", totalCnt);
		obj1.addProperty("reqCnt", reqCnt);
		jlist.add(obj1);
		
		jdata.add("jlist", jlist);
		return gson.toJson(jdata);
	}
	
	@ResponseBody
	@RequestMapping ( value = "admin/pageview_chart.do", method = RequestMethod.GET )
	public String pageview_chart() {
		
		int totalPV = adminBoardService.getTotalPV();
		int todayPV = adminBoardService.getTodayPV();
		
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		JsonObject obj = new JsonObject();
		obj.addProperty("totalPV", totalPV);
		obj.addProperty("todayPV", todayPV);
		
		jlist.add(obj);
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
}
