//Photo.java
package facebook;
import java.util.*;

/**
A Photo object contains the information of an image that the user has uploaded. Each Photo object contains information of one image. It contains the Photo name which will be the path of the photo that is saved to disk. It contains the username of the uploader and the Date and time that the image was uploaded. The Photo object also contains the usernames of all the users that are {@link facebook.Photo#tag(User)}ed in the photo.
@author Abdullah Rahmanyar
*/
public class Photo {

	private String name;
	private String picture;
	private User uploader;
	private Date date;
	private ArrayList<User> taggedUsers;

	/**
	Constructor for creating new Photo Objects.
	*/
	public Photo(String n){
		name = n;
	}
	
	public String getName(){
		return name;
	}
	
	public String getPicture(){
		return picture;
	}	

	public void setPicture(String p){
		picture = p;
	}

	/**
	Adds the name of another user (different from the uploader of the picture) to the list of tagged users and it will also create a {@link facebook.Notification} object that will notify that other user of the tag. The person being tagged must be in the uploader's friends list.
	@param username the username of the User that the uploader wants to tag.
	@throws exception If the user is already logged in the photo.
	*/
	public void tag(User user){

	}

	/**
	Removes the user who is already a {@link facebook.Photo#tag(User)}ed user. The username that is being removed must be in the list of people that are tagged.
	@param username the username of the User that the uploader wants to remove/untag. 
	@throws Exception If the user is not tagged in the photo.
	*/
	public void untag(User user){

	}

}
