<%@ page import="java.util.*" %>
<%@ page import="facebook.*" %>
<%@ page import="java.text.DateFormat" %>

<jsp:include page="menu.jsp" />
<html>
<link href="styleSheet.css" rel="stylesheet" type="text/css">
<head>
<title>Hole in the Wall</title>
</head>
<%
User u = (User)session.getAttribute("loggedInUser");
String name = u.getUsername();
Photo profilePicture = u.getPicture();

%>
<body>
<div id="centerDoc">
<h1>Welcome, <%out.println(name+"!");%></h1>
</br>
<img src="<%= profilePicture.getPicture() %>" width=200 />

</br>
</br>Post a status</br>
<form action="homeStatusController.jsp" method="get">
<input type="text" size="50" name="status">
<input type="submit" value="post">

<h2>Updates</h2>
<%
	ArrayList<User> friends = new ArrayList<User>();
	friends = u.getFriends();
	ArrayList<Post> allPosts = new ArrayList<Post>();
	allPosts.addAll(u.getWall().getPosts());
	allPosts.addAll(u.getStatuses());
	for(int i = 0; i < friends.size(); i++){
		allPosts.addAll(friends.get(i).getWall().getPosts());
		allPosts.addAll(friends.get(i).getStatuses());
	}
	int counter = 3;
	Collections.sort(allPosts);
	
	
	for(int i = 0; i < allPosts.size(); i++){
		Post p = allPosts.get(i);
		User authorx = p.getAuthor();
		String pName = p.getAuthor().getUsername();
		String pDate = p.getDate().toString();
		DateFormat df = DateFormat.getDateTimeInstance(DateFormat.SHORT, DateFormat.SHORT);
		pDate = df.format(p.getDate());
		
		out.println("<div id='wallPost'>");
		out.println("<img src="+authorx.getPicture().getPicture()+" width=60 />");
		out.println("<b>"+pName+":</b> "+p.getText() + "</br>"+pDate);
		out.println("</div>");
//		ArrayList<Comment>comments = allPosts.get(i).getComments();
	//	if(comments != null){
	//		for(int j = 0; j < comments.size(); j++){
	//			out.println("<div id='comment'>" + comments.get(j) + "</div>");
	//		}
//	}	
		out.println("</br>");
	
		String loggedIn = u.getUsername();
		if(pName == loggedIn) {
			out.println("");
		}
		else{
			//out.println("</br><div id='wallPost'><b><u>"+pName+"</u></b> posted on "
			// + .getWall().getOwner().getUsername() + "'s Wall.</div>");
			ArrayList<Comment>comments = allPosts.get(i).getComments();
			if(comments != null){
				for(int j = 0; j < comments.size(); j++){
					out.println("<div id='comment'>" + comments.get(j) + "</div>");
				}
			}	
		}
			if(allPosts.size() < 15) {
			}
			else{
				allPosts.subList(15, allPosts.size()).clear();
			}
	}
	

	
	
%>
</div>

<%
//get all system users dropdown
Collection c = UserRepository.instance().getAllUsers();
Iterator<User> itr = c.iterator();
%>
<div id="friendsColumn">
<h2>Friend Holes:</h2> 
<%

	for(int j = 0; j < friends.size(); j++) {
		User temp = friends.get(j);
		String username = temp.getUsername();
		out.println("<a href='viewController.jsp?q="+username+"'>"+username+"</a>");
		out.println("</br>");
	}
%>
</div>
</body>
</html>
