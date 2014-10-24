<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="facebook.*" %>
<%
User u = (User)session.getAttribute("loggedInUser");    

    MultipartRequest mpr = new MultipartRequest(request,
        "/home/awegner/tomcat/webapps/facebook/images/");

    String name = mpr.getParameter("name");

    String picName = mpr.getOriginalFileName("picture");
    Photo newPicture = new Photo(name);
    newPicture.setPicture("/facebook/images/"+picName);

    session.setAttribute("thePicture",newPicture);
	


u.setPicture(newPicture);


    response.sendRedirect("profile.jsp");

%>

