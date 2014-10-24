//User.java
package facebook;
import java.util.*;
import java.io.*;
import java.util.ArrayList;

/**
	A user is an object that can interact with other user objects within the Facebook system. Users 
	interact by posting on other {@link facebook.UserWall} objects, commenting on {@link facebook.Post}
	objects, sending {@link facebook.PrivateMessage} objects, and adding users as friends. Users can also
	update their own state by posting {@link facebook.Status} objects to their wall object and by 
	uploading photos.

	@author Austin Bouchard
*/ 
public class User{
	
	private int notifications;
	private String about = "";
	private String interests = "";
	private String username, password, email, gender, month, day, year;
	private ArrayList<User> friendRequest;
	private ArrayList<User> friends;
	private PhotoAlbum myAlbum;
	private Wall wall;
	private ArrayList<Status> statuses;
	private ArrayList<Photo> photos;
	private Photo profilePicture;
	
	public void addPhoto(Photo pic){
		photos.add(pic);
		save();
	}
	public void removePhoto(Photo p){
		if(photos.contains(p)){
			photos.remove(p);
			save();
		}
	}
	public ArrayList<Photo> getAlbum(){
		return photos;
	}
	public void setPicturee(Photo p){
		profilePicture = p;
	}
	public void setPicture(Photo p){
		profilePicture = p;
		save();
	}
	
	public Photo getPicture(){
		return profilePicture;
	}
	/**
	   Constructor for creating a user object. This creates a user object and also instantiates a
	   {@link facebook.UserWall} object for the user. 
	   @param username string object that refers to the user object. {@link facebook.UserRepository}
	   checks to make sure username has not been taken by another user object. 
	   @param password string object that lets the user login to Facebook.
	*/
	protected User(String email, String username, String password){
		init();
		setEmail(email);
	//	this.about;
	//	this.interests;
		setUsername(username);
		setPassword(password);
		wall = new Wall(this);
		save();
	
	}
	
 	User(){
		init();
	}

	private void init(){
		friendRequest = new ArrayList<User>();
		friends = new ArrayList<User>();
		statuses = new ArrayList<Status>();
		photos = new ArrayList<Photo>();
	}
	
	public void setAbout(String about) {
		this.about= about;
		save();

	}

	public String getAbout() {
		return about;
	}

	public void setInterests(String interests) {
		this.interests = interests;
		save();
	}

	public String getInterests() {
		return interests;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getGender() {
		return gender;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getMonth() {
		return month;
	}	

	public void setDay(String day) {
		this.day = day;
	}

	public String getDay() {
		return day;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
	public String getYear() {
		return year;
	}

	protected void setEmail(String email) {
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}
	protected void setUsername(String username){
		this.username = username;
	}

	/**
	   Get the username of a user object.
	   @return string object containing the username variable.
	*/
	public String getUsername(){
		return username;
	}

	protected void setPassword(String password){
		this.password = password;
	}

	/**
	   Get the password for a user object.
	   @return string object containing the username variable.
	*/
	public String getPassword(){
		return password;
	}
	
	/**
	   Send a request through the form of a {@link facebook.Notification} object to another registered user
	   on Facebook. This will check the caller's friends to make sure they are not already 	
	   friends with the user they are attempting to add. The user they are trying to friend will then be 
	   sent a notification with the option to accept or deny their friend request. An error message will
	   be sent to the system if the User is already friends with the User they are trying to friend.  
	   @param user the user object the caller is trying to become friends with.
	*/
	@SuppressWarnings("unchecked")
	public void requestFriend(User user){
		if(friends.contains(user)){
			System.out.println("Already friends with this user");
		}
		else{
			user.getFriendRequest().add(this);
			user.save();
		}
	}
	
	public ArrayList<User> getFriendRequest(){
		return friendRequest;
	}
	
	/**
	   Accept a friend request another user has sent through a {@link facebook.Notification} object.
	   The notification object returns the sender user object.
	   @param user the user who sent the {@link #friendNotification()}.
	*/
	public void acceptFriend(User user){
		if(friendRequest.contains(user)){
			friends.add(user);
			user.getFriends().add(this);
			friendRequest.remove(user);
			user.save();
			save();
		}
		else{
			System.out.println("This user has not requested to be your friend.");
		}
	}
	
	public void removeFriend(User user){
		if(friends.contains(user)){
			friends.remove(user);
			save();
		}
		else{
			System.out.println("Not friends with this user");
		}
	}
	
	public void resetNotifications(){
		notifications -= 1;
		save();
	}
	
	public int getNotifications(){
		return notifications;
	}

	public void addNotif(){
		notifications += 1;
		save();
	}

	/**
	   Get access to the user's friends.
	   @return the user arraylist of friends.
	*/
	public ArrayList<User> getFriends(){
		return friends;
	}
	
	
	/**
	   Instantiates a {@link facebook.Status} object that includes the text of the status.
	   @param message the text String of the {@link facebook.Status} object.
	   @throws IllegalArgumentException if the parameter is not passed or is not the correct type.
	*/
	public void postStatus(String message, User u){
		if(statuses == null){
			statuses = new ArrayList<Status>();
		}
		Status s = new Status(message, u);
		statuses.add(s);
		save();
	}

	public void removeStatus(int index){
		statuses.remove(index);
		save();
	}
	
	public ArrayList<Status> getStatuses(){
		return statuses;
	}

	public Wall getWall(){
		return wall;
	}

	/**
	  Writes the user's information to disk. Saves the user's username, password, friends, and requested
	  friends.
	*/
	protected void save(){
		try {
		PrintWriter pw = new PrintWriter(
			new FileWriter("/home/awegner/tomcat/webapps/facebook/files/user/" + username + ".user"));
		pw.println("User Credentials");
		pw.println(username);//username
		pw.println(password);//password
		pw.println(email);//email
		pw.println(profilePicture.getName());//profilepic name
		pw.println(profilePicture.getPicture());//profilepic path
		pw.println(getGender());
		pw.println(getMonth());
		pw.println(getDay());
		pw.println(getYear());
		pw.println(getInterests());
		pw.println(getAbout());
		pw.println("Friends");
		for(User u2 : getFriends()) {
			pw.println(u2.getUsername());
		}
		pw.println("Status");
		for(Status s : getStatuses()) {
			pw.println(s.getText());
			pw.println(s.getDate().getTime());
		/*	pw.println("Comments");
			for(Comment c : s.getComments()) {
				pw.println(c.getAuthor().getUsername());
				pw.println(c.getComment());
				pw.println(c.getDate().getTime());
			}*/
		}
		pw.println("Friend Requests");
		for(User u3 : getFriendRequest()){
			pw.println(u3.getUsername());
		}
		pw.println("Notifications");
		pw.println(getNotifications());
		pw.println("PhotoAlbumPhotos");
		for(Photo p : getAlbum()){
			pw.println(p.getName());//photoName
			pw.println(p.getPicture());//photoPath
		}
		
		pw.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
  	public void load(String userFilename) {
	try {
		File f = new File(userFilename);
		BufferedReader br = new BufferedReader(new FileReader(f));
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		br.readLine();
		String friendLine = br.readLine();
		System.out.println("User/Load/friendLine: " + friendLine);
		while(!friendLine.equals("Status")) {
			friends.add(UserRepository.instance().getUser(friendLine));
			friendLine = br.readLine();
		}
		System.out.println("FUCK TEST 1");
	
		String statusLine = br.readLine();
		while(!statusLine.equals("Friend Requests")) {
			Status oldStatus = new Status(statusLine, this);
			statusLine = br.readLine();
			oldStatus.setDate(new Long(statusLine).longValue());
			statuses.add(oldStatus);
			statusLine = br.readLine();
		/*	while(!commentLine.equals("Status") || commentLine != null) {
				System.out.println("Loading status : " + commentLine);
				User u = UserRepository.instance().getUser(commentLine);
				String textLine = br.readLine();
				Comment oldComment = new Comment(textLine, u);
				commentLine = br.readLine();
				oldComment.setDate(new Long(commentLine).longValue());
				oldStatus.getComments().add(oldComment);
				commentLine = br.readLine();
				}*/
		}
		System.out.println("FUCK TEST 2");
		String requestLine = br.readLine();
		while(!requestLine.equals("Notifications")){
			friendRequest.add(UserRepository.instance().getUser(requestLine));
			requestLine = br.readLine();
		}
		String notifyLine = br.readLine();
		System.out.println("FUCK TEST 3");
		while(!notifyLine.equals("PhotoAlbumPhotos")){
			int x = Integer.parseInt(notifyLine);
			notifications = x;
			notifyLine = br.readLine();
		}
		//br.readLine();
		String picName = br.readLine();
		System.out.println("THIS IS WHAT I AM READING IN " + picName);
		while(picName != null){
			Photo p = new Photo(picName);
			String path = br.readLine();
			p.setPicture(path);
			photos.add(p);
			picName = br.readLine();			
		}
		br.close();
		System.out.println("FUCK TEST 4 FINAL");
		} catch(Exception e) {
			e.printStackTrace();
		}
		//load wall
		try {
			File wallFile = new File("/home/awegner/tomcat/webapps/facebook/files/wall/"+this.getUsername()+".wall");
			System.out.println("file find check 1");
			//BufferedReader wBr = new BufferedReader(new FileReader(wallFile));
			//wBr.readLine();
			//String s = wBr.readLine();
			//System.out.println(s);
			//User x = UserRepository.instance().getUser(s);//owner
			wall = new Wall();
			//w.setOwner(x);
			//wBr.close();
			System.out.println("wall instantiated doggggg");
			wall.load("/home/awegner/tomcat/webapps/facebook/files/wall/" + this.getUsername()+".wall");			
			System.out.println("file find check 2");
		}catch(Exception e) {
			System.out.println("couldn't load wall");
			e.printStackTrace();
		}
	}
	
	
}

