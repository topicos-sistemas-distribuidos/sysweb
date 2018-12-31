package br.ufc.great.sysadmin.util;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import br.ufc.great.sysadmin.model.Users;
import br.ufc.great.sysadmin.service.UsersService;

@Component
@Scope(value="session", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class MySessionInfo {

    private Users user;
	private UsersService userService;
	private String acesso;
	
	@Autowired
	public void setUserService(UsersService userServices){
		this.userService = userServices;
	}

    public Users getCurrentUser() {          	
    	if (user == null) {	
              	
        	User usuario = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        	
        	String name = usuario.getUsername();
        	user = userService.getUserByUserName(name);
        }
        return user;
    }
    
    /**
     * Checa se uma determinada regra existe na lista de permissoes do usuário logado
     * @param role
     * @return
     */
    public boolean hasRole(String role) {	
    	boolean hasRole = false;

    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) authentication.getAuthorities();

    	if (authorities != null) {  

    		for (GrantedAuthority authority : authorities) {
    			hasRole = authority.getAuthority().equals(role);
    			if (hasRole) {
    				break;
    			}
    		}

    		return hasRole;
    	}
    	else {
    		return false;
    	}
    }  
    
    /**
     * Verifica se o usuário logou como administrador
     */
    private String checkAccessControl() {
 	   if (hasRole("ADMIN")) {
 		   return acesso = "ADMIN";
 	   }else {
 		   return acesso = "";
 	   }
    }

	public String getAcesso() {
		return checkAccessControl();
	}
    
}