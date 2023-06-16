package com.mvc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mvc.bean.Event;
import com.mvc.bean.User;

public class UserDao {
	private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    public String registerCustomer(User user) {
        String fullname = user.getFullname();
        String email = user.getEmail();
        String username = user.getUsername();
        String password = user.getPassword();
        String contact = user.getContact();
        String password2 = user.getPassword2();

        try {
        	
        	PreparedStatement pstmt4;
            pstmt4 = con.prepareStatement("select * from user where email=?");  //query to check if the entered user name already exists
            pstmt4.setString(1, email);
            ResultSet rs2 = pstmt4.executeQuery();
            while (rs2.next()) {

                return "EMAIL ALREADY IN USE";

            }
        	
        	PreparedStatement pstmt3;
            pstmt3 = con.prepareStatement("select * from user where username=?");  //query to check if the entered user name already exists
            pstmt3.setString(1, username);
            ResultSet rs = pstmt3.executeQuery();
            while (rs.next()) {

                return "USERNAME ALREADY EXISTS";

            }
            
            
            if(!password.equals(password2)) {
            	return "PASSWORDS DON'T MATCH";
            }
        	
        	
            PreparedStatement pstmt1;
            pstmt1 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
            pstmt1.executeUpdate();
            PreparedStatement pstmt;
            //registering user
            pstmt = con.prepareStatement("insert into user(fullname,email,contact,username,password) values(?,?,?,?,?)");
            pstmt.setString(1, fullname);
            pstmt.setString(2, email);
            pstmt.setString(3, contact);
            pstmt.setString(4, username);
            pstmt.setString(5, password);
            pstmt.executeUpdate();
            pstmt.close();
            return "Registered Customer Successfully!";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "Failed to registered customer, some error occured!";
    }
    
    public String authorizeLogin(User user) {

        String username = user.getUsername();
        String password = user.getPassword();
        String email = user.getUsername();
        String dbemail;
        String dbusername;
        String dbpass;
        try {
            
            PreparedStatement pstmt;
            //checking if user the entered email id and password exists
            pstmt = con.prepareStatement("select * from user where username=? or email=? and password=?");
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
            	dbusername = rs.getString("username");
            	dbemail = rs.getString("email");
                dbpass = rs.getString("password");
                user.setUser_id(rs.getString("user_id"));
                user.setFullname(rs.getString("fullname"));
                if (username.equals(dbusername) && password.equals(dbpass)) {
                    return "SUCCESS LOGIN";
                }
                if (email.equals(dbemail) && password.equals(dbpass)) {
                    return "SUCCESS LOGIN";
                }
            }
            pstmt.close();

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return "LOGIN FAILED";
    }
    
    
    public List<User> getUsersList(User user) {
    	  List<User> list = new ArrayList<>();

          try {
              PreparedStatement ps;
              //retrieving user details
              ps = con.prepareStatement("select * from user where user_id!="+user.getUser_id());
              ResultSet rs = ps.executeQuery();
              while (rs.next()) {
            	  user=new User();
                  user.setFullname((rs.getString("fullname")));
                  user.setUser_id((rs.getString("user_id")));
                  list.add(user);
              }
          } catch (Exception ex) {
              ex.printStackTrace();
          }
          return list;
      }
    
    public String getUsersName(Event e) {
  	 String name="";

        try {
            PreparedStatement ps;
            //retrieving user details
            ps = con.prepareStatement("select * from user where user_id="+e.getOrganizer() );
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
          	  e=new Event();
                e.setFullname((rs.getString("fullname")));
                e.setUser_id((rs.getString("user_id")));
            name=rs.getString("fullname");
            }
       
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return name;
    }

}
