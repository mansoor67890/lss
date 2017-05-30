package org.lss.erp.dao.dao;

import java.util.List;

import org.lss.erp.entity.User;
import org.lss.erp.entity.UserRole;
import org.springframework.stereotype.Component;


/**
 * @author Mansoor Ahmed
 * @version 1.0
 * 
 */
@Component
public interface LoginDao {
	User findByUserName(String username);
	public User GetUserIdByName(String username);
	public List<UserRole> getUserRolesByName(String username);
}
