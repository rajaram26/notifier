package virtusa.notifier.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import virtusa.notifier.model.RegisteredUser;
import virtusa.notifier.repo.UserRepo;

@Service
public class UserService{
	
	@Autowired
	UserRepo userrepositary;
	
	public void adduser(RegisteredUser user) {
		userrepositary.save(user);
	}
	
	public boolean checkUser(String email,String password) {
		RegisteredUser rs = userrepositary.findUser(email, password);
		if(rs.getEmail().equalsIgnoreCase(email)) {
			return true;
		}
		return false;
	}

	public String getUserId(String email) {
		String id=userrepositary.findId(email);
		return id;
	}

	public RegisteredUser findById(String user_id) {
		ArrayList<RegisteredUser> data = userrepositary.findByUserId(user_id);
		RegisteredUser d = data.get(0);
		return d;
	}

}
