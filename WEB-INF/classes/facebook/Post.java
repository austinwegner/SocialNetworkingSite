//Post.java
package facebook;

import java.util.*;

/**
	A Post is an object that one user uses to interact with another user, by writing text on the other user's {@link facebook.Wall}. The Post object knows the text, who wrote the text (author) and a list of associated {@link facebook.Comment}s.
	@author Abdullah Rahmanyar
*/
public class Post implements Comparable<Post>{
	private Date date;
	private String text;
	private User author;
	private ArrayList<Comment> comments; 


/**
	Constructor for creating a new Post object.
	@param text the text that is going to be displayed on the other user's {@link facebook.Wall}.
	@param author the author of the text that will be displayed on the other user's {@link facebook.Wall}. 
*/
public Post(String text, User author){
	this.text = text;
	this.author = author;
	date = new Date();
	comments = new ArrayList<Comment>();
	author.save();
}

/**
	Gets the text that the user wrote which will be displayed on another user's {@link facebook.Wall}.
	@return the text which was entered by the user
*/
public String getText(){
	return text;
}

/**
	Gets the author of the text Which will be displayed on the other user's {@link facebook.Wall}.
	@return the author of the text
*/
public User getAuthor(){
	return author;
}

/**
	Gets the time and date of when the Post was created. This will be diplayed on the other user's {@link facebook.Wall}.
	@return the date and time as a Date object.
*/
public Date getDate(){

	return this.date;
}

/**
	Get a list of all the Comment objects made on this Post object.
	@return a list of all the Comments as an ArrayList.
*/
public ArrayList<Comment> getComments() {
	return comments;
}

/**
	Set the Date and time of the Post object.
	@param time the current time. Must be passed as a Long.
	@throws IllegalArgumentException If the parameter is not passed or incorrect type is passed.
*/
public void setDate(long time){
	date = new Date(time);
}

/**
	Formats the output of a Post object. Makes it so that the ouput could be printed out to the screen.
	@return the outuput as a String object
*/
public String toString(){
	User u = getAuthor();
	String username = u.getUsername();
	String message = getText();
	String time = getDate().toString();
	return username + ": " + message + "\n" + time;
}

/**
	Chronologically orders Post objects by their date and time. The most recent Posts will be ahead of the later posts.
	@return a number indicating whether the Post that this method is called on is before or after the "other" Post.
*/
public int compareTo(Post other){
	if(getDate().compareTo(other.getDate()) > 0){
		return -1;
	}
	else{
		return 1;
	}
}

/**
	Sets the message String and the author of the Post object. An empty String will be be accepted and a User object must also be passed.
	@throws IllegalArgumentException if the parameter is not passed or incorrect type is passed.	
*/
public void comment(String message, User author){
	//if(comments == null){
	//	ArrayList<Comment> comments = new ArrayList<Comment>();
	//}
	Comment c = new Comment(message,author);
	comments.add(c);
	author.save();
	this.author.save();
	
}

/**
	Adds a notification object to the User's notification list informing that user that a Post has been made on his wall. 
	@param  user the user that is being notified of the interaction.
	@throws IllegalArgumentException If incorrect type is passed.
*/
public void notify(User user){

}
private void save(){
	//try{
	//PrintWriter pw = new PrintWriter(

}

//void load(String commentFilename) {
//	try {
//		File f = new File(commentFilename);
//		BufferedReader br = new BufferedReader(new FileReader(f));
	





}
