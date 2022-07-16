package egovframework.let.faq.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;


@Controller
public class FaqController {
	
	@RequestMapping(value = "/faq.do")
	public String searchTrash(HttpServletRequest request, ModelMap model) throws Exception {
		
		//사용자 정보 
		LoginVO user = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("USER_INFO", user);
		//
				
		return "/faq/Faq"; 
	}
	
}
