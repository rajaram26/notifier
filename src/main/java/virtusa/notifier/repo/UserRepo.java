package virtusa.notifier.repo;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;


import virtusa.notifier.model.RegisteredUser;

public interface UserRepo extends CrudRepository<RegisteredUser,String>{
	
	@Query(value="SELECT * FROM registered_user WHERE email=?1 and password=?2",nativeQuery = true)
	RegisteredUser findUser(String email,String password);
	
	@Query(value="SELECT id FROM registered_user WHERE email=?1",nativeQuery = true)
	String findId(String email);
	
	@Query(value="SELECT * FROM registered_user WHERE id=?1",nativeQuery = true)
	ArrayList<RegisteredUser> findByUserId(String user_id);
}
