package com.khs.example.endpoints;

import java.util.Calendar;
import java.util.Date;

import com.khs.sherpa.annotation.Action;
import com.khs.sherpa.annotation.Encode;
import com.khs.sherpa.annotation.Endpoint;
import com.khs.sherpa.annotation.Param;

@Endpoint(authenticated=false)
public class TestService {

	class Result {	
		public Result(Object o) {
			result = o;
		}
		public Object result;		
	}
	
	
	
	// hello world  method
	@Action
	public Result helloWorld() {
		return new Result("Hello World Ladies");
	}
	
	// add two numbers method
	@Action
	public Result add(@Param("x_value") double x, @Param("y_value") double y) {
		return new Result(x + y);
	}
	
	@Action
	public Result diffDates(@Param("begin") Date begin,@Param("end") Date end) {
		
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(begin);
		
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(end);
		
		int diff = cal2.get(Calendar.DAY_OF_YEAR) - cal1.get(Calendar.DAY_OF_YEAR);
		return new Result("# days between dates = " + diff );
	
	}
	
	@Action
	public Result calendar(@Param("cal") Calendar cal) {
		return new Result(cal);
	}
	
	@Action
	public Result time(@Param(value="cal", format="hh:mm:ss a") Calendar cal) {
		return new Result(cal);
	}
	
	
	@Action
	public Result bool(@Param("bool") boolean bool) {
		
		return new Result("The Answer is "+(bool?"YES":"NO"));
		
	}
	

	@Action
	public Result encode(@Param(value="value",format=Encode.HTML) String value) {
		return new Result(value);
		
	}
	

	

}
