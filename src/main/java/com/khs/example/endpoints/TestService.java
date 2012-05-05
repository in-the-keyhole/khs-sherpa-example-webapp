package com.khs.example.endpoints;

import com.khs.sherpa.annotation.Endpoint;
import com.khs.sherpa.annotation.Param;

@Endpoint(authenticated=false)
public class TestService {
	
	// hello world  method
	public Result helloWorld() {
		return new Result("Hello World");
	}
	
	// add two numbers method
	public Result add(@Param(name="x_value") double x, @Param(name="y_value") double y) {
		return new Result(x + y);
	}
		
	class Result {	
		public Result(Object o) {
			result = o;
		}
		public Object result;		
	}

}
