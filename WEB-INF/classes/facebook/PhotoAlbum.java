//PhotoAlbum.java
package facebook;
import java.util.*;

/**
A PhotoAlbum object holds a group of {@link facebook.Photo} objects that one user uploads. The PhotoAlbum object holds the Photo objects of one user. It provides methods for adding and removing Photo objects.
@author Abdullah Rahmanyar
*/
public class PhotoAlbum {

	private ArrayList<Photo> photos;

	/**
	Constructor for creating a PhotoAlbum object.
	*/
	public PhotoAlbum(){

	}
	
	/**
	Adds a Photo object User's list of photos.
	@param name the path to the photo that is saved on disk.
	*/
	public void addPhoto(String name){

	}

	/**
	Remove a Photo object from the User's list of photos. The Photo object that is being removed must exist in the User's list of photos. 
	@param name the name of the photo that is in User's list of photos.
	@throws Exception If the photoName is not in the list of photos.
	*/
	public void removePhoto(String photoName){

	}
}
