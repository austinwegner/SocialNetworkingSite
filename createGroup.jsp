<%@ page import="java.util.*" %>
<%@ page import="facebook.*" %>

<html>
<jsp:include page="menu.jsp" />

<head>
<div id="centerDoc">
</head>

<%
User u = (User)session.getAttribute("loggedInUser");
ArrayList<User> friends = new ArrayList<User>();
friends = u.getFriends();
%>

<body>
<h2>
Create a New Group
</h2>
<form action="groupController.jsp" method="get">
Enter your Group name: <input type="text" name="groupname"></br>
Group Description: <input type="text" name="description" size=60 ></br>
</br>
Invite your friends:
<%
	for(int i = 0; i < friends.size(); i++){
		User f = friends.get(i);
		String name = f.getUsername();
		out.println("<input type='checkbox' name='" + name + "value='"+ name + "'>"+name+"</br>");
	}
%>

<input type=submit value="Create Group"/>
</form>
</div>
</body>
</html>
