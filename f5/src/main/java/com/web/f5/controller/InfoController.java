package com.web.f5.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class InfoController {

		@RequestMapping(value = "/info.do" , method = RequestMethod.GET)
		public String info() {
			return "info/info";
		}
	
		@RequestMapping ( value = "/sitemap.do", method = RequestMethod.GET )
		public String sitemap() {
			
			return "info/sitemap";
		}
}

