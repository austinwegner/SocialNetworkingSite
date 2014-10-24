<%@ page import="java.util.*" %>
<%@ page import="facebook.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<jsp:include page="menu.jsp" />

<head>
<title>Upload a picture to your album</title>
<div id="centerDoc">
</head>

<%
User u = (User)session.getAttribute("loggedInUser");
ArrayList<Photo> photos = u.getAlbum();

%>

<body>
<h2> Add a photo to your album </h2>
<form action=photoAlbumController.jsp method=post enctype="multipart/form-data">
Give your photo a name: <input type=text name=name /></br></br>
Upload your Photo:     <input type=file name=picture /></br></br>
<input type=submit name=submit value="Upload Picture"></input>
</br></br></br></br></br></br>
<a href="profile.jsp">Done adding photos to album</a>
</div>
</form>
</body>
</html>
