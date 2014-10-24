<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String Sindex = request.getParameter("i");
String Cindex = request.getParameter("q");
User m = (User)session.getAttribute("loggedInUser");
User u = (User)session.getAttribute("viewUser");

ArrayList<Status> statuses = new ArrayList<Status>();
ArrayList<Comment> statusComments = new ArrayList<Comment>();

int index = Integer.valueOf(Sindex);
int cindex = Integer.valueOf(Cindex);

statuses = u.getStatuses();
statusComments = statuses.get(index).getComments();
statusComments.remove(cindex);
response.sendRedirect("viewProfile.jsp");



%>
