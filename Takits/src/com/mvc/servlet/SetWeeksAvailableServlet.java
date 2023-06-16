package com.mvc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.Event;
import com.mvc.connection.DatabaseConnection;
import com.mvc.dao.EventDao;


@WebServlet("/SetWeeksAvailableServlet")
public class SetWeeksAvailableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Monday=request.getParameter("Monday");
		String Tuesday=request.getParameter("Tuesday");
		String Wednesday=request.getParameter("Wednesday");
		String Thursday=request.getParameter("Thursday");
		String Friday=request.getParameter("Friday");
		String Saturday=request.getParameter("Saturday");
		String Sunday=request.getParameter("Sunday");
		String type=request.getParameter("type");
		 String user_id = (String) request.getSession().getAttribute("userid");
	        if (user_id == null) {
	        	user_id = "";
	        }
		
		if(Monday==null) {
			Monday="no";
		}else {
			Monday="yes";
		}
		if(Tuesday==null) {
			Tuesday="no";
		}else {
			Tuesday="yes";
		}
		if(Wednesday==null) {
			Wednesday="no";
		}else {
			Wednesday="yes";
		}
		if(Thursday==null) {
			Thursday="no";
		}else {
			Thursday="yes";
		}
		if(Friday==null) {
			Friday="no";
		}else {
			Friday="yes";
		}
		if(Saturday==null) {
			Saturday="no";
		}else {
			Saturday="yes";
		}
		if(Sunday==null) {
			Sunday="no";
		}else {
			Sunday="yes";
		}
		Event e=new Event();
		e.setUser_id(user_id);
		e.setMon(Monday);
		e.setTue(Tuesday);
		e.setWed(Wednesday);
		e.setThu(Thursday);
		e.setFri(Friday);
		e.setSat(Saturday);
		e.setSun(Sunday);
		e.setEventtype(type);
		
		EventDao ed=new EventDao(DatabaseConnection.getConnection());
		String availableStatus=ed.setAailableDays(e);
		 System.out.println("availableStatus: "+availableStatus);
		if(availableStatus.equals("Added data successfully!")) {
			  request.getSession().setAttribute("availabilitystatus", "Saved available days Successfully!");
				 response.sendRedirect("availability.jsp");
				 
	       } else {
					 request.getSession().setAttribute("availabilitystatus", "Couldn't save data, some error occured!");
					 response.sendRedirect("availability.jsp");
					 System.out.println("availableStatus: "+availableStatus);
				 }
		
	}

}
