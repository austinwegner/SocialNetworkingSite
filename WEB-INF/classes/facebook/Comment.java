//Comment.java
package facebook;

import java.util.*;

/**
	A Comment is an object that one user uses to interact with a {@link facebook.Post} object by writing text (comments) that will be displayed on the post owner's {@link facebook.Wall}. Comment objects are instantiated by {@link facebook.Post} objects. A Comment object knows the comment, the author of the comment, and the date and time of when the Comment object was instantiated. All this information will be displayed on the {@link facebook.Post} owner's {@link facebook.Wall}.
	@author Abdullah Rahmanyar 
*/

public class Comment implements Comparable<Comment>{

	private String comment;
	private User author;
	private Date date;
	
	/**
	Constructor for creating a new Comment object. Assigns the text of the comment and the author of the comment. Comment objects instantiated by Post objects.
	@param comment the text that will be displayed on the {@link facebook.Post} owner's {@link facebook.Wall}.
	@param author the author of the comment which is also be displayed along with the comment text.
	@throws IllegalArgumentException If incorrect type is passed. 
	*/
	protected Comment(String comment, User author){
		this.comment = comment;
		this.author = author;
		date = new Date();
		author.save();		
	}

	/**
	Gets the comment text from the Comment object.
	@return the comment text as a String.
	*/
	public String getComment(){
		return comment;
	}
	
	/**
	Get the author of the text from the Comment object.
	@return the author as a String.
	*/
	public User getAuthor(){
		return author;
	}

	/**
	Get the date and time of the Comment
	@return the date and time as a Date object.
	*/
	public Date getDate(){
		return this.date;
	}
	
	/**
	Set the date and time of when the Comment object is created
	@param time the current time. Must be passed as a Long.
	@throws IllegalArgumentException If incorrect type is passed.
	*/
	public void setDate(Long time){
		date = new Date(time);
	}
	
	/**
	Formats the output of a Comment object. Makes it so that the output could be printed out to the screen.
	@return the output as a String object.
	*/
	public String toString(){
		User u = getAuthor();
		String text = getComment();
		String time = getDate().toString();
		String username = u.getUsername();
		return username + ": " + text + "\n" + time;
	}
	
	public int compareTo(Comment other) {
		if(getDate().compareTo(other.getDate()) > 0){
			return -1;
		} else {
			return 1;
		}
	}
	/**
	Adds a notification object to the recipient User's notification ArrayList informing that user that a Comment has been posted.  
	@param user the user that is being notified of the interaction.
	@throws IllegalArgumentException if incorrect type is passed.
	*/
	public void notify(User recipient){

	}


}
