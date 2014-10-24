<%@ page import="facebook.*" %>
<%@ page import="java.util.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<jsp:include page="menu.jsp" />
<div id="centerDoc">
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"
    type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href=".css" />
<script src=".js"></script>
<%
User u = (User)session.getAttribute("loggedInUser");
ArrayList<Photo> photos = new ArrayList<Photo>();
photos = u.getAlbum();
if(photos.size() < 1){
%>
<h1>Photo Album</h1></br></br></br>
<a href="createPhotoAlbum.jsp">Click here to start adding photos to your album!</a>
<%
}

%>
<title>The Hole in the Wall</title>
</head>
<body>
<h2>No photos currently in album.</h2></hr></br></br>
<%
for(int i = 0; i < photos.size(); i++){
	out.println("<img src="+photos.get(i).getPicture()+" width=250 />");
	
	out.println("<a href='setProfilePicture.jsp?q="+i+"'>Set as your profile picture</a></br>");
	out.println("<a href='deletePhoto.jsp?q="+i+"'>Delete</a></br>");


}
%>
</div>
