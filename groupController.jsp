<%@ page import="java.util.*" %>
<%@ page import="facebook.*" %>

<html>
<jsp:include page="menu.jsp" />

<%
GroupRepository.instance();
String groupname = request.getParameter("groupname");
String about = request.getParameter("description");
System.out.println(about);
User u = (User)session.getAttribute("loggedInUser");

Group group = GroupRepository.instance().createNewGroup(groupname, u);
group.setAbout(about);

ArrayList<User> friends = new ArrayList<User>();
friends = u.getFriends();
for(int i = 0; i<friends.size(); i++){
	if(request.getParameter(friends.get(i).getUsername()) != null){
		System.out.println("invited: " + friends.get(i).getUsername());
		group.invite(friends.get(i));
	}
}
		
out.println(about);

String ppName = "profilephoto";
Photo pp = new Photo(ppName);
pp.setPicture("/facebook/images/group.jpg");
group.setPicture(pp);

session.setAttribute("group", group);

response.sendRedirect("groupPage.jsp");



%>
</html>
