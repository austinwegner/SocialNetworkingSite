//Status.java

package facebook;
import java.util.*;
/**
	A Status is a subclass of the Superclass {@link facebook.Post} but unlike Post which is used by one user to interact with another user, Status is a Post that a user addis to their own {@link facebook.Wall}. It contains the text of the Status, along with the author, and a list of all Comment objects associated with the Status object.
	@author Abdullah Rahmanyar
*/
public class Status extends Post{

	/**
	Constructor for creating new Status objects.
	@param text the text that the User wishes to display as their status.
	@throws IllegalArgumentException If incorrect type is passed.
	*/
	public Status(String text, User author){
		super(text, author);

	}
}

