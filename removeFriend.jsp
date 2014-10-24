<%@ page import="facebook.*" %>

<%
	User u = (User)session.getAttribute("loggedInUser");
	User uRemove = (User)session.getAttribute("viewUser");
	u.removeFriend(uRemove);
	uRemove.removeFriend(u);
	response.sendRedirect("viewProfile.jsp");
%>
