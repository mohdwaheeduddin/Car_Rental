package com.vcube.studentmanagement.controller;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.vcube.studentmanagement.model.confirmationform;
import com.vcube.studentmanagement.model.student;
import com.vcube.studentmanagement.repo.studentrepo;



@Controller
public class studentcontroller {
	
	@Autowired
    private	studentrepo sturepo;
	
	@GetMapping("/chupi")
	public String getindex(Model model) {
		List<student> stulist=sturepo.findAll();
		model.addAttribute("students",stulist);
		model.addAttribute("student",new student());
		model.addAttribute("confirmationform",new confirmationform());
		
		return "index";
	}

	
	@PostMapping("/create")
	public String newEmployee(student stud,Model model) {
		model.addAttribute("student",new student());
		
		int id=053;
		Random random=new Random();
		int randomnumber=1000+ random.nextInt(9000);
		id=id+randomnumber;
		stud.setId(id);
		
		sturepo.save(stud);
		
		return "redirect:/";
	}
	
	@PostMapping("/update")
	public String updateemployee(@ModelAttribute student stu,Model model) {
		model.addAttribute("student",new student());
		Optional<student>  existingstu=sturepo.findById(stu.getId());
		
		if(existingstu.isPresent()) {
			sturepo.save(stu);
			
		}
		else {
			model.addAttribute("errormessage" ,"employee with ID"+stu.getId());
		}
		
		return "redirect:/";
	}
	
	@PostMapping("/remove")
	public String removestu(student sturem,Model model) {
		model.addAttribute("student",new student());
		Optional<student> existingstu=sturepo.findById(sturem.getId());
		if(existingstu.isPresent()) {
			sturepo.deleteById(sturem.getId());
		}
	
	return "redirect:/index";
	}
	
	@PostMapping("/remove/all")
	public String removeALL(@ModelAttribute confirmationform confirmationform,Model model) {
		String confirmation=confirmationform.getConfirmation();
		if("yes".equalsIgnoreCase(confirmation)) {
			sturepo.deleteAll();
		}
		else {
			return "redirect:/";
		}
		return "redirect:/";
	}
}
