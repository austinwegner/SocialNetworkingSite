<%@ page import="facebook.*" %>
<link href="styleSheet.css" rel="stylesheet" type="text/css">

<div id="navigation">
<h2><img src="/facebook/images/logo.png" width=200 /></h2>

<form action="searchResult.jsp" method="get">
<input type="text" size="25" name="search" />
<input type="submit" value="Search" />
</form>
<%
//<div style ="float: right">
%>
<a href="logout.jsp">Logout</a></br>
<a href="home.jsp">Home</a></br>
<a href="profile.jsp">My Profile</a></br>
<a href="editProfile.jsp">Edit My Profile</a>

<%
User u = (User)session.getAttribute("loggedInUser");
Wall wall = u.getWall();

int notif = wall.getNotif();
int friendNotif = u.getNotifications();

%>

</br>
<%
	if(friendNotif==0){
	}
	else{
		out.println("Friend Requests: ");
		out.println("<a href='friendreq.jsp'>"+friendNotif+"</a>");
	}
%>
</br>

<%	if(notif==0){
	}
	else{
		out.println("Notifications: ");
		out.println("<a href='notify.jsp'>"+notif+"</a>");
	}
%>
</br>
<a href="createPhotoAlbum.jsp">Upload Photo</a>
</br>
<a href="viewPhotoAlbum.jsp">View Photo Album</a>
</br>
<a href="createGroup.jsp">Create A Group</a>
</br>
</div>
