//GroupWall.java

package facebook;

import java.util.*;
	/**
	   A subclass of {@link facebook.Wall} that is created specifically for {@link facebook.Group} objects
	   to hold {@link facebook.Post} objects.
	
	   @author Austin Bouchard
	*/
public class GroupWall extends Wall{

	private ArrayList<Post> posts;
	private Group group;
	private User creator;
	/**
	   GroupWall constructor.
	   @param group the {@link facebook.Group} object that owns the GroupWall object.
	   @throws IllegalArgumentException if the parameter is not the correct type.
	*/
	GroupWall(Group group, User creator){
	}
	/**
	   Returns the {@link facebook.User} object that the GroupWall object belongs to.
	   @return a {@link facebook.Group} object.
	*/
	public Group getGroup(){
		return group;
	}

}
