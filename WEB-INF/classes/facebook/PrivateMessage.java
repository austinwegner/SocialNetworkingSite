//PrivateMessage.java
package facebook;
import java.util.*;
import java.io.*;


/**
A private message is an object that contains a text message that is sent by a {@link facebook.User} and recieved by another via their {@link facebook.Mailbox}. A private message also contains the author of the message and the date and time it was instantiated.

@author Austin Wegner
*/
public class PrivateMessage {

	private String message, author;
	private User recipient;
	private Date date;

	/**
	Constructor for creating a private message.
	
	@param author a {@link facebook.User} object that is creating the Private Message to be sent.
	@param message the text that the author will send to the recipient.
	@param recipient the {@link facebook.User} that is recieving the Private Message.
	*/
	public PrivateMessage(String author, String message, User recipient) {

	}

	/**
	Returns the text that the author will send to the recipient.
	@return of type text. Cannot be an empty string.
	*/
	public String getMessage() {
		return message;
	}
	
	/**
	Returns the author of the PrivateMessage object.
	@return of type String, author of the text that is being sent.
	*/
	public String getAuthor() {
		return author;
	}
	
	/**
	Returns the date and time of the PrivateMessage object being instantiated.
	@return of type Date, timestamp of when the message is sent. 
	*/
	public Date getDate() {
		return date;
	}

	/**
	Sets the date and time of the PrivateMessage object.
	@param time of type Long. Sets the timestamp for the PrivateMessage object.
	*/
	private void setDate(Long time) {

	}

	/**
	Formats the PrivateMessage object for printing out a String.
	@return returns the formatted String with the message and the author.
	*/
	public String toString() {
		return ""; 
	}

	/**
	Enables chronological ordering of the private messages from newest to oldest based on time.
	@return returns an int that corresponds to the order of the private messages.
	*/
	public int compareTo(PrivateMessage other) {
		return 1;
	}

	/**
	Sends the PrivateMessage object to the recipient.
	@param recipient the {@link facebook.User} who is the recipient of the private message. The User must exist in the {@link facebook.UserRepository}.
	*/
	public void send(User recipient) {

	}

	/**
	Instatiates a {@link facebook.Notification} object which will inform the recipient of the interaction.
	@param recipient The {@link facebook.User} who is the recipient of the Notification object. The User must exist in the {@link facebook.UserRepository}.
	*/
	public void notify(User recipient) {

	}
}
