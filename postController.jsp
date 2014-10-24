<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String post = request.getParameter("post");
User u = (User)session.getAttribute("viewUser");
User m = (User)session.getAttribute("loggedInUser");
u.getWall().post(post, m);
ArrayList<Post> test = new ArrayList<Post>();
test = u.getWall().getPosts();
for (int i = 0; i < test.size(); i++){
        out.println(test.get(i));
}
response.sendRedirect("viewProfile.jsp");
%>
