package com.telusko.projectHeades;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Logout extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@RequestMapping("/logout")
	public String endSession_and_logout(HttpServletRequest req,HttpServletResponse res) {
		String ret="";
		 System.out.println(req.getParameter("logout"));
		if(req.getParameter("logout").equals("404")) {
			 HttpSession session = req.getSession(true);
			 System.out.println(session.getAttribute("username"));
			 session.invalidate();
			 ret = "login_page.jsp?login=4";
		}
		
		
		return ret;
	}
}
