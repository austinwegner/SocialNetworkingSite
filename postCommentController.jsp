<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String message = request.getParameter("c");
User u = (User)session.getAttribute("loggedInUser");
ArrayList<Post> posts = new ArrayList<Post>();
posts = (ArrayList<Post>)session.getAttribute("posts");
int index = Integer.valueOf(request.getParameter("index"));
out.println(index);
posts.get(index).comment(message, u);

response.sendRedirect("viewProfile.jsp");
%>
