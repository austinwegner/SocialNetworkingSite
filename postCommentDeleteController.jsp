<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String Sindex = request.getParameter("i");
String Cindex = request.getParameter("q");
User u = (User)session.getAttribute("loggedInUser");

ArrayList<Post> posts = u.getWall().getPosts();
ArrayList<Comment> postComments = new ArrayList<Comment>();

int index = Integer.valueOf(Sindex);
int cindex = Integer.valueOf(Cindex);

postComments = posts.get(index).getComments();
postComments.remove(cindex);
response.sendRedirect("profile.jsp");





%>
