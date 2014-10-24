<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String about = request.getParameter("about");
String interests = request.getParameter("interests");

User u = (User)session.getAttribute("loggedInUser");
u.setAbout(about);
u.setInterests(interests);
%>
<%=u.getAbout()%> 
<%=u.getInterests()%>


<%

response.sendRedirect("/facebook/editProfile.jsp?updated=Your%20Profile%20Has%20Been%20Updated");

%>
	

