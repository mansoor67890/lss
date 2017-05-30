package org.lss.erp.daoValidUser;

import org.lss.erp.entity.User;
import org.springframework.stereotype.Component;

/**
 * @author Mansoor Ahmed
 * @version 1.0
 * 
 */

@Component
public interface ValidUserDao {
	public boolean isValidUser(String name, String pass);
	public User findByUserName(String username);
}
