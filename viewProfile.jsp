<%@ page import="java.util.*" %>
<%@ page import="facebook.*" %>
<%@ page import="java.text.DateFormat" %>

<html>
<link href="styleSheeet.css" rel="stylesheet" type="text/css">
<jsp:include page = "menu.jsp" />

<head>
<body>
<div id="centerDoc">
</head>

<%
	User u = (User)session.getAttribute("viewUser");
	User m = (User)session.getAttribute("loggedInUser");
	if(u == m){
		response.sendRedirect("profile.jsp");
	}
	String name = u.getUsername();
	out.println("<h2>" + name + "'s Profile</h2>");
%>

<img src="<%= u.getPicture().getPicture() %>" width=200 />
<h2></h2>
	Gender:
<%	out.println(u.getGender());%>
	<br>Birthday:
<%
	out.println(u.getMonth() + " ");
	out.println(u.getDay() + ", ");
	out.println(u.getYear());
%>
	<h2>About Me</h2>
<%	
	out.println(u.getAbout()); %>
	<br>
	<h2>My Interests</h2>
<%	out.println(u.getInterests()); %>
<body>
</br>

</br><h2>Statuses</h2>
<%
	ArrayList<Status> statuses = new ArrayList<Status>();
//	ArrayList<Comment> statusComments = new ArrayList<Comment>();

	statuses = u.getStatuses();
	Collections.sort(statuses);
	session.setAttribute("statuses", statuses);
	
	if(statuses != null){
		for(int i = 0; i < statuses.size(); i++){
			%>
			<div id="wallPost">
			<%
			Status st = statuses.get(i);
                        String stDate = st.getDate().toString();
                        DateFormat df = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
                        stDate = df.format(st.getDate());
                        out.println("<img src="+u.getPicture().getPicture()+" width=60 />");
			out.println("<b>"+name+":</b> "+" "+st.getText() + "</br>"+stDate);

			%></div><%
		/*	statusComments = statuses.get(i).getComments();
			if(statusComments != null){
				for(int j = 0; j < statusComments.size(); j++){
					out.println("<div id='comment'>" + statusComments.get(j));
					if(statusComments.get(j).getAuthor() == m){
						out.println("<a href='viewStatusCommentDeleteController.jsp?q="+j+"&i="+i+"' >delete</a></br>");	
					}

					out.println("</div>");
				}
			}
			out.println("</textarea></br>");
			if(m.getFriends().contains(u)){*/
			
			
		//	<form action="statusCommentController.jsp" method="get">
		//	<input type="text" size="50" name="c">
			
		//	out.print("<input type='hidden' value='"+i+"' name='index'>");
		//	out.print("<input type='submit' value='comment' name='comment'>");
%>
			</form><%}}%></br></br>
<h2> Wall </h2></br>
<%if(m.getFriends().contains(u)){%>
<form action="postController.jsp" method="get">
<input type="text" name="post" size="50">
<input type="submit" value="post">
</form>	
<%}
//Wall posts
	ArrayList<Post> posts = new ArrayList<Post>();
	ArrayList<Comment>postComments = new ArrayList<Comment>();

	posts = u.getWall().getPosts();
	Collections.sort(posts);
	session.setAttribute("posts",posts);

	if(posts != null){
		for(int i = 0; i < posts.size(); i++){
			%>
			<div id=wallPost >
		<%
		Post po = posts.get(i);
		User authorx = po.getAuthor();
		String poName = po.getAuthor().getUsername();
		String poDate = po.getDate().toString();
		DateFormat df = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
		poDate = df.format(po.getDate());
		out.println("<img src=" + authorx.getPicture().getPicture()+" width=60 />");
		out.println("<b>"+poName+": </b>"+" "+po.getText() + "</br>"+poDate + ":");

		if(posts.get(i).getAuthor() == m){
			out.println("<a href='viewPostDeleteController.jsp?q="+i+"'> Delete</a></br>");
		}
		%></div><% out.println("</br>");
		//	postComments = posts.get(i).getComments();
		//	if(postComments != null){
		//		for(int j = 0; j < postComments.size(); j++){
		//			out.println("<div id='comment'>" + postComments.get(j));
		//			if(postComments.get(j).getAuthor() == m){
		//				out.println("<a href='viewPostCommentDeleteController.jsp?q="+j+"&i="+i+"' >delete</a></br>");
		//			}
		//			out.println("</div>");
		//		}
			}
			out.println("</textarea></br>");
		/*	if(m.getFriends().contains(u)){
			
			<form action="postCommentController.jsp" method="get">
			<input type="text" size="50" name="c">
			
			out.println("<input type='hidden' value='"+i+"' name='index'>");
			out.println("<input type='submit' value='comment' name='comment'>");
		*/
%>
		<%/*	</form>*/}%></div>
<div id="friendsColumn">
<h2>Friends:</h2>
</br>
<%
ArrayList<User> friends = new ArrayList<User>();
friends = u.getFriends();

for(int i = 0; i < friends.size(); i++){
	User temp = friends.get(i);
	String username = temp.getUsername();
	out.println("<a href='viewController.jsp?q="+username+"'>"+username+"</a>");
	out.println("</br>");
	}
%>
</br>
<%
	ArrayList<User> myFriends = new ArrayList<User>();
	myFriends = m.getFriends();
	ArrayList<User> requested = new ArrayList<User>();
	requested = u.getFriendRequest();
	ArrayList<User> mRequested = new ArrayList<User>();
	mRequested = m.getFriendRequest();

	if(myFriends.contains(u)){
		out.println("<a href='removeFriend.jsp'>Remove as Friend</a>");
	}
	else if(requested != null){
		if(requested.contains(m)){
			out.println("Friend request sent.");
		}
		else if(mRequested.contains(u)){
			out.println(name+" has already requested you to be their friend.");
		}
		else{
			out.println("<a href='addFriend.jsp'>Add Friend</a><br>");
		}
	}
%>
</div>
</body>
</html>
