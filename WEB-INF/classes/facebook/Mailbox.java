//Mailbox.java
package facebook;
import java.util.*;
import java.io.*;

/**
A Mailbox is an object that stores a User's {@link facebook.PrivateMessage}. The Mailbox stores the PrivateMessage object in an array list ordered chronologically from newest to oldest. The User has the ability to send mail (selecting another {@link facebook.User} as the recipient and entering the text for the private message). The User also has the ability to delete their private messages.

@author Austin Wegner
*/
public class Mailbox {

	private ArrayList<PrivateMessage> mail;
	
	/**
	Returns an array list of private message objects to the Mailbox. 
	
	@return returns list of all private messages.
	*/
	public ArrayList<PrivateMessage> getMail() {
		return mail;	
	}
	
	/**
	Gets the required parameters from the {@link facebook.User} so that the private message can be sent to the recipient.	

	@param recipient the User that will be receiving the private message from the sender.
	@param message the text entered by the User that will be sent to the recipient.
	*/
	public void sendMail(User recipient, PrivateMessage message) {
		
	}

	/**
	Removes a message selected by the {@link facebook.User} from the array list of private message objects.	
	
	@param message the message that will be removed from the array list of private message objects.
	*/
	public void deleteMessage(PrivateMessage message) {

	}

	/**
	Saves the array list of private message objects in the {@link facebook.User}'s mailbox. The save method will store the contents of the User's mailbox using file i/o.

	*/
	private void save() {

	}

	/**
	Loads the array list of private message objects in the {@link facebook.User}'s mailbox. The load method will retrieve the contents of the User's mailbox using file i/o.
	*/

	public void load() {

	}
}
