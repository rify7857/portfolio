package com.web.f5.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.web.f5.service.AdminBoardService;
import com.web.f5.vo.NewsVO;

@Controller
public class NewsController {
	
	@Autowired
	private AdminBoardService adminBoardService;
	
	public static HashMap<String, String> map;
	
	@RequestMapping(value="/news_list.do", method=RequestMethod.GET)
	public ModelAndView news_list() throws Exception {
		
		adminBoardService.getInsertPageview("news_list");
		
		ModelAndView mv = new ModelAndView();

		
		List<NewsVO> list = new ArrayList<NewsVO>();
		
		//int rpage1 = Integer.parseInt(rpage);
		int page = 1;
		
		while( page < 10 ) {
			String url = "https://search.naver.com/search.naver?where=news&sm=tab_pge&query=음식&sort=0&photo=0&field=0&"
					+ "pd=0&ds=&mynews=0&office_type=0&office_section_code=0&news_office_checked=&"
					+ "nso=so:r,p:all,a:all&start=" + page;			
			Document doc = null;
			
			doc = Jsoup.connect(url).get();
			Elements element = doc.select("div.group_news");
			
			for(Element el : element.select(".bx")) {	// 하위 뉴스 기사들을 for문 돌면서 출력
				NewsVO vo = new NewsVO();
				String press = el.select(".press").get(0).text();
				press = press.substring(press.lastIndexOf("/")+1);
				String pressURL = el.select("a").get(3).attr("href");
				String title = el.select("a").attr("title");
				String content = el.select(".dsc_wrap > a").text();
				String contentURL = el.select(".dsc_wrap > a").attr("href");
				String img = el.select("img").get(0).attr("src");
				String contentimg = el.select("img").get(1).attr("src");
				vo.setPress(press);
				vo.setPressURL(pressURL);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setContentURL(contentURL);
				vo.setImg(img);
				vo.setContentImg(contentimg);
				list.add(vo);
				
			}
			page += 10;
			
			
		}
		
		
		mv.addObject("list", list);
		
		mv.setViewName("/board/news/news_list");
		
		return mv;

		
		
		
	}
	
}
