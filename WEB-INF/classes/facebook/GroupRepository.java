//GroupRepository.java
package facebook;
import java.io.*;
import java.util.*;

/**
The GroupRepository stores the Group objects in a hashtable. The GroupRepository will only have one instance of the hashtable(GroupRepository constructor is private, cannot be instantiated anywhere else). The GroupRepository will have a counter that increments with the addition of each new {@link facebook.Group}.

@author Austin Wegner
*/
public class GroupRepository {

	private static GroupRepository theInstance;
	private Hashtable<String, Group> groups;
	private int counter = 0;
	//private Group group;

	/**
	Instantiates one and only one GroupRepository object if none exist.
	@throws Exception cannot have more than one instance of the hashtable.
	*/
	public static GroupRepository instance() throws Exception {
		if(theInstance == null){
			theInstance = new GroupRepository();
	//		theInstance.bootstrap();
		}
		return theInstance;
	}
	/**
	A private constructor that cannot be called anywhere else but in the {@link facebook.GroupRepository (#instance)}.
	*/
	private GroupRepository(){
		groups = new Hashtable<String, Group>();
	}
	
	/**
	Uses file i/o to load the Groups back into the GroupRepository.
	*/
	private void bootstrap(){

	}
	
	/**
	Gets the {@link facebook.Group} from the GroupRepository.
	@param groupname the Group must exist in the GroupRepository
	@return returns the Group associated with the groupname parameter.
	*/
	public Group getGroup(String groupname) {
		if(groups.containsKey(groupname)){
			return groups.get(groupname);
		}
		else{
			new Exception().printStackTrace();
			System.out.println(groupname + " is not a registered group.");
			return null;
		}
	}
	
	/**
	Creates a new {@link facebook.Group} and adds it to the GroupRepository. The groupname cannot already belong to an existing Group in the GroupRepository.
	@param groupname the groupname that will correspond to the newly created Group. Cannot be an empty string.
	@return will return a newly instantiated Group.
	*/
	public Group createNewGroup(String groupname, User creator) {
		if(getGroup(groupname)!=null){
			System.out.println(groupname + " has already been taken.");
			return null;
		}
		else{
			Group group = new Group(groupname, creator);
			System.out.println("group created");
			groups.put(groupname, group);
			return group;
		}
	}
	
	/**
	Gets all the Groups existing in the GroupRepository.
	@return returns a collection of {@link facebook.Group} objects that exist in the GroupRepository.
	*/
	public Collection<Group> getAllGroups() {
		Collection<Group> c = groups.values();
		return c;
	}

}
