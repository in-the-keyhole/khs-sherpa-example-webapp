package com.khs.example.endpoints;

import java.util.Calendar;
import java.util.Date;

import javax.xml.transform.Result;

import com.khs.sherpa.annotation.Encode;
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
	
	public Result diffDates(@Param(name="begin") Date begin,@Param(name="end") Date end) {
		
		Calendar cal1 = Calendar.getInstance();
		cal1.setTime(begin);
		
		Calendar cal2 = Calendar.getInstance();
		cal2.setTime(end);
		
		int diff = cal2.get(Calendar.DAY_OF_YEAR) - cal1.get(Calendar.DAY_OF_YEAR);
		return new Result("# days between dates = " + diff );
	
	}
	
	public Result calendar(@Param(name="cal") Calendar cal) {
		return new Result(cal);
	}
	
	public Result time(@Param(name="cal", format="hh:mm:ss a") Calendar cal) {
		return new Result(cal);
	}
	
	
	public Result bool(@Param(name="bool") boolean bool) {
		
		return new Result("The Answer is "+(bool?"YES":"NO"));
		
	}
	

	public Result encode(@Param(name="value") String value) {
		return new Result(value);
		
	}
	

	
	class Result {	
		public Result(Object o) {
			result = o;
		}
		public Object result;		
	}

}
