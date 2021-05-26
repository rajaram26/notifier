package virtusa.notifier.repo;

import java.util.ArrayList;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import virtusa.notifier.model.UserNotes;

@Transactional
@Repository
public interface AddNotesRepo extends CrudRepository<UserNotes, String>{
	
	@Query(value="SELECT * FROM user_notes WHERE email=?1",nativeQuery = true)
	ArrayList<UserNotes> findByEmail(String email);
	
	
	@Modifying
	@Query(value="DELETE FROM user_notes WHERE note_name=?1 AND description=?2",nativeQuery = true)
	void deleteNotes(String note_name,String desc);
	
	
	@Query(value="SELECT * FROM user_notes WHERE id=?1",nativeQuery = true)
	ArrayList<UserNotes> getByNameAndDes(String id);
	
}
