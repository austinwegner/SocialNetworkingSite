<html>
<head>
<link href="styleSheet.css" rel="stylesheet" type="text/css">
<title>The Hole in the Wall</title>
</head>

<body>
<div id="centerDoc">

<h2><img src="/facebook/images/logo.png" width=300 /></h2>

<form action="loginController.jsp" method="get">
Email: <input type="text" name="email"></br>
Password: <input type="password" name="password"></br>
<input type="submit" value="Login">
</form>
</br></br></br>
<%
if(request.getParameter("error") != null) {
	out.println(request.getParameter("error"));
}
%>
</div>
<div id="navigation">
<jsp:include page="register.jsp"/>
</div>
</body>
</html>
