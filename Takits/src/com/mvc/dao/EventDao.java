package com.mvc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mvc.bean.Event;
import com.mvc.bean.User;

public class EventDao {
	private final Connection con;

	public EventDao(Connection con) {
		this.con = con;
	}

	public String createEvent(Event e) {

		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement("select * from event WHERE ? < end AND ?> start and (partner=? or organizer=?)");
			ps.setTimestamp(1, e.getStart());
			ps.setTimestamp(2, e.getEnd());
			ps.setString(3, e.getPartner());
			ps.setString(4, e.getPartner());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println("This person already has a booking at this time");
				return "This person already has a booking at this time";
				
			}
			
			PreparedStatement pstmt1;
			pstmt1 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
			pstmt1.executeUpdate();
			PreparedStatement pstmt;
			// registering user
			pstmt = con.prepareStatement(
					"insert into event(title,description,location,address,link,contact,additionalinfo,file,eventtype,partner,organizer,start,end) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, e.getTitle());
			pstmt.setString(2, e.getDescription());
			pstmt.setString(3, e.getLocation());
			pstmt.setString(4, e.getAddress());
			pstmt.setString(5, e.getLink());
			pstmt.setString(6, e.getContact());
			pstmt.setString(7, e.getAdditionalinfo());
			pstmt.setBlob(8, e.getFile());
			pstmt.setString(9, e.getEventtype());
			pstmt.setString(10, e.getPartner());
			pstmt.setString(11, e.getOrganizer());
			pstmt.setTimestamp(12, e.getStart());
			pstmt.setTimestamp(13, e.getEnd());
			pstmt.executeUpdate();
			pstmt.close();
			return "Created Event Successfully!";
		} catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}

		return "Failed to create event, some error occured!";
	}

	public List<Event> getUpcomingBookings(Event e) {
		List<Event> list = new ArrayList<>();

		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement(
					"select * from event inner join user on event.partner=user.user_id where end>now() and (status is NULL or status='rescheduled' or status='rescheduling declined') and (organizer=? or partner=?) ORDER BY start DESC");
			ps.setString(1, e.getUser_id());
			ps.setString(2, e.getUser_id());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				e = new Event();
				e.setEventid(rs.getString("event_id"));
				e.setFullname(rs.getString("fullname"));
				e.setUser_id(rs.getString("user_id"));
				e.setStart(rs.getTimestamp("start"));
				e.setEnd(rs.getTimestamp("end"));
				e.setTitle(rs.getString("title"));
				e.setEventtype(rs.getString("eventtype"));
				e.setDescription(rs.getString("description"));
				e.setOrganizer(rs.getString("organizer"));
				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public List<Event> getPastBookings(Event e) {
		List<Event> list = new ArrayList<>();

		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement(
					"select * from event inner join user on event.partner=user.user_id where end<now() and (status is NULL or status='rescheduled' or status='rescheduling requested' or status='rescheduling declined') and (organizer=? or partner=?) ORDER BY start DESC");
			ps.setString(1, e.getUser_id());
			ps.setString(2, e.getUser_id());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				e = new Event();
				e.setEventid(rs.getString("event_id"));
				e.setFullname(rs.getString("fullname"));
				e.setUser_id(rs.getString("user_id"));
				e.setStart(rs.getTimestamp("start"));
				e.setEnd(rs.getTimestamp("end"));
				e.setTitle(rs.getString("title"));
				e.setEventtype(rs.getString("eventtype"));
				e.setDescription(rs.getString("description"));
				e.setOrganizer(rs.getString("organizer"));
				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public List<Event> getRescheduledBookings(Event e) {
		List<Event> list = new ArrayList<>();
		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement(
					"select * from event inner join user on event.partner=user.user_id where (status='rescheduled' or status='rescheduling requested' or status='rescheduling declined') and (organizer=? or partner=?) ORDER BY start DESC");
			ps.setString(1, e.getUser_id());
			ps.setString(2, e.getUser_id());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				e = new Event();
				e.setEventid(rs.getString("event_id"));
				e.setFullname(rs.getString("fullname"));
				e.setUser_id(rs.getString("user_id"));
				e.setStart(rs.getTimestamp("start"));
				e.setEnd(rs.getTimestamp("end"));
				e.setTitle(rs.getString("title"));
				e.setEventtype(rs.getString("eventtype"));
				e.setStatus(rs.getString("status"));
				e.setDescription(rs.getString("description"));
				e.setOrganizer(rs.getString("organizer"));
				e.setReason(rs.getString("reason"));
				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public List<Event> getCancelledBookings(Event e) {
		List<Event> list = new ArrayList<>();
		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement(
					"select * from event inner join user on event.partner=user.user_id where (status='cancelled') and (organizer=? or partner=?) ORDER BY start DESC");
			ps.setString(1, e.getUser_id());
			ps.setString(2, e.getUser_id());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				e = new Event();
				e.setEventid(rs.getString("event_id"));
				e.setFullname(rs.getString("fullname"));
				e.setUser_id(rs.getString("user_id"));
				e.setStart(rs.getTimestamp("start"));
				e.setEnd(rs.getTimestamp("end"));
				e.setEventtype(rs.getString("eventtype"));
				e.setTitle(rs.getString("title"));
				e.setDescription(rs.getString("description"));
				e.setOrganizer(rs.getString("organizer"));
				e.setReason(rs.getString("reason"));
				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public String updateEvent(Event e) {
		String status = "";
		if (e.getPurpose().equals("Cancelling")) {
			status = "cancelled";
		}
		if (e.getPurpose().equals("rescheduling requested")) {
			status = "rescheduling requested";
		}
		if (e.getPurpose().equals("decline")) {
			status = "rescheduling declined";
		}
		try {
			PreparedStatement pstmt;
			PreparedStatement pstmt1;
			pstmt1 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
			pstmt1.executeUpdate();
			// updating event details query
			pstmt = con.prepareStatement("update event set reason=?, requestedto=?,status=? where event_id=?");
			pstmt.setString(1, e.getReason());
			pstmt.setString(2, e.getRequestedto());
			pstmt.setString(3, status);
			pstmt.setString(4, e.getEventid());
			pstmt.executeUpdate();
			pstmt.close();
			return "SUCCESS UPDATED EVENT";
		} catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}

		return "FAILED UPDATING EVENT";
	}

	public String setAvailableTime(Event e) {

		try {
			PreparedStatement pstmt1;
			pstmt1 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
			pstmt1.executeUpdate();
			PreparedStatement pstmt;
			// registering user
			pstmt = con.prepareStatement("insert into availabletime(user_id,start,end,day,eventtype) values(?,?,?,?,?)");
			pstmt.setString(1, e.getUser_id());
			pstmt.setTime(2, e.getStarttime());
			pstmt.setTime(3, e.getEndtime());
			pstmt.setString(4, e.getDay());
			pstmt.setString(5, e.getEventtype());
			pstmt.executeUpdate();
			pstmt.close();
			return "Inserted Data Successfully!";
		} catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}

		return "Failed to create event, some error occured!";
	}

	public List<Event> getAvailableTimeSlots(String id, String day, String type) {
		List<Event> list = new ArrayList<>();
		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement("select * from availabletime where user_id=? and day=? and eventtype=?");
			ps.setString(1, id);
			ps.setString(2, day);
			ps.setString(3, type);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Event e = new Event();
				e.setEventid(rs.getString("id"));
				e.setUser_id(rs.getString("user_id"));
				e.setStarttime(rs.getTime("start"));
				e.setEndtime(rs.getTime("end"));
				e.setDay(rs.getString("day"));
				e.setEventtype(rs.getString("eventtype"));
				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}

	public String setAailableDays(Event e) {

		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement("select * from availabledays where user_id=? and eventtype=?");
			ps.setString(1, e.getUser_id());
			ps.setString(2, e.getEventtype());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				PreparedStatement pstmt;
				PreparedStatement pstmt1;
				pstmt1 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
				pstmt1.executeUpdate();
				// updating event details query
				pstmt = con.prepareStatement("update availabledays set mon=?,tue=?,wed=?,thu=?,fri=?,sat=?,sun=? where user_id=? and eventtype=?");
				
				pstmt.setString(1, e.getMon());
				pstmt.setString(2, e.getTue());
				pstmt.setString(3, e.getWed());
				pstmt.setString(4, e.getThu());
				pstmt.setString(5, e.getFri());
				pstmt.setString(6, e.getSat());
				pstmt.setString(7, e.getSun());
				pstmt.setString(8, e.getUser_id());
				pstmt.setString(9, e.getEventtype());
				pstmt.executeUpdate();
				pstmt.close();
				return "Added data successfully!";
			} else {

				PreparedStatement pstmt1;
				pstmt1 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
				pstmt1.executeUpdate();
				PreparedStatement pstmt;
				pstmt = con.prepareStatement(
						"insert into availabledays(user_id,mon,tue,wed,thu,fri,sat,sun,eventtype) values(?,?,?,?,?,?,?,?,?)");
				pstmt.setString(1, e.getUser_id());
				pstmt.setString(2, e.getMon());
				pstmt.setString(3, e.getTue());
				pstmt.setString(4, e.getWed());
				pstmt.setString(5, e.getThu());
				pstmt.setString(6, e.getFri());
				pstmt.setString(7, e.getSat());
				pstmt.setString(8, e.getSun());
				pstmt.setString(9, e.getEventtype());
				pstmt.executeUpdate();
				pstmt.close();
				return "Added data successfully!";
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}

		return "Failed to create event, some error occured!";
	}
	
	public List<Event> checkAvailableDays(Event e) {
		List<Event> list = new ArrayList<>();
		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement(
					"select * from event inner join user on event.partner=user.user_id where (status='cancelled') and (organizer=? or partner=?)");
			ps.setString(1, e.getUser_id());
			ps.setString(2, e.getUser_id());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				e = new Event();
				e.setEventid(rs.getString("event_id"));
				e.setFullname(rs.getString("fullname"));
				e.setUser_id(rs.getString("user_id"));
				e.setStart(rs.getTimestamp("start"));
				e.setEnd(rs.getTimestamp("end"));
				e.setTitle(rs.getString("title"));
				e.setDescription(rs.getString("description"));
				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	


	public String checkifDayIsAvailable(Date start,Date end, String user_id, String eventtype) {
		String available="";
		try {
		for (LocalDate date = start.toLocalDate(); date.isBefore(end.toLocalDate().plusDays(1)); date = date.plusDays(1))
		{
			String day="";
			
			System.out.print("\n day of the week: "+date.getDayOfWeek()+date.getDayOfWeek().getValue()+"\n");
		

		    String mon="",tue="",wed="",thu="",fri="",sat="",sun="";
				PreparedStatement ps;
				// retrieving event details
				ps = con.prepareStatement(
						"select * from availabledays where user_id=? and eventtype=?");
				//ps.setString(1, day);
				ps.setString(1, user_id);
				ps.setString(2, eventtype);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					mon= rs.getString("mon");
					tue= rs.getString("tue");
					wed= rs.getString("wed");
					thu= rs.getString("thu");
					fri= rs.getString("fri");
					sat= rs.getString("sat");
					sun= rs.getString("sun");
				}
				if(date.getDayOfWeek().getValue()==1) {
					if(mon.equals("no")) {
						return mon;
					}else {
						available="yes";
					}
				}else if(date.getDayOfWeek().getValue()==2) {
					if(tue.equals("no")) {
						return tue;
					}else {
						available="yes";
					}
				}else if(date.getDayOfWeek().getValue()==3) {
					if(wed.equals("no")) {
						return wed;
					}else {
						available="yes";
					}
				}else if(date.getDayOfWeek().getValue()==4) {
					if(thu.equals("no")) {
						return thu;
					}else {
						available="yes";
					}
				}else if(date.getDayOfWeek().getValue()==5) {
					if(fri.equals("no")) {
						return fri;
					}else {
						available="yes";
					}
				}else if(date.getDayOfWeek().getValue()==6) {
					if(sat.equals("no")) {
						return sat;
					}else {
						available="yes";
					}
			
				}	if(date.getDayOfWeek().getValue()==7) {
					if(sun.equals("no")) {
					return sun;
					}else {
						available="yes";
					}
				}
			
			
		}
	
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return available;
	}
	public String checkifTimeIsAvailable(Date start,Date end, Time startime, Time endtime, String user_id, String eventtype) {
		String available="";
		try {
		for (LocalDate date = start.toLocalDate(); date.isBefore(end.toLocalDate().plusDays(1)); date = date.plusDays(1))
		{
			String day="";
			
			System.out.print("\n day of the week: "+date.getDayOfWeek()+date.getDayOfWeek().getValue()+"\n");
		

		    String mon="",tue="",wed="",thu="",fri="",sat="",sun="";
			
				if(date.getDayOfWeek().getValue()==1) {
					day="mon";
				}else if(date.getDayOfWeek().getValue()==2) {
					day="tue";
				}else if(date.getDayOfWeek().getValue()==3) {
					day="wed";
				}else if(date.getDayOfWeek().getValue()==4) {
					day="thu";
				}else if(date.getDayOfWeek().getValue()==5) {
					day="fri";
				}else if(date.getDayOfWeek().getValue()==6) {
					day="sat";
			
				}	if(date.getDayOfWeek().getValue()==7) {
					day="sun";
				}
				PreparedStatement ps;
				// retrieving event details
				ps = con.prepareStatement(
						"SELECT *  FROM availabletime WHERE ? BETWEEN start AND end and ? BETWEEN start AND end and user_id=? and day=? and eventtype=?");
				
				
				
				ps.setTime(1, startime);
				ps.setTime(2, endtime);
				ps.setString(3, user_id);
				ps.setString(4,day);
				ps.setString(5,eventtype);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					return "Available";
				}
			
		}
	
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "Not Available";
	}
	
	public List<Event> getNotifications(Event e) {
		List<Event> list = new ArrayList<>();
		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement(
					"select * from event inner join user on event.partner=user.user_id where status='rescheduling requested' and (organizer=? or partner=?) and requestedto!=?");
			ps.setString(1, e.getUser_id());
			ps.setString(2, e.getUser_id());
			ps.setString(3, e.getUser_id());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				e = new Event();
				e.setEventid(rs.getString("event_id"));
				e.setStatus(rs.getString("status"));
				e.setFullname(rs.getString("fullname"));
				e.setUser_id(rs.getString("user_id"));
				e.setStart(rs.getTimestamp("start"));
				e.setEnd(rs.getTimestamp("end"));
				e.setTitle(rs.getString("title"));
				e.setReason(rs.getString("reason"));
				e.setOrganizer(rs.getString("organizer"));
				e.setPartner(rs.getString("partner"));
				e.setDescription(rs.getString("description"));
				e.setEventtype(rs.getString("eventtype"));
				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
	public String rescheduleEvent(Event e) {

		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement("select * from event WHERE ? < end AND ?> start and (partner=? or organizer=?)");
			ps.setTimestamp(1, e.getStart());
			ps.setTimestamp(2, e.getEnd());
			ps.setString(3, e.getPartner());
			ps.setString(4, e.getPartner());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println("This person already has a booking at this time");
				return "This person already has a booking at this time";
				
			}
			String status="rescheduled";
			PreparedStatement pstmt1;
			pstmt1 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
			pstmt1.executeUpdate();
			PreparedStatement pstmt;
			// registering user
			pstmt = con.prepareStatement(
					"update event set start=?,end=?,status=? where event_id=?");
			
			pstmt.setTimestamp(1, e.getStart());
			pstmt.setTimestamp(2, e.getEnd());
			pstmt.setString(3, status);
			pstmt.setString(4, e.getEventid());
			System.out.println("event_id"+e.getEventid());
			pstmt.executeUpdate();
			pstmt.close();
			return "Updated Event Successfully!";
		} catch (SQLException ex) {
			Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
		}

		return "Failed to update event, some error occured!";
	}
	
    public String deleteAvailability(Event e) {
        try {
            PreparedStatement pstmt;
            PreparedStatement pstmt1;
            pstmt1 = con.prepareStatement("SET FOREIGN_KEY_CHECKS=0");
            pstmt1.executeUpdate();
            pstmt = con.prepareStatement("delete from availabletime where id=?");  //deleting customer account query
            pstmt.setString(1, e.getEventid());
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return "SUCCESS DELETED RECORD";
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "FAILED DELETED RECORD";
    }
    
	public List<Event> getAvailableDays(String id , String type) {
		List<Event> list = new ArrayList<>();
		try {
			PreparedStatement ps;
			// retrieving event details
			ps = con.prepareStatement("select * from availabledays where user_id=? and eventtype=?");
			ps.setString(1, id);
			ps.setString(2, type);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Event e = new Event();
				e.setEventid(rs.getString("id"));
				e.setUser_id(rs.getString("user_id"));
				e.setMon(rs.getString("mon"));
				e.setTue(rs.getString("tue"));
				e.setWed(rs.getString("wed"));
				e.setThu(rs.getString("thu"));
				e.setFri(rs.getString("fri"));
				e.setSat(rs.getString("sat"));
				e.setSun(rs.getString("sun"));
				e.setEventtype(rs.getString("eventtype"));
				list.add(e);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}
	
}
