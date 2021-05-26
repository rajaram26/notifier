package virtusa.notifier.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import virtusa.notifier.model.RegisteredUser;
import virtusa.notifier.model.UserNotes;
import virtusa.notifier.service.NotesService;
import virtusa.notifier.service.UserService;

@Controller
public class NotifierController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private NotesService noteService;
	
	@RequestMapping("/login")
	public String login(HttpServletRequest req,HttpServletResponse res) {
		return "login";
	}
	
	
	@RequestMapping("/register")
	public String signup(HttpServletRequest req,HttpServletResponse res) {
		return "signup";
	}
	
	@PostMapping("/login")
	public String postlogin(HttpServletRequest req,HttpServletResponse res) {
		String id=req.getParameter("username")+String.valueOf(java.time.LocalDate.now());
		userService.adduser(new RegisteredUser(id,req.getParameter("username"),req.getParameter("email"),req.getParameter("mobile"),req.getParameter("password")));
		return "login";
	}
	
	@PostMapping("/dashboard")
	public String dashboard(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String email=req.getParameter("email");
		String pass=req.getParameter("password");
		String temp=email.substring(0,1).toUpperCase() + email.substring(1,email.indexOf("@"));
		HttpSession session = req.getSession();
		ArrayList<UserNotes> note = noteService.findbyEmail(email);
		ArrayList<UserNotes> remainder=new ArrayList<>();
		String date = String.valueOf(java.time.LocalDate.now());
		for(UserNotes x: note) {
			if(x.getRem_date().equals(date)) {
				remainder.add(x);
			}
		}
		if(userService.checkUser(email, pass)) {
			String user_id = userService.getUserId(email);
			session.setAttribute("email",temp);
			session.setAttribute("id",email);
			session.setAttribute("user_id", user_id);
			req.setAttribute("notes", note);
			req.setAttribute("remainder", remainder);
			return "dashboard";
		}	
		return "login";
		
	}
	
	@RequestMapping("/dashboard")
	public String Reqdashboard(HttpServletRequest req,HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		String email=(String) session.getAttribute("id");
		ArrayList<UserNotes> note = noteService.findbyEmail(email);
		ArrayList<UserNotes> remainder=new ArrayList<>();
		String date = String.valueOf(java.time.LocalDate.now());
		for(UserNotes x: note) {
			if(x.getRem_date().equals(date)) {
				remainder.add(x);
			}
		}
		  if(remainder.size()==0) { 
			  req.setAttribute("status", false);
		  }
		req.setAttribute("remainder", remainder);
		req.setAttribute("notes", note);
		return "dashboard";
		
	}
	
	@RequestMapping("/addnote")
	public String addnote(HttpServletRequest req,HttpServletResponse res) {
		return "addNote";
	}
	
	@PostMapping("/notes")
	public void allNotes(HttpServletRequest req,HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		String hours = String.valueOf(java.time.LocalTime.now().getHour());
		String min = String.valueOf(java.time.LocalTime.now().getMinute());
		String time = hours+":"+min;
		
		String id=(String) session.getAttribute("id")+time;
		String email=(String) session.getAttribute("id");
		String notes = req.getParameter("notes-name");
		String start = req.getParameter("start-date");
		String end = req.getParameter("end-date");
		String rem = req.getParameter("remainder-date");
		String des = req.getParameter("description");
		
		noteService.addnote(id,email,notes,start,end,rem,des);
		
		
		res.sendRedirect("/dashboard");
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session=req.getSession();
		session.invalidate();
		return "login";
	}
	
	@RequestMapping("/sample")
	public String sample(HttpServletRequest req,HttpServletResponse res) {
		return "displayNotes";
	}
	
	@PostMapping("/delete-note")
	public void deleteNotes(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String id = req.getParameter("note_id");
		noteService.deleteNotes(id);
		res.sendRedirect("/dashboard");
	}
	
	@PostMapping("/edit-notes")
	public String editNotes(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String id = req.getParameter("note_id");
		UserNotes edit_list = noteService.getByNameAndDesc(id);
//		System.out.print(edit_list);
//		res.sendRedirect("/dashboard");
		req.setAttribute("list", edit_list);
		req.setAttribute("id",id);
		return "addNote";
	}
	
	@PostMapping("/update-notes")
	public void updateNotes(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		String notes = req.getParameter("notes-name");
		String start = req.getParameter("start-date");
		String end = req.getParameter("end-date");
		String rem = req.getParameter("remainder-date");
		String des = req.getParameter("description");
		
		noteService.addnote(id, email, notes, start, end, rem, des);
		
		res.sendRedirect("/dashboard");
	}
	
	@PostMapping("/view-notes")
	public String viewNotes(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String id = req.getParameter("note_id");
		UserNotes edit_list = noteService.getByNameAndDesc(id);
		req.setAttribute("list", edit_list);
		req.setAttribute("id",id);
		return "viewNote";
	}
	
	@GetMapping("/edit-user")
	public String editUser(HttpServletRequest req,HttpServletResponse res,@RequestParam(name="id") String user_id) throws IOException{
		RegisteredUser data = userService.findById(user_id);
//		System.out.println(user_id+" "+data);
		req.setAttribute("id", user_id);
		req.setAttribute("data", data);
		return "updateUser";
	}
	
	@PostMapping("/update-user")
	public void updateuser(HttpServletRequest req,HttpServletResponse res) throws IOException {
		userService.adduser(new RegisteredUser(req.getParameter("id"),req.getParameter("username"),req.getParameter("email"),req.getParameter("mobile"),req.getParameter("password")));
		res.sendRedirect("/dashboard");
	}
	
}
