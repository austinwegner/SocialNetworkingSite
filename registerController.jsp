<%@ page import="facebook.*" %>
<%
	if(request.getParameter("password1").equals(request.getParameter("password2"))){
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password1");
		String gender = request.getParameter("gender");
		String month = request.getParameter("dobMonth");
		String day = request.getParameter("dobDay");
		String year = request.getParameter("dobYear");		

		if(email.endsWith(".com")|| email.endsWith(".edu")){
			User u = UserRepository.instance().createNewUser(email, username, password);
			session.setAttribute("loggedInUser", u);
			System.out.println(gender);
			u.setGender(gender);
			u.setMonth(month);
			u.setDay(day);
			u.setYear(year);
			if(u == null) {
				response.sendRedirect("/facebook/login.jsp?error=Username%20Already%20Taken");
			}
			else{
				if(u.getGender() == null || u.getMonth() == null || u.getDay() == null || u.getYear() == null){
					response.sendRedirect("/facebook/login.jsp?error=Gender%20Or%20Birthday%20Not%20Entered");
				}
				else{	
					String ppName = "profile photo";
					Photo pp = new Photo(ppName);
					pp.setPicture("/facebook/images/default.png");
					u.setPicture(pp);

					session.setAttribute("loggedInUser", u);
					response.sendRedirect("home.jsp");
				}
			}
		}
		else{
			response.sendRedirect("/facebook/login.jsp?error=Invalid%20Email%20Address");
		}
	}

	else{
		response.sendRedirect("/facebook/login.jsp?error=Passwords%20Do%20No%20Match");
	}
	
%>
