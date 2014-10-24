<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String Sindex = request.getParameter("i");
String Cindex = request.getParameter("q");
User m = (User)session.getAttribute("loggedInUser");
User u = (User)session.getAttribute("viewUser");

ArrayList<Post> posts = new ArrayList<Post>();
ArrayList<Comment> postComments = new ArrayList<Comment>();

int index = Integer.valueOf(Sindex);
int cindex = Integer.valueOf(Cindex);

posts = u.getWall().getPosts();
postComments = posts.get(index).getComments();
postComments.remove(cindex);
response.sendRedirect("viewProfile.jsp");



%>
