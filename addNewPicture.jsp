<%@ page import="facebook.*" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html>
<head>
<title>Upload a profile picture!</title>
</head>
<body>
<h1>Upload the Picture!</h1>

<form action=addNewPictureController.jsp method=post
    enctype="multipart/form-data">

    Name your Picture dog! <input type=text name=name /><br/>

    Show us what it looks like! <input type=file name=picture /> </br>

    <input type=submit name=submit value="Upload Picture"></input>



</form>
</body>
</html>

