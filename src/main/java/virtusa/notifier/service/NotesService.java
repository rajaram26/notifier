package virtusa.notifier.service;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import virtusa.notifier.model.UserNotes;
import virtusa.notifier.repo.AddNotesRepo;

@Service
public class NotesService{
	
	@Autowired
	AddNotesRepo addnotes;
	
	
	public void addnote(String id,String email, String note_name, String start_date, String end_date, String rem_date,String description) {
		addnotes.save(new UserNotes(id,email,note_name,start_date,end_date,rem_date,description));
	}
	
	public ArrayList<UserNotes> findbyEmail(String email){
		ArrayList<UserNotes> notes = addnotes.findByEmail(email);
		return notes;
	}
	
	public void deleteNotes(String id) {
		addnotes.deleteById(id);
	}
	
	public UserNotes getByNameAndDesc(String id){
		ArrayList<UserNotes> notes = addnotes.getByNameAndDes(id);
		UserNotes temp = notes.get(0);
		return temp;
	}
}
