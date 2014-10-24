<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String status = request.getParameter("status");
User u = (User)session.getAttribute("loggedInUser");
u.postStatus(status, u);

response.sendRedirect("profile.jsp");
%>
