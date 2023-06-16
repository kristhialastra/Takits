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


@WebServlet("/DeleteAvailability")
public class DeleteAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		Event e=new Event();
		e.setEventid(id);
		EventDao ed=new EventDao(DatabaseConnection.getConnection());
		String status=ed.deleteAvailability(e);
		
		if(status.equals("SUCCESS DELETED RECORD")) {
			request.getSession().setAttribute("availabilitystatus", "Deleted time slot successfully!");
			
		}else {
			request.getSession().setAttribute("availabilitystatus", "Couldn't delete time slot, some error occured!");
		
		}
		 response.sendRedirect("availability.jsp");
	}

}
