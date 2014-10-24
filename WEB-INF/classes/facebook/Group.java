//Group.java

package facebook;
import java.io.*;
import java.util.*;

/**
	A Group is an object instantiated by a {@link facebook.User} object that holds a 
	list of {@link facebook.User} objects that can interact with each other on a
	{@link facebook.GroupWall} by creating {@link facebook.Post} objects. Members of the group
	are invited by the User who creates the Group object. Only members of the group are allowed to
	view the GroupWall.

	@author The A Team
*/
public class Group{

	private String groupname;
	private String about;
	private ArrayList<User> members = new ArrayList<User>();
	private ArrayList<Post> posts = new ArrayList<Post>();	
	private User creator;
	private Photo profilePicture;
	private Wall wall;

	public void setPicture(Photo p){
		profilePicture = p;
	}
	public Photo getPicture(){
		return profilePicture;
	}
	public User getCreator(){
		return creator;
	}
	public String getName(){
		return groupname;
	}
	/**
	   Constructor for creating a Group object.
	   @param groupname a String that refers to the Group object that must not already exist 
	   in the {@link facebook.GroupRepository}.
	   @param creator the {@link facebook.User} object who created the group.
	   @throws IllegalArgumentException if the parameter is not passed or is not the correct type.
	*/
	public Group(String groupname, User creator){
		this.groupname = groupname;
		this.creator = creator;
	}

	/**
	   Adds each {@link facebook.User} object from the parameter to the members ArrayList.
	   @param al an ArrayList of User objects.
	   @throws IllegalArgumentException if the parameter is not passed or is not the correct type.
	*/
	public void invite(User u){
		members.add(u);
	}
	
	public void setAbout(String about){
		this.about = about;
	}
	public String getAbout(){
		return about;
	}

	/**
	   Removes a {@link facebook.User} from the members ArrayList. 
	   @param user a {@link facebook.User} object.
	   @throws IllegalArgumentException if the parameter is not passed or is not the correct type.
	*/
	public void leave(User user){
		if(members.contains(user)){
			members.remove(user);
		}
	}

	/** 
	   Returns an ArrayList of {@link facebook.User} objects that are in the members ArrayList.
	   @return an ArrayList of {@link facebook.User} objects.
	*/
	public ArrayList<User> getMembers(){
		return members;
	}
	
	/**
	   Instantiates a {@link facebook.Post} object that includes text a {@link facebook.User} has entered 
	   and the author.
	   @param message the text String of the {@link facebook.Post} object.
	   @param author the user who created the {@link facebook.Post} object.
	   @throws IllegalArgumentException if the parameter is not passed or is not the correct type.
	*/
	public void post(String message, User author){
		Post post = new Post(message, author);
		posts.add(post);
	}

	/**
	   Writes group information to disk. Writes members of group to disk and groupname.
	*/
	private void save(){
	}

	/**
	   loads .group files from disk and hydrates Group objects.
	*/
	private void load(){
	}

}
