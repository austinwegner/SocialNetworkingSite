<%@ page import="java.utill.*" %>
<%@ page import="facebook.*" %>

<%
	String username = request.getParameter("q");
	out.println(username);
	User u = UserRepository.instance().getUser(username);
	if(u != null){
		session.setAttribute("viewUser", u);
		response.sendRedirect("viewProfile.jsp");
	}
	else{
		response.sendRedirect("home.jsp");
	}
%>
