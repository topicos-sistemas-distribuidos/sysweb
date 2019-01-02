package br.ufc.great.sysadmin.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.great.sysadmin.model.Users;
import br.ufc.great.sysadmin.util.MySessionInfo;

@Controller
public class MyErrorController implements ErrorController  {
	private String acesso;
	
	@Autowired
	private MySessionInfo mySessionInfo;

	@RequestMapping("/error")
	public String handleError(HttpServletRequest request, Model model) {
						
		Users loginUser = mySessionInfo.getCurrentUser();
		
		acesso = mySessionInfo.getAcesso();
		    	
		if (loginUser != null) {
			model.addAttribute("loginusername", loginUser.getUsername());
			model.addAttribute("loginemailuser", loginUser.getEmail());
			model.addAttribute("loginuserid", loginUser.getId());
			model.addAttribute("acesso", acesso);			
		}
		
	   Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
	
	   if (status != null) {
	       Integer statusCode = Integer.valueOf(status.toString());
	
	       if(statusCode == HttpStatus.NOT_FOUND.value()) {
	           return "errors/404";
	       }
	              
	       if (statusCode == HttpStatus.FORBIDDEN.value()) {
	    	   return "errors/403";
	       }
	       
	       if(statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
	           return "errors/500";
	       }

	   }
	   
	   return "error";
	}

   @Override
   public String getErrorPath() {
       return "/error";
   }
   
}