<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String Sindex = request.getParameter("q");
User u = (User)session.getAttribute("viewUser");
ArrayList<Post> posts = u.getWall().getPosts();

int index = Integer.valueOf(Sindex);
Wall wall = u.getWall();
wall.deletePost(index);
response.sendRedirect("viewProfile.jsp");

%>
