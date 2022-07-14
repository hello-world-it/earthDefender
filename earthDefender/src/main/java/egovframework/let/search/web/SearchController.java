package egovframework.let.search.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class SearchController {
	
	@RequestMapping(value = "/search.do")
	public String searchTrash(HttpServletRequest request, ModelMap model) throws Exception {
		
		return "/search/Search"; 
	}
	
}
