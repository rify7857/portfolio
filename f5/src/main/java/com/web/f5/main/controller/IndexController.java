package com.web.f5.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
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
import com.web.f5.service.AdminNoticeService;
import com.web.f5.service.AdminStoreService;
import com.web.f5.service.PageServiceImpl;
import com.web.f5.vo.AdminBoardVO;
import com.web.f5.vo.AdminNoticeVO;
import com.web.f5.vo.AdminStoreVO;
import com.web.f5.vo.NewsVO;

@Controller
public class IndexController {
	
	@Autowired
	private AdminNoticeService adminNoticeService;
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	@Autowired
	private AdminStoreService adminStoreService;
	
	@Autowired
	private PageServiceImpl pageService;
	
	@RequestMapping(value = "/index.do" , method = RequestMethod.GET)
	public ModelAndView index() throws Exception {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<AdminNoticeVO> noticeList = adminNoticeService.getLimitList();
		List<AdminBoardVO> boardList = adminBoardService.getLimitList();
		List<NewsVO> newsList = new ArrayList<NewsVO>();
		
		int page = 1;
		
		String url = "https://search.naver.com/search.naver?where=news&sm=tab_pge&query=음식&sort=0&photo=0&field=0&"
				+ "pd=0&ds=&mynews=0&office_type=0&office_section_code=0&news_office_checked=&"
				+ "nso=so:r,p:all,a:all&start=" + page;			
		Document doc = null;
		
		doc = Jsoup.connect(url).get();
		Elements element = doc.select("div.group_news");
		
		int count = 0;
		for(Element el : element.select(".bx")) {	// 하위 뉴스 기사들을 for문 돌면서 출력
			count ++;
			if( count >= 4 ) {
				break;
			}
			NewsVO vo = new NewsVO();
			String title = el.select("a").attr("title");
			String contentURL = el.select(".dsc_wrap > a").attr("href");
			vo.setTitle(title);
			vo.setContentURL(contentURL);
			newsList.add(vo);
			
		}
		
		result.put("noticeList", noticeList);
		result.put("boardList", boardList);
		result.put("newsList", newsList);
		
		return new ModelAndView("main/index", "result", result);
	}
	
	@RequestMapping ( value = "store_search.do", method = RequestMethod.GET )
	public ModelAndView store_search(String rpage, String search) {
		
		String search_type = "";
		
		ModelAndView mv = new ModelAndView();
		
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "store_search", adminStoreService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		List<Object> olist = adminStoreService.getSearchList(startCount, endCount, search, search_type);
		
		ArrayList<AdminStoreVO> list = new ArrayList<AdminStoreVO>();
		
		for ( Object obj : olist ) {
			
			list.add( (AdminStoreVO) obj );
		}
		
		mv.addObject("list", list);
		mv.addObject("search", search);
		mv.addObject("dbCount", Integer.parseInt(param.get("dbCount")));
		mv.addObject("pageSize", Integer.parseInt(param.get("pageSize")));
		mv.addObject("reqPage", Integer.parseInt(param.get("reqPage")));
		
		mv.setViewName("store/store");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping ( value = "store_search_json.do", method = RequestMethod.GET, produces = "application/text; charset=UTF-8" )
	public String store_search_json(String rpage, String search) {
		
		String search_type = "";
		System.out.println(search);
		System.out.println(search_type);
		Map<String, String> param = pageService.getSearchResult(search_type, search, rpage, "store_search", adminStoreService);
		
		int startCount = Integer.parseInt( param.get("start") );
		int endCount = Integer.parseInt( param.get("end") );
		
		ArrayList<AdminStoreVO> list = adminStoreService.getsearchJSONResult(startCount, endCount, search, search_type);
		System.out.println(list);
		JsonObject jdata = new JsonObject();
		JsonArray jlist = new JsonArray();
		Gson gson = new Gson();
		
		for ( AdminStoreVO vo : list ) {
			
			JsonObject obj = new JsonObject();
			
			obj.addProperty("storeIdx", vo.getStoreIdx());
			obj.addProperty("memberId", vo.getMemberId());
			obj.addProperty("storeCategory", vo.getStoreCategory());
			obj.addProperty("storeName", vo.getStoreName());
			obj.addProperty("storePlace", vo.getStorePlace());
			obj.addProperty("rno", vo.getRno());
			obj.addProperty("suFile1", vo.getSuFile1());
			
			jlist.add(obj);
		}
		
		jdata.add("jlist", jlist);
		
		return gson.toJson(jdata);
	}
}
