package com.telusko.projectHeades;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import org.hibernate.query.Query;

@Controller
public class AppController extends HttpServlet
{	
	@RequestMapping("/login")
    public String check_login(HttpServletRequest req, HttpServletResponse res ) throws Exception {
		if(req.getParameter("register")!=null) {
			return "registration_page.jsp";
		}
		
    	String username = req.getParameter("username");
    	String password = req.getParameter("password");
    	String fullname	="";
    	String gender   ="";
    	String current_address="";
    	String permanent_address="";
    	int age=0;
    	String status="0";
    	if(username!=null && password!=null) {
    		System.out.println("I'm Here");	
    	StandardServiceRegistry ssr = new StandardServiceRegistryBuilder().configure("hibernate.cfg.xml").build(); 
    	System.out.println("I'm Here teri");
        Metadata meta = new MetadataSources(ssr).getMetadataBuilder().build(); //error 
          
        SessionFactory factory = meta.getSessionFactoryBuilder().build(); 
        System.out.println("check1");
        Session session = factory.openSession();
        Query<registered_users> query = session.createQuery("From registered_users where username ='" + username + "' AND password ='"+ password+"'",registered_users.class);
       

        List<registered_users> list = query.list();
        if(list.isEmpty()) {
        	System.out.println("check2");
       Query<registered_users> queryuserexists = session.createQuery("From registered_users where username ='" + username + "' AND password !='"+ password+"'",registered_users.class);
       List<registered_users> userexists = queryuserexists.list();
        	 if(!userexists.isEmpty()) {
        		 status="2";
      
        	 }
        }
        
        else if(!list.isEmpty()) {
        	status="1";
        	int l = list.get(0).getId();
        	  Query<User_Details> queryuserdetails = session.createQuery("From User_Details where id ="+ l,User_Details.class);
              List<User_Details> user_details = queryuserdetails.list(); 
              fullname= user_details.get(0).getFullname();
              System.out.println(fullname);
              current_address=user_details.get(0).getCurrent_address();
              permanent_address =user_details.get(0).getPermanent_address();
              gender = user_details.get(0).getGender();
              age = user_details.get(0).getAge();
              
        }
        
        factory.close();  
        session.close();    
    	
    	}

    	 HttpSession websession =req.getSession();  
    	 websession.setAttribute("username",username);
    	 websession.setAttribute("password",password);
    	 websession.setAttribute("fullname",fullname);
    	 websession.setAttribute("firstname",(fullname.split(" "))[0]);
    	 websession.setAttribute("current_address",current_address);
    	 websession.setAttribute("permanent_address",permanent_address);
    	 websession.setAttribute("gender",gender);
    	 websession.setAttribute("age",age);
    	 
    	 
    	
    	return "login_page.jsp?login="+ status;
    }
}




