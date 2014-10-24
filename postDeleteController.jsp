<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String Sindex = request.getParameter("q");
User u = (User)session.getAttribute("loggedInUser");
ArrayList<Post> posts = new ArrayList<Post>();
posts = u.getWall().getPosts();
Wall wall = u.getWall();

int index = Integer.valueOf(Sindex);
wall.deletePost(index);
response.sendRedirect("profile.jsp");


%>
