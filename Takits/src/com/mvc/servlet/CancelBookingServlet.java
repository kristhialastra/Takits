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

/**
 * Servlet implementation class CancelBookingServlet
 */
@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String eventid=request.getParameter("id");
		String requestedto=request.getParameter("requested");
		String reason=request.getParameter("reason");
		String purpose=request.getParameter("purpose");
		
		Event e=new Event();
		e.setEventid(eventid);
		e.setReason(reason);
		e.setRequestedto(requestedto);
		e.setPurpose(purpose);
		
		EventDao ed=new EventDao(DatabaseConnection.getConnection());
		String eventStatus=ed.updateEvent(e);
		
		if(eventStatus.equals("SUCCESS UPDATED EVENT")) {
			request.getSession().setAttribute("bookings", "Rescheduling requested!");
			}else {
				request.getSession().setAttribute("bookings", "Couldn't update, some error occured!");
			}
			response.sendRedirect("bookings.jsp");
	}

}
