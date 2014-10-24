<%@ page import="facebook.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"
    type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href=".css" />
<script src=".js"></script>
<%
    Photo thePicture = (Photo) session.getAttribute("thePicture");
%>
<title>Look at this great <%= thePicture.getName() %>!</title>
</head>
<body>
<h1>Look at this okay <%= thePicture.getName() %>!!!!!</h1><br/>
<img src="<%= thePicture.getPicture() %>" width=300 />
</body>
</html>

