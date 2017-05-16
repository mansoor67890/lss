package org.lss.erp.daoValidUser;

import org.lss.erp.entity.User;
import org.springframework.stereotype.Component;

@Component
public interface ValidUserDao {
	public boolean isValidUser(String name, String pass);
	public User findByUserName(String username);
}
