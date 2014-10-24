<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String Sindex = request.getParameter("i");
String Cindex = request.getParameter("q");
User u = (User)session.getAttribute("loggedInUser");
ArrayList<Status> statuses = u.getStatuses();
ArrayList<Comment> comments = new ArrayList<Comment>();

out.println(Sindex);
out.println(Cindex);
int index = Integer.valueOf(Sindex);
int cindex = Integer.valueOf(Cindex);

comments = statuses.get(index).getComments();
comments.remove(cindex);
response.sendRedirect("profile.jsp");
%>
