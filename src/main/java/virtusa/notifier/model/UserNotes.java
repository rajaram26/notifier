package virtusa.notifier.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_notes")
public class UserNotes {
	
	@Id
	String id;
	String email;
	String note_name;
	String start_date;
	String end_date;
	String rem_date;
	String description;
	
		
	public UserNotes(String id,String email, String note_name, String start_date, String end_date, String rem_date,String description) {
		super();
		this.id = id;
		this.email = email;
		this.note_name = note_name;
		this.start_date = start_date;
		this.end_date = end_date;
		this.rem_date = rem_date;
		this.description = description;
	}
	
	public UserNotes() {
		super();
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNote_name() {
		return note_name;
	}
	public void setNote_name(String note_name) {
		this.note_name = note_name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getRem_date() {
		return rem_date;
	}
	public void setRem_date(String rem_date) {
		this.rem_date = rem_date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Override
	public String toString() {
		return "UserNotes [email=" + email + ", note_name=" + note_name + ", start_date=" + start_date + ", end_date="
				+ end_date + ", rem_date=" + rem_date + ", description=" + description + "]";
	}

}
