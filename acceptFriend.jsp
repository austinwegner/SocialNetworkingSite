<%@ page import="facebook.*" %>
<%@ page import="java.util.*" %>

<%
	User u = (User)session.getAttribute("loggedInUser");
	String check = request.getParameter("q");
	String name = UserRepository.instance().getUser(check).getUsername();
	if(check.equals(name)){
		User m = UserRepository.instance().getUser(name);
		u.acceptFriend(m);
		u.resetNotifications();
	}
	response.sendRedirect("profile.jsp");
	
%>
		
