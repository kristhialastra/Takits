package com.mvc.bean;

import java.io.ByteArrayInputStream;
import java.sql.Timestamp;

public class Event extends User {
	 private java.sql.Date startdate,enddate;
	 private java.sql.Time starttime,endtime;
	 private Timestamp start,end;
	 private String mon,tue,wed,thu,fri,sat,sun;
	private String eventid,title,description,location,address,link,contact,additionalinfo,partner,eventtype,organizer, reason, requestedto,purpose,status,day;
	private ByteArrayInputStream file;
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public java.sql.Date getStartdate() {
		return startdate;
	}

	public void setStartdate(java.sql.Date startdate) {
		this.startdate = startdate;
	}

	public java.sql.Date getEnddate() {
		return enddate;
	}

	public void setEnddate(java.sql.Date enddate) {
		this.enddate = enddate;
	}

	public java.sql.Time getStarttime() {
		return starttime;
	}

	public void setStarttime(java.sql.Time starttime) {
		this.starttime = starttime;
	}

	public java.sql.Time getEndtime() {
		return endtime;
	}

	public void setEndtime(java.sql.Time endtime) {
		this.endtime = endtime;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getAdditionalinfo() {
		return additionalinfo;
	}

	public void setAdditionalinfo(String additionalinfo) {
		this.additionalinfo = additionalinfo;
	}

	public ByteArrayInputStream getFile() {
		return file;
	}

	public void setFile(ByteArrayInputStream file) {
		this.file = file;
	}

	public String getPartner() {
		return partner;
	}

	public void setPartner(String partner) {
		this.partner = partner;
	}

	public String getEventtype() {
		return eventtype;
	}

	public void setEventtype(String eventtype) {
		this.eventtype = eventtype;
	}

	public String getOrganizer() {
		return organizer;
	}

	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}

	public String getEventid() {
		return eventid;
	}

	public void setEventid(String eventid) {
		this.eventid = eventid;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getRequestedto() {
		return requestedto;
	}

	public void setRequestedto(String requestedto) {
		this.requestedto = requestedto;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getStart() {
		return start;
	}

	public void setStart(Timestamp start) {
		this.start = start;
	}

	public Timestamp getEnd() {
		return end;
	}

	public void setEnd(Timestamp end) {
		this.end = end;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getMon() {
		return mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public String getTue() {
		return tue;
	}

	public void setTue(String tue) {
		this.tue = tue;
	}

	public String getWed() {
		return wed;
	}

	public void setWed(String wed) {
		this.wed = wed;
	}

	public String getThu() {
		return thu;
	}

	public void setThu(String thu) {
		this.thu = thu;
	}

	public String getFri() {
		return fri;
	}

	public void setFri(String fri) {
		this.fri = fri;
	}

	public String getSat() {
		return sat;
	}

	public void setSat(String sat) {
		this.sat = sat;
	}

	public String getSun() {
		return sun;
	}

	public void setSun(String sun) {
		this.sun = sun;
	}


	
	
	
}
