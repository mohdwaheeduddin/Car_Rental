package com.vcube.studentmanagement.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.vcube.studentmanagement.model.student;

public interface studentrepo extends JpaRepository<student,Integer>{
	
	

}
