<%@ page import="facebook.*" %>
<%@ page import="java.util.*" %>

<%
User u = (User)session.getAttribute("loggedInUser");
ArrayList<Photo> photos = new ArrayList<Photo>();
photos = u.getAlbum();
String sindex = request.getParameter("q");
int index = Integer.valueOf(sindex);
Photo pic = photos.get(index);
u.setPicture(pic);
response.sendRedirect("profile.jsp");

%>
