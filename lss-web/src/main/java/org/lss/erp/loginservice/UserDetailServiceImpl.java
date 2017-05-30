package org.lss.erp.loginservice;

import java.util.ArrayList;
import java.util.List;
import org.lss.erp.entity.UserRole;
import org.lss.erp.dao.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * @author Mansoor Ahmed
 * @version 1.0
 * 
 */

public class UserDetailServiceImpl implements UserDetailsService {

	@Autowired
	private LoginDao loginDao;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		org.lss.erp.entity.User user = loginDao.findByUserName(username);

		List<GrantedAuthority> authorities = buildUserAuthority(loginDao.getUserRolesByName(user.getEmail()));
		return buildUserForAuthentication(user, authorities);
	}

	private User buildUserForAuthentication( org.lss.erp.entity.User user,
			List<GrantedAuthority> authorities) {
		return new User(user.getEmail(), user.getPassword(), true, true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(List<UserRole> userRoles) {
		List<GrantedAuthority> setAuths = new ArrayList<GrantedAuthority>();
		// Build user's authorities
		for (UserRole userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRoles().getRole_name()));
		}
		
		return setAuths;
		
		//List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
		//return Result;
	}
}