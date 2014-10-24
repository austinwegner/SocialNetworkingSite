<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="facebook.*" %>
<%
User u = (User)session.getAttribute("loggedInUser");

MultipartRequest mpr = new MultipartRequest(request, "/home/awegner/tomcat/webapps/facebook/images/");


String name = mpr.getParameter("name");
String picName = mpr.getOriginalFileName("picture");
Photo newPicture = new Photo(name);
newPicture.setPicture("/facebook/images/"+picName);
u.addPhoto(newPicture);
response.sendRedirect("createPhotoAlbum.jsp");
%>
<a href="profile.jsp">Done adding photos to album</a>
