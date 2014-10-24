// UserRepository.java
package facebook;
import java.util.ArrayList;
import java.io.*;
import java.util.*;

/**
The UserRepository stores {@link facebook.User} objects in a hashtable. The UserRepository will only have one instance of the hashtable(UserRepository constructor is private, cannot be instantiated any where else). The UserRepository will have a counter that increments with the addition of each new {@link facebook.User}. 
@author Austin Wegner
*/
public class UserRepository {

	
	private Hashtable<String, User> users;
	private Hashtable<String, User> userEmails;
	private static UserRepository theInstance;
	private int counter = 0;
	
	/**
	Instantiates one and only one UserRepository object if none exist.
	@throws Exception cannot have more than one instance of the hashtable.
	*/
	public static synchronized UserRepository instance() throws Exception {
		if(theInstance == null){
			theInstance = new UserRepository();
			theInstance.bootstrap();
		}
		return theInstance;
	}
	private UserRepository() {
		users = new Hashtable<String, User>();
		userEmails = new Hashtable<String, User>();
	}

	/**
	Uses file i/o to load the Users back into the UserRepository.
	*/
	private void bootstrap() throws Exception {
		try {
		File dir = new File("/home/awegner/tomcat/webapps/facebook/files/user/");
		System.out.println("READ THE FILE DOG");
		File[] files = dir.listFiles();
		if(files != null) {
			for(File user : files) {
				BufferedReader br = new BufferedReader(new FileReader(user));
				br.readLine();
				String username = br.readLine();
				String password = br.readLine();
				String email = br.readLine();
				String photoName = br.readLine();
				String photoPath = br.readLine();
				String gender = br.readLine();
				String month = br.readLine();
				String day = br.readLine();
				String year = br.readLine();
				String interests = br.readLine();//interests
				String about = br.readLine();//about	
				br.readLine();
				System.out.println("READING SHIT IN DOGGG");
				User u = new User();
				u.setUsername(username);
				String name = u.getUsername();
				u.setPassword(password);
				u.setEmail(email);
				Photo photo = new Photo(photoName);
				photo.setPicture(photoPath);
				u.setPicturee(photo);
				u.setAbout(about);
				u.setInterests(interests);
				String mail = u.getEmail();
				users.put(username, u);
				userEmails.put(email, u);
				u.setGender(gender);
				u.setMonth(month);
				u.setDay(day);
				u.setYear(year);
				br.close();
				System.out.println("READING FILE");
			}
			for(User u : getAllUsers()) {
				u.load("/home/awegner/tomcat/webapps/facebook/files/user/" + u.getUsername() + ".user");
			}
			System.out.println("USER LOADED FINE");
		}
		}catch(Exception e) {
			System.out.println("Couldn't bootstrap nug");
			e.printStackTrace();
		}
	}
	
	/**
	Gets the {@link facebook.User} from the UserRepository. 
	@param username the User must exist in the UserRepository.
	@return returns the User associated with the username parameter.
	*/
	public User getUser(String username) {
		if(users.containsKey(username)){
			return users.get(username);
		}
		else{
			new Exception().printStackTrace();
			System.out.println(username + " is not a registered user.");
			return null;
		}	
	}

	public User getUserEmail(String email) {
		if(userEmails.containsKey(email)){
			return userEmails.get(email);
		}
		else{
			System.out.println("not a registered user.");
			return null;
		}
	}

	/**
	Creates a new {@link facebook.User} and adds it to the UserRepository. The username cannot already belong to an existing User in the UserRepository.
	@param username the username that will correspond to the newly created User. Cannot be an empty string.
	@param password the password that will correspond to the newly created User. Cannot be an empty string.
	@return will return a newly instantiated User.
	*/
	public User createNewUser(String email, String username, String password) {
		
		if(getUser(username)!=null){
			System.out.println(username + " has already been taken.");
			return null;
		}
		else{
			User user = new User(email, username, password);
			users.put(username, user);
			userEmails.put(email, user);
			String pName = "default";
			Photo profilePic = new Photo(pName);
			profilePic.setPicture("/facebook/images/default.png");
			user.setPicture(profilePic);
			return user;
		}
	}
	
	/**
	Gets all the Users existing in the UserRepository.
	@return returns a collection of {@link facebook.User} objects that exist in the UserRepository.
	*/
	public Collection<User> getAllUsers() {
		Collection<User> c = users.values();
		return c;
	}


}
