<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String Sindex = request.getParameter("q");
User u = (User)session.getAttribute("loggedInUser");
ArrayList<Status> statuses = u.getStatuses();

int index = Integer.valueOf(Sindex);
u.removeStatus(index);
response.sendRedirect("profile.jsp");

%>
