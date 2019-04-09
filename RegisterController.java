package com.telusko.projectHeades;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RegisterController extends HttpServlet {

	@RequestMapping("/register_user")
	public String doRegister(HttpServletRequest req, HttpServletResponse res) {
		int errorstatus=0;
		if(req.getParameter("submit_reg")!=null) {
			String name=req.getParameter("fullname");
			String username=req.getParameter("username");
			String password=req.getParameter("password");
			String repeat=req.getParameter("rpassword");
			System.out.println(password + "  "+ repeat);
			if(!password.equalsIgnoreCase(repeat)) {
				errorstatus=1;
				return "register_page.jsp?errorstatus="+errorstatus;
			}
			
			StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build();  
	        Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build(); //error 
	          
	        SessionFactory factory = meta.getSessionFactoryBuilder().build();  
	        Session session = factory.openSession();
	        Transaction tx = session.beginTransaction();
	        registered_users ru = new registered_users();
	        ru.setId((int)(Math.random()*200));
	        ru.setusername(username);
	        ru.setpassword(password);
	        session.save(ru);
	        tx.commit();
	        factory.close();
	        session.close();
	       
		}
		return "register_page.jsp?errorstatus="+errorstatus;
	}
	
}
