<%@ page import="facebook.UserRepository" %>
<%@ page import="facebook.User" %>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	User u = UserRepository.instance().getUserEmail(email);
	if(u != null) {
		String pass = u.getPassword();
		if(password.equals(pass)){
			session.setAttribute("loggedInUser",u);
			response.sendRedirect("home.jsp");
		}
		else{
			response.sendRedirect("/facebook/login.jsp?error=Passwords%20Do%20Not%20Match");
		}
	}	
	else{
		response.sendRedirect("/facebook/login.jsp?error=Account%20Does%20Not%20Exist");
	}
%>	
	
