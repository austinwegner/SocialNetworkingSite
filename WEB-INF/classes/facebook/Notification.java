//Notification.java

package facebook;
/**
	A notification knows a recipient and informs that recipient when another
	 user interacts with it. Interactions include: Making a {@link facebook.Post},
	{@link facebook.User#requestFriend(User)}, making a {@link facebook.Comment},
	 and sending a {@link facebook.PrivateMessage}.

	@author Austin Bouchard
*/
public class Notification{

	private User recipient, sender;
	
	/**
	   Constructor for creating a notification. Notification constructor parameters cannot refer
	   to the same User object. If the users are the same the system will print out an error message declaring
	   that a User cannot notify itself. If one or both of the User objects does not exist the system
	   will print out an error message saying the object does not exist.
	   @param recipient the user who is receiving the notification object.
	   @param sender the user who sent the notification. 
	*/	   
	public Notification(User recipient, User sender){
	}

	/**
	   Make a notification for creating a {@link facebook.Comment} on a post, comment, or picture object.
	   @return the user who sent the notification.
	*/
	public User commentNotification(){
		return sender;
	}

	/**
	   Make a notification for creating a {@link facebook.Post} on a wall object.
	   @return the user who sent the notification.
	*/
	public User postNotification(){
		return sender;
	}

	/**
	   Make a notification for calling {@link facebook.User#requestFriend(User)} on a user object. 
	   @return the user who sent the notification.
	*/
	public User friendNotification(){
		return sender;
	}

	/**
	   Make a notification for sending a {@link facebook.PrivateMessage} to a user object.
	   @return the user who sent the notification.
	*/
	public User privateMessageNotification(){
		return sender;
	}

} 
