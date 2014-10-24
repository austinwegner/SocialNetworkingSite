<%@ page import="java.util.*" %>
<%@ page import="facebook.*" %>
<%@ page import="java.text.DateFormat" %>

<jsp:include page="menu.jsp" />
<html>
<link href="styleSheet.css" rel="stylesheet" type="text/css">
<head>
<title>Group</title>
</head>
<%
User u = (User)session.getAttribute("loggedInUser");
Group group = (Group)session.getAttribute("group");
String name = group.getName();
User creator = group.getCreator();
String creatorName = creator.getUsername();
Photo profilePicture = group.getPicture();
ArrayList<User> members = new ArrayList<User>();
members = group.getMembers();
%>
<body>
<div id="centerDoc">
<h1>Welcome to <%out.println(name+" ");%></h1>
<br>
<%
if(u == creator){
out.println("<a href='editGroup.jsp'>Edit your group page</a></br>");
}
%>
<img src="<%= profilePicture.getPicture() %>" width=200 />
</br>

</br>Post to the Group Wall</br>
<form action="groupStatusController.jsp" method="get">
<input type="text" size="50" name="status">
<input type="submit" value="post">
</div>

<%
//get all members
%>
<div id="friendsColumn">
<h2>Members</h2>
<%
	for(int i = 0; i < members.size(); i++){
		String mName = members.get(i).getUsername();
		System.out.println(mName);
		out.println("<a href='viewController.jsp?="+ mName + "'>" + mName + "</a>");
		out.println("</br>");
	}
%>
</div>
</body>
</html>









