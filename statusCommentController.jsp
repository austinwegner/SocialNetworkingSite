<%@ page import="facebook.*" %>
<%@ page import="java.util.ArrayList" %>

<%
String message = request.getParameter("c");
User u = (User)session.getAttribute("loggedInUser");
ArrayList<Status> statuses = new ArrayList<Status>();
statuses = (ArrayList<Status>)session.getAttribute("statuses");
int index = Integer.valueOf(request.getParameter("index"));
out.println(index);
statuses.get(index).comment(message, u);

User owner = statuses.get(index).getAuthor();
	if(owner == (User)session.getAttribute("loggedInUser")){
		response.sendRedirect("profile.jsp");
	}
	else{
		response.sendRedirect("viewProfile.jsp");
	}
%>
