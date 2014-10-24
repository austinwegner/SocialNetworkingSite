<%@ page import="facebook.*" %>
<%@ page import="java.util.*" %>
<%
	User u = (User)session.getAttribute("loggedInUser");
	User uFriend = (User)session.getAttribute("viewUser");
	u.requestFriend(uFriend);
	uFriend.addNotif();	
	response.sendRedirect("viewProfile.jsp");
%>
