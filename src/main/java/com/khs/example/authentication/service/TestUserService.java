package com.khs.example.authentication.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.khs.sherpa.exception.SherpaInvalidUsernamePassword;
import com.khs.sherpa.json.service.UserService;

/** 
 * Example UserService implementation. Registered in sherpa.properties
 * and will be called to authenticate authenticated @Endpoints
 * 
 * In reality this implementation will engage a real user repo (i.e. LDAP,etc)
 * @author dpitt 
 * 
 * www.keyholesoftware.com
 *
 */

public class TestUserService implements UserService {

	public String[] authenticate(String userid, String password,HttpServletRequest request, HttpServletResponse response)
			throws SherpaInvalidUsernamePassword {
		// only valid userid password
		if ("dpitt".equals(userid) && "password".equals(password)) {
			return new String[]{"SHERPA_ADMIN"};
		}
		
		throw new SherpaInvalidUsernamePassword();
		
	}



}
