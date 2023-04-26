package com.boot.project.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	
	@RequestMapping(value = "/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/FAQ_GET")
	public String FAQ_GET() {
		return "inc/FAQ";
	}
}
