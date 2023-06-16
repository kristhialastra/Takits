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

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		
		UserDao ud=new UserDao(DatabaseConnection.getConnection());
		String loginStatus=ud.authorizeLogin(user);
		
		if(loginStatus.equals("SUCCESS LOGIN")) {
			request.getSession().setAttribute("userid", user.getUser_id());
			request.getSession().setAttribute("fullname", user.getFullname());
		
			request.getSession().setAttribute("regstatus", "Logged in Successfully!");
			 response.sendRedirect("showcode.jsp");
		}else {
			request.getSession().setAttribute("regstatus", "Couldn't login, please enter valid credentials!");
			 response.sendRedirect("login.jsp");
		}
	}

}
