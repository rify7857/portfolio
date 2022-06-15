package com.web.f5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.f5.service.AdminBoardService;
@Controller
public class InfoController {

	@Autowired
	private AdminBoardService adminBoardService;
	
	@RequestMapping(value = "/info.do" , method = RequestMethod.GET)
	public String info() {
		
		adminBoardService.getInsertPageview("info");
		
		return "info/info";
	}

	@RequestMapping ( value = "/sitemap.do", method = RequestMethod.GET )
	public String sitemap() {
		
		adminBoardService.getInsertPageview("sitemap");
		
		return "info/sitemap";
	}
}

