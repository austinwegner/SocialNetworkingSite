<%@ page import="facebook.*" %>
<%@ page import="java.util.*" %>
<html>
<jsp:include page="menu.jsp" />
<head>
<div id="centerDoc">
<h2>Results</h2>
</head>
<body>
</br>
<%
	String username = request.getParameter("search");
	Collection c = UserRepository.instance().getAllUsers();
	Iterator<User> itr = c.iterator();
	username = username.toLowerCase();
	if(username == "" || username == null) {
		out.println("No search parameters given.");
	}
	else{
		while (itr.hasNext()) {
			User m = itr.next();
			String mName = m.getUsername();
			mName = mName.toLowerCase();
			User u = (User)session.getAttribute("loggedInUser");
			String loggedIn = u.getUsername();
			if(mName.startsWith(username)) {
				if(mName == loggedIn){
					out.println("");	
				}
				else{
					out.println("<a href='viewController.jsp?q="+mName+"'>"+mName+"</a></br></br>" );
				}
			}

		//session.setAttribute("viewUser", u);
		//if(u.equals(session.getAttribute("loggedInUser"))){
		//	response.sendRedirect("profile.jsp");
		//}
		//else{
		//	response.sendRedirect("viewProfile.jsp");
		//}
		}
	}
%>
</div>
</body>
</html>

