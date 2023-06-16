package com.mvc.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.User;
import com.mvc.connection.DatabaseConnection;
import com.mvc.dao.UserDao;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String fullname=request.getParameter("fullname");
		String contact=request.getParameter("contact");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String password2=request.getParameter("password2");
		
		User user=new User();
		user.setEmail(email);
		user.setFullname(fullname);
		user.setContact(contact);
		user.setUsername(username);
		user.setPassword(password);
		user.setPassword2(password2);
		
		UserDao ud=new UserDao(DatabaseConnection.getConnection());
		String registerStatus=ud.registerCustomer(user);
		if(registerStatus.equals("Registered Customer Successfully!")) {
			 request.getSession().setAttribute("regstatus", "Registered Customer Successfully!");
			 response.sendRedirect("login.jsp");
		}else {
			 request.getSession().setAttribute("regstatus", registerStatus);
			 response.sendRedirect("register.jsp");
		}
		
	}

}
