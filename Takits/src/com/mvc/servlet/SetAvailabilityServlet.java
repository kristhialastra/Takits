package com.mvc.servlet;

import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.Event;
import com.mvc.connection.DatabaseConnection;
import com.mvc.dao.EventDao;

@WebServlet("/SetAvailabilityServlet")
public class SetAvailabilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String day=request.getParameter("day");
		String type=request.getParameter("type");
		
		
		String starttime=request.getParameter("starttime");
		String endtime=request.getParameter("endtime");
		 String user_id = (String) request.getSession().getAttribute("userid");
	        if (user_id == null) {
	        	user_id = "";
	        }
		
		
	Event event=new Event();
		
		DateTimeFormatter formatterdate = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		DateTimeFormatter formattertime = DateTimeFormatter.ofPattern("HH:mm");
		
 
  	    
  	  SimpleDateFormat t = new SimpleDateFormat("hh:mm");
		
    
int returnVal=0;
      try {
	        Date st = t.parse(starttime);
	        Date et = t.parse(endtime);
	        Time stime = new Time(st.getTime());
	        Time etime = new Time(et.getTime());
	        returnVal=stime.compareTo(etime);
	        event.setStarttime(stime);
	        event.setEndtime(etime);
	        event.setUser_id(user_id);
	        event.setDay(day);
	        event.setEventtype(type);
      } catch (ParseException ex) {
          Logger.getLogger(EventSetupServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
  	    
  	   

       if(returnVal>0) {
    	   request.getSession().setAttribute("availabilitystatus", "Please choose valid time duration!");
			 response.sendRedirect("availability.jsp");
       }else {
    	   EventDao ud=new EventDao(DatabaseConnection.getConnection());
           String eventStatus=ud.setAvailableTime(event);
    	   if(eventStatus.equals("Inserted Data Successfully!")) {
        	   request.getSession().setAttribute("availabilitystatus", "Saved time slot Successfully!");
    			 response.sendRedirect("availability.jsp");
           } else {
    				 request.getSession().setAttribute("availabilitystatus", "Couldn't save data, some error occured!");
    				 response.sendRedirect("availability.jsp");
    			 }
       }
      
       
	}

}
