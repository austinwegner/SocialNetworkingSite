//Wall.java
package facebook;
import java.util.*;
import java.io.*;
/**
	An abstract class that holds and returns {@link facebook.Post} objects. Every {@link facebook.User} and
	{@link facebook.Group} has a wall in a one to one relationship.
*/
public class Wall{

	private int notification;
	private Hashtable<Integer, Post> notificationTable;
	private ArrayList<Post> posts;
	private User owner;

	protected Wall(User owner){
		init();
		this.owner = owner;
		save();
	}

	Wall(){
		init();
	}
	
	private void init(){
		posts = new ArrayList<Post>();
		notificationTable = new Hashtable<Integer, Post>();
	}	

	
	public User getOwner(){
		return owner;
	}

	public void setOwner(User owner){
		this.owner = owner;
	}
	/**
	   Returns an arraylist of {@link facebook.Post} objects that have been added to the wall's arraylist
	   'posts'.
	   @param owner the {@link facebook.User} object who owns the wall.
	   @throws IllegalArgumentException if the parameter is not passed or of the wrong type.
	   @return the arraylist of {@link facebook.Post} objects.
	*/
	public ArrayList<Post> getPosts(){
		return posts;
	}

	public int getNotif(){
		return notification;
	}
		
	public Collection<Post> getNotifications(){
		Collection<Post> c = notificationTable.values();
		return c;
	}
	
	public void resetNotification(){
		notificationTable.remove(notification);
		notification -= 1;
	}
	
	public void post(String message, User poster){
		Post p = new Post(message, poster);
		posts.add(p);
		notification += 1;
		notificationTable.put(notification,p);
		save();
	}
	public void deletePost(int index){
		posts.remove(index);
		save();
	}
	
	/**
	   Writes all posts in the wall objects arraylist of posts to disk.
	*/
	private void save(){
		try {
			PrintWriter pw = new PrintWriter(new FileWriter("/home/awegner/tomcat/webapps/facebook/files/wall/" + owner.getUsername() + ".wall"));
			pw.println("Wall Parameters");
			pw.println(owner.getUsername());
			System.out.println("owner: "+ owner.getUsername());
			pw.println("Posts");
			for(Post po : getPosts()){
				String poster = po.getAuthor().getUsername();
				pw.println(poster);
				pw.println(po.getText());
				pw.println(po.getDate().getTime());
			}
			pw.close();
		} catch(Exception e) {
			System.out.println("does not save wall");
			e.printStackTrace();
		}
	}
	
	public void load(String wallFilename) {
		try {
			System.out.println(wallFilename);
			File f = new File(wallFilename);
			BufferedReader br = new BufferedReader(new FileReader(f));
			br.readLine();//bullshit
			String sOwner = br.readLine();//owner
			User owner = UserRepository.instance().getUser(sOwner);
			setOwner(owner);
			System.out.println("Wall owner name: " + owner.getUsername());
			br.readLine();//posts
			String postLine = br.readLine();//post author
			System.out.println("post Author: " + postLine);
			while(postLine != null){
				String postText = br.readLine();//post text
				User up = UserRepository.instance().getUser(postLine);
				Post oldPost = new Post(postText, up);
				System.out.println("post created on wall");
				postLine = br.readLine();//date
				oldPost.setDate(new Long(postLine).longValue());
				posts.add(oldPost);
				System.out.println("arraylist of posts: " + posts.get(0));
				postLine = br.readLine();
			}
			br.close();
			System.out.println("IT IS FUCKING WORKING");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
