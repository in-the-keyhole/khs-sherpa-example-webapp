package com.khs.example.endpoints;

import java.util.Calendar;
import java.util.Date;

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
	
	public Result addDays(@Param(name="date") Date date,@Param(name="days") int days) {
		
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(date);
		cal1.add(Calendar.DAY_OF_YEAR, days );
		return new Result((cal1.get(Calendar.MONTH)+1)+"-"+cal1.get(Calendar.DAY_OF_MONTH)+"-"+cal1.get(Calendar.YEAR));	
	}
	
	
		
	class Result {	
		public Result(Object o) {
			result = o;
		}
		public Object result;		
	}

}
