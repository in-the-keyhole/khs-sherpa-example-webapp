package com.khs.example.endpoints;

import java.util.ArrayList;
import java.util.List;

import com.khs.sherpa.annotation.Endpoint;

@Endpoint(authenticated=true)
public class AuthenticatedService {
	
	static class Department {
		public int number;
		public String name;		
	}
		
	public List<Department> departments() {
		
		List<Department>  results = new ArrayList<Department>();
		
		Department dept = new Department();
		dept.number = 100;
		dept.name = "IT";
		results.add(dept);
		
		dept = new Department();
		dept.number = 200;
		dept.name="QA";
		results.add(dept);
		
		return results;

		
	}
	

}
