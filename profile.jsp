<%@ page import="java.util.*" %>
<%@ page import="facebook.*" %>
<%@ page import="java.text.DateFormat" %>
<html>
<link href="styleSheet.css" rel="stylesheet" type="text/css">
<jsp:include page="menu.jsp" />

<head>
<div id="centerDoc">
</head>

<body>
<%
	User u = (User)session.getAttribute("loggedInUser");
	Wall wall = u.getWall();
	session.setAttribute("viewUser", u);
	String name = u.getUsername();
	Photo profilePicture = u.getPicture();
	String about = request.getParameter("about");
	String interests = request.getParameter("interests");
	String gender = request.getParameter("gender");
	String month = request.getParameter("dobMonth");
	String day = request.getParameter("dobDay");
	String year = request.getParameter("dobYear");
	out.println("<h1>My Profile</h1>");
%>
	<img src="<%= profilePicture.getPicture() %>" width=200 />
	</br>
	Gender:
<%
	out.println(u.getGender());
%>
</br>	Birthday:
<%
	out.println(u.getMonth() + " ");
	out.println(u.getDay() + ", ");
	out.println(u.getYear());
%>
	<form action="editProfileController.jsp" method="get">
	<h2>About Me</h2>	
<%
	out.println(u.getAbout()); %>
	<br>
	<h2>My Interests</h2>
<%	out.println(u.getInterests());
%>
	</form>
	<br>
	

<h1></h1>
</br>
My Status:
<form action="statusController.jsp" method="get">
<input type="text" size"50" name="status">
<input type="submit" value="Post!">
</form>

<%
	ArrayList<Status> statuses = new ArrayList<Status>();
	ArrayList<Comment> statusComments = new ArrayList<Comment>();

	statuses = u.getStatuses();
	Collections.sort(statuses);
	session.setAttribute("statuses", statuses);
	if(statuses != null){
		for(int i = 0; i < statuses.size(); i++){
%>
<% //<form action="statusCommentController.jsp" method="get">%>
<div id="wallPost">
<%

			Status st = statuses.get(i);
			String stDate = st.getDate().toString();
			DateFormat df = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
			stDate = df.format(st.getDate());
			out.println("<img src= "+profilePicture.getPicture()+" width=60 />");	
			out.println("<b>"+name+"</b>"+": "+st.getText() + "</br>"+stDate+":<a href='statusDeleteController.jsp?q="+i+"' > Delete</a></br>");
%></div><%
	/*		statusComments = statuses.get(i).getComments();
			if(statusComments != null){
				for(int j = 0; j < statusComments.size(); j++){
					out.println("<div id='comment'>");
					Comment c = statusComments.get(j);
					String cDate = c.getDate().toString();
					cDate = df.format(c.getDate());
					User author = c.getAuthor();
					String n = author.getUsername();
					Photo pp = author.getPicture();
					
					out.println("<img src= "+pp.getPicture()+" width=60 />");
					out.println("<b><u>"+n+"</u></b>"+": "+c.getComment()+"</br>"+cDate+"<a href='commentDeleteController.jsp?q="+j+"&i="+i+"' >    delete</a></br></div>");
					
					//out.println("<div id='comment'>" + statusComments.get(j)+"<a href='commentDeleteController.jsp?q="+j+"&i="+i+"' >delete</a></br></div>");
				}
			}
			out.println("</textarea><br>");
	*/
	%>
	
<%//<input type="text" size="50" name="c">%>
<%
		//	out.print("<input type='hidden' value='"+i+"' name='index'>");
		//	out.print("<input type='submit' value='comment' name='comment'>");

//</form>
%>
</br></br>
<%
		}
	}
%>
<h2> Wall </h2>
<%
//Wall posts
        ArrayList<Post> posts = new ArrayList<Post>();
        ArrayList<Comment>postComments = new ArrayList<Comment>();
        posts = u.getWall().getPosts();
	Collections.sort(posts);
        session.setAttribute("posts",posts);

        if(posts != null){
                for(int i = 0; i < posts.size(); i++){
                        
                        //<form action="postCommentController.jsp" method="get">
                        %>
			<div id="wallPost">
			<%
			Post po = posts.get(i);
			User authorx = po.getAuthor();
			String poName = po.getAuthor().getUsername();
                        String poDate = po.getDate().toString();
			DateFormat df = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
			poDate = df.format(po.getDate());
			out.println("<img src="+authorx.getPicture().getPicture()+" width=60 />");
                        out.println("<b>"+poName+":</b>"+" "+po.getText() + "</br>"+poDate+":<a href='postDeleteController.jsp?q="+i+"' > Delete</a></br>");
			
			%></div></br><%	/*
                        postComments = posts.get(i).getComments();
                        if(postComments != null){
                                for(int j = 0; j < postComments.size(); j++){
                                        out.println("<div id='comment'>" + postComments.get(j));
					out.println("<a href='postCommentDeleteController.jsp?q="+j+"&i="+i+"' >delete</a></br>");
					out.println("</div>");
                                }
                        }
                        out.println("</textarea></br>");*/
                        %>
                        <%//<input type="text" size="50" name="c">%>
                        <%
                       // out.println("<input type='hidden' value='"+i+"' name='index'>");
                       // out.println("<input type='submit' value='comment' name='comment'>");
%>
                      </form><%}}%></br></br>
</div>
<div id="friendsColumn">
<h2>Friend Holes:</h2>
<%
//Get all Freinds DROP down here
ArrayList<User> friends = new ArrayList<User>();
friends = u.getFriends();
%>
<%
for(int i = 0; i < friends.size(); i++){
	User temp = friends.get(i);
	String username = temp.getUsername();
	out.println("<a href='viewController.jsp?q="+username+"'>"+username+"</a>");
	out.println("</br>");
}

ArrayList<User> requests = new ArrayList<User>();
requests = u.getFriendRequest();
%>
<%
	if(!requests.isEmpty()){
		out.println("Respond to friend requests:</br></br>");
		for(int i = 0; i < requests.size(); i++){
			out.println(requests.get(i).getUsername() + ": <a href='acceptFriend.jsp?q=" + requests.get(i).getUsername() +"'>"+ " accept" + "</a>");
			out.println("</br>");
		}
	}
%>
</div>
</body>
</html>
