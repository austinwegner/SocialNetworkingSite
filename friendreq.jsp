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
	
%>
<h1>Recent Friend Requests</h1>

<%
	int friendNotif =
	if(friendNotif == 0){
		out.println("No new friend requests at this time, sorry.");
	}
	else{
		//get all friend requests
		
	
	}
	for(int i = 0; i < friendNotif; i ++){

	}
%>
</div>
</body>
</html>
