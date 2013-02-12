package com.khs.example.endpoints;

import com.khs.example.endpoints.TestService.Result;
import com.khs.sherpa.annotation.Action;
import com.khs.sherpa.annotation.Endpoint;
import com.khs.sherpa.annotation.MethodRequest;
import com.khs.sherpa.annotation.Param;

@Endpoint(authenticated=false)
public class RestfulEndpoint {
		
	@Action(mapping = "/helloworld", method = MethodRequest.GET)
	public String helloWorld() {
		return "hello world";
	}
	
	// add two numbers method
	@Action(mapping = "/add/{x}/{y}", method = MethodRequest.GET)
	public Double add(@Param("x") double x, @Param("y") double y) {
			return new Double(x + y);
	}
	
}
