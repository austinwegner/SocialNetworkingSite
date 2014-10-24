<%@ page import="facebook.*" %>
<%@ page import="java.util.*" %>

<html>
<jsp:include page="menu.jsp" />

<head>
<div id="centerDoc" >
</head>

<body>

<%
	User u = (User)session.getAttribute("loggedInUser");
	Wall wall = u.getWall();
%>
<h1>Recent Notifications</h1>

<%
	int notif = wall.getNotif();
	if(notif == 0){
		out.println("No new notifications at this time, sorry.");
	}
	else{
		//get all recent posts
		Collection c = wall.getNotifications();
		Iterator<Post> itr = c.iterator();
		
		while(itr.hasNext()){
			Post p = itr.next();
			String name = p.getAuthor().getUsername();
			out.println("<h2><a href='viewController.jsp?q="+name+"'>"+name+"</a>"
			+ " wrote on your "+"<a href='profile.jsp'>Wall</a>.</h2>");
		}
	} 
	for(int i = 0; i < notif; i++){
		wall.resetNotification();
	}		
%>
</div>
</body>
</html>
