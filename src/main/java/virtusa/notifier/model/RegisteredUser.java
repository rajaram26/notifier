package virtusa.notifier.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="registered_user")
public class RegisteredUser {
	
	@Id
	String id;
	String username;
	String email;
	String mobile;
	String password;
	
	
	public RegisteredUser(String id,String username, String email, String mobile, String password) {
		super();
		this.id=id;
		this.username = username;
		this.email = email;
		this.mobile = mobile;
		this.password = password;
	}
	
	
	
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public RegisteredUser() {
		super();
		// TODO Auto-generated constructor stub
	}



	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "RegisteredUser [username=" + username + ", email=" + email + ", mobile=" + mobile + ", password="
				+ password + "]";
	}
	
	
}
