package br.ufc.great.sysadmin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.great.sysadmin.model.Role;
import br.ufc.great.sysadmin.model.Users;
import br.ufc.great.sysadmin.service.AuthoritiesService;
import br.ufc.great.sysadmin.service.UsersService;
import br.ufc.great.sysadmin.util.MySessionInfo;

/**
 * Faz o controle do domínio de Controle de Acesso
 * @author armandosoaressousa
 *
 */
@Controller
public class AccessControlController {
	
	private AuthoritiesService authoritiesService;
	private UsersService userService;
	private Users loginUser;
	
	@Autowired
	private MySessionInfo mySessionInfo;

	@Autowired
	public void setAuthoritiesService(AuthoritiesService authoritiesService) {
		this.authoritiesService = authoritiesService;
	}
	
    @Autowired
    public void setUserService(UsersService userService) {
    	this.userService = userService;
    }
	
	private void checkUser() {
		loginUser = mySessionInfo.getCurrentUser();
	}
	
	/**
	 * Lista os usuários e suas permissões
	 * @param model
	 * @return
	 */
    @RequestMapping(value="/accesscontrol", method = RequestMethod.GET)
    public String index(Model model) {
    	List<Role> authoritiesList = this.authoritiesService.getListAll();
    	
    	checkUser();
    	model.addAttribute("list", authoritiesList);
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());

        return "accesscontrol/list";
    }
    
    /**
     * Adiciona uma nova permissão a um usário existente
     * @param model
     * @return
     */
    @RequestMapping("/accesscontrol/add")
    public String add(Model model) {
    	checkUser();
    	
        model.addAttribute("access", new Role());        
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());

        return "accesscontrol/form";

    }

    /**
     * Edita as permissões de um usuário selecionado
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/accesscontrol/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
    	checkUser();
    	
        model.addAttribute("access", authoritiesService.get(id));        
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());

        return "accesscontrol/formEdit";

    }
    
    /**
     * Salva as permissões do usuário selecionado
     * @param authorities
     * @param authority
     * @param ra
     * @return
     */
    @RequestMapping(value = "/accesscontrol/save", method = RequestMethod.POST)
    public String save(Role authorities , @RequestParam("authority") String authority, final RedirectAttributes ra) {   	    	
    	authorities.setNome(authority);
    	Role save = authoritiesService.save(authorities);
    	ra.addFlashAttribute("successFlash", "Permissão salva com sucesso.");

    	return "redirect:/accesscontrol";	
    	
    }
	
}
