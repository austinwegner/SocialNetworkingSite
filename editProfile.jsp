<%@ page import="java.util.*" %>
<%@ page import="facebook.*" %>

<jsp:include page="menu.jsp" />
<meta http=equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<link href="styleSheet.css" rel="stylesheet" type="text/css">
<head>
<title>Hole in the Wall</title>
</head>
<%
User m = (User)session.getAttribute("loggedInUser");
String mNmae = m.getUsername();
%>

<body>
<div id="centerDoc">
<h1>Edit your profile</h1>
</br>


<form action=editProfileController.jsp method=post >

<h2>About</h2>
<textarea name="about"  rows="5" cols="60"><%=m.getAbout() %></textarea>


<h2>Interests</h2>
<textarea name="interests" rows="5" cols="60"><%=m.getInterests() %></textarea>

</br></br><h2></h2>
<input type=submit value=Submit >
</form>
<%
if(request.getParameter("updated") != null) {
	out.println(request.getParameter("updated"));
}
%>
</div>

<div id="friendsColumn">
</div>
