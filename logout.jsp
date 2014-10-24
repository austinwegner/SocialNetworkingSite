<%@ page import="facebook.User" %>
<%
session.setAttribute("loggedInUser", null);
response.sendRedirect("login.jsp");
%>
