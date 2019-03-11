package br.ufc.great.sysadmin.controller;

import java.security.Principal;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import br.ufc.great.sysadmin.model.MyStores;
import br.ufc.great.sysadmin.model.Store;
import br.ufc.great.sysadmin.model.Users;
import br.ufc.great.sysadmin.service.MyStoresService;
import br.ufc.great.sysadmin.service.StoresService;
import br.ufc.great.sysadmin.service.UsersService;
import br.ufc.great.sysadmin.util.MySessionInfo;

/**
 * Faz o controle do Dashboard
 * @author armandosoaressousa
 *
 */
@Controller
public class DashboardController {
	
	private UsersService userService;
	private StoresService storeService;	
	private MyStoresService myStoresService;
	private String acesso;
	
	@Autowired
	private MySessionInfo mySessionInfo;

	@Autowired
	public void setUserService(UsersService userService) {
		this.userService = userService;
	}
	
	@Autowired
	public void setStoreService(StoresService storeService) {
		this.storeService = storeService;
	}
	
	@Autowired
	public void setMyStoresService(MyStoresService myStoresService) {
		this.myStoresService = myStoresService;
	}

    @RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	/**
	 * Verifica quais são as permissões do usuário logado e direciona para o dashboard correto
	 * @param model
	 * @param principal
	 * @return
	 */
    @RequestMapping("/")
    public String index(Model model, Principal principal) {    
    	    
    	String servico="/dashboard";
    	
    	if (mySessionInfo.hasRole("ADMIN") && mySessionInfo.hasRole("USER") && mySessionInfo.hasRole("STOREOWNER")) {
    		servico = servico + "/admin";
    		return "redirect:"+servico;
    	}
    	if (mySessionInfo.hasRole("STOREOWNER") && mySessionInfo.hasRole("USER")) {
    		servico = servico + "/storeowner";
    		return "redirect:"+servico;
    	}
    	if (mySessionInfo.hasRole("USER")) {
    		servico = servico + "/user";
    		return "redirect:"+servico;
    	}
		return "redirec:/logout";    	           	    	
    }
    
    /**
     * Carrega o dashboard do usuário administrador do sistema
     * @param model
     * @param principal
     * @return
     */
    @RequestMapping("/dashboard/admin")
    public String indexAdmin(Model model, Principal principal) {
    	int totalUsers=0;
    	int totalStores=0;
    	
    	totalUsers = (int) this.userService.count();
    	totalStores = (int) this.storeService.count();
    	
    	Users loginUser = userService.getUserByUserName(mySessionInfo.getCurrentUser().getUsername());
    	
    	acesso = mySessionInfo.getAcesso();
    	    	
    	model.addAttribute("totalUsers", totalUsers);
    	model.addAttribute("totalStores", totalStores);
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
    	model.addAttribute("acesso", acesso);
    	     	
        return "dashboard/index";
    }
    
    /**
     * Carrega o dashboard do usuário comum
     * @param model
     * @param principal
     * @return
     */
    @RequestMapping("/dashboard/user")
    public String indexUser(Model model, Principal principal) {    	    	
    	int totalUsers = (int) this.userService.count();    	
    	Users loginUser = mySessionInfo.getCurrentUser();
    	    	
    	acesso = mySessionInfo.getAcesso();
    	
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
    	model.addAttribute("totalUsers", totalUsers);
    	model.addAttribute("acesso", acesso);
    	
        return "dashboard/indexUser";
    }

    /**
     * Carrega o dashboard do usuário lojista
     * @param model
     * @param principal
     * @return
     */
    @RequestMapping("/dashboard/storeowner")
    public String indexStoreOwner(Model model, Principal principal) {
    
    	Users loginUser = mySessionInfo.getCurrentUser();    	    	
    	int totalMyStores=0;    	
    	MyStores myStores = new MyStores();
    	List<Store> myStoresList = new LinkedList<Store>();    	
    	
    	myStores = this.myStoresService.getMyStoresByUser(loginUser);
    	
    	if (myStores != null) {
    		myStoresList = myStores.getStoreList();
    	}
    	totalMyStores = myStoresList.size();    	
    	    	    	
    	acesso = mySessionInfo.getAcesso();
        	
    	model.addAttribute("totalStores", totalMyStores);
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
    	model.addAttribute("acesso", acesso);
    	    	
        return "dashboard/indexStoreOwner";
    }
       
}