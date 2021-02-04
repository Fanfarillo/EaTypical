<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="logic.engineeringclasses.others.SizedStack" %>
<%@page import="logic.engineeringclasses.others.Session" %>
<%@page import="logic.engineeringclasses.bean.scheduletrip.BeanOutputSchedule" %>
<%@page import="logic.controller.applicationcontroller.ScheduleTrip" %>
<%@page import="logic.engineeringclasses.others.BeanConverter" %>
<%@page import="logic.engineeringclasses.bean.scheduletrip.ConvertedBeanSchedule" %>

<%
	Session bs = (Session)session.getAttribute("session");
	String city = (String)session.getAttribute("city");
	BeanOutputSchedule[] scheduling = (BeanOutputSchedule[])session.getAttribute("trip");
	String errorString="";
	String savedScheduling="";
	
	BeanConverter converter = new BeanConverter();
	ConvertedBeanSchedule[] convertedScheduling = converter.convertDataType(scheduling, city);
%>

<%    	
    	if(request.getParameter("Home ST3")!=null) {
    		session.setAttribute("session", bs);
%>
			<jsp:forward page="HomePageTouristView.jsp"/>
<%
    	}
    	if(request.getParameter("Schedule Trip ST3")!=null) {
    		session.setAttribute("session", bs);
%>
			<jsp:forward page="ItalianViewCity.jsp"/>
<%
    	}
    	if(request.getParameter("Choose Restaurant ST3")!=null) {
    		session.setAttribute("session", bs);
%>
			<jsp:forward page="ItalianViewCity2.jsp"/>
<%
    	}
    	if(request.getParameter("Back ST3")!=null) {
    		session.setAttribute("session", bs);
%>
			<jsp:forward page="ItalianViewCity.jsp"/>
<%    		
    	}
    	if(request.getParameter("Change Settings")!=null) {
    		session.setAttribute("session", bs);
    		session.setAttribute("city", city);
%>
			<jsp:forward page="TripSettingsView.jsp"/>
<%
    	}
    	if(request.getParameter("Generate New Scheduling")!=null) {
    		for(int i=0; i<scheduling.length; i++) {
    			scheduling[i].setRestFromList();
    		}   		
    		session.setAttribute("session", bs);
    		session.setAttribute("city", city);
    		session.setAttribute("trip", scheduling);
    		
    	}
    	if(request.getParameter("Save Scheduling")!=null) {
    		try {
    			ScheduleTrip scheduleTrip = new ScheduleTrip();
    			scheduleTrip.saveScheduleTrip(convertedScheduling, bs.getUser().getUsername());		
				savedScheduling="Scheduling saved successfully.";
    		}
    		catch(Exception e) {
    			errorString="An unknown error occurred. Please, try again later.";
    		}
    	}
%>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="ISO-8859-1">
	<title>Scheduling result</title>
	<link rel="stylesheet" type="text/css" href="SchedulingCSS.css">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/jquery-3.5.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
	<form action="SchedulingView.jsp" name="myform" method="get">
		<input id="home" type="submit" name="Home ST3" value="Home">
		<input id="scheduleTrip" type="submit" name="Schedule Trip ST3" value="Schedule Trip">
		<input id="chooseRestaurant" type="submit" name="Choose Restaurant ST3" value="Choose Restaurant">
		<input id="back" type="submit" name="Back ST3" value="Back">
		<img id="fotoUtente" src="utente.jpg" alt="Photo"/>
		<label id="nomeUtente">Not logged</label>
		<label id="citta"><%=city%></label>		
		<label id="errorMsg"><%=errorString%></label>
		<label id="savedMsg"><%=savedScheduling%></label>
		
		<div class="box">
			<table>
			<caption>Your scheduling</caption>
				<tr>
					<th class="date" scope="col">Date</th>
					<th class="hour" scope="col">Hour</th>
					<th class="restName" scope="col">Restaurant</th>
					<th class="address" scope="col">Address</th>
					<th class="avgPrice" scope="col">Avg Price</th>
					<th class="avgVote" scope="col">Avg Vote</th>
				</tr>
<%
				for(int i=0; i<convertedScheduling.length; i++) {
%>
					<tr>
						<td class="date"><%=convertedScheduling[i].getStrDate() %></td>
						<td class="hour"><%=convertedScheduling[i].getStrHour() %></td>
						<td class="restName"><%=convertedScheduling[i].getName() %></td>
						<td class="address"><%=convertedScheduling[i].getAddress() %></td>
						<td class="avgPrice"><%=convertedScheduling[i].getStrAvgPrice() %></td>
						<td class="avgVote"><%=convertedScheduling[i].getStrAvgVote() %></td>
					</tr>
<%					
				}
%>								
			</table>
		</div>
		
		<input id="changeSettings" class="buttonBelow" type="submit" name="Change Settings" value="Change Settings">
		<input id="generateNewScheduling" class="buttonBelow" type="submit" name="Generate New Scheduling" value="Generate New Scheduling">
		<input id="saveScheduling" class="buttonBelow" type="submit" name="Save Scheduling" value="Save Scheduling">
	</form>
</div>
</body>
</html>