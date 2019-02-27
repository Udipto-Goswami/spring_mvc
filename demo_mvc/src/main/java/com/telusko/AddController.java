package com.telusko;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.*;  
import javax.servlet.http.*; 
import java.io.*;
@Controller

public class AddController extends HttpServlet {
	
@RequestMapping("/add")  
public String add(HttpServletRequest req) {
	
	return "display.jsp?a=" + req.getParameter("a") ;
	  }
}

