package br.ufc.great.sysadmin.controller;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.ufc.great.sysadmin.model.MyStores;
import br.ufc.great.sysadmin.model.Store;
import br.ufc.great.sysadmin.model.Users;
import br.ufc.great.sysadmin.service.MyStoresService;
import br.ufc.great.sysadmin.service.StoresService;
import br.ufc.great.sysadmin.service.UsersService;
import br.ufc.great.sysadmin.util.MySessionInfo;

@Controller
public class StoreController {

    private StoresService storeService;
	private UsersService userService;
	private Users loginUser; 
	private MyStoresService myStoresService;
    
	@Autowired
	private MySessionInfo mySessionInfo;
	
    @Autowired
    public void setStoreService(StoresService storeService) {
        this.storeService = storeService;
    }
    
    @Autowired
    public void setUserService(UsersService userService) {
    	this.userService = userService;
    }

	@Autowired
	public void setMyStoresService(MyStoresService myStoresService) {
		this.myStoresService = myStoresService;
	}

	private void checkUser() {
		loginUser = mySessionInfo.getCurrentUser();
	}
    
	/**
	 * Lista todas as lojas cadastradas
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "/stores")
    public String index(Model model) {
    	checkUser();
    	List<Store> list = storeService.getAll();    	
    	    	
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
    	model.addAttribute("list", list);
    	
        return "stores/list";
    }

    /**
     * Lista todas as lojas de forma paginada
     * @param pageNumber
     * @param model
     * @return
     */
    @RequestMapping(value = "/stores/{pageNumber}", method = RequestMethod.GET)
    public String list(@PathVariable Integer pageNumber, Model model) {
    	checkUser();
    	Page<Store> page = storeService.getList(pageNumber);
        int current = page.getNumber() + 1;
        int begin = Math.max(1, current - 5);
        int end = Math.min(begin + 10, page.getTotalPages());
        
        model.addAttribute("list", page);
        model.addAttribute("beginIndex", begin);
        model.addAttribute("endIndex", end);
        model.addAttribute("currentIndex", current);
        
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
    	
        return "stores/list";
    }
    
    /**
     * Cadastra uma nova loja
     * @param model
     * @return
     */
    @RequestMapping("/stores/add")
    public String add(Model model) {
    	checkUser();   
    	
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
        model.addAttribute("store", new Store());
        
        return "stores/form";

    }

    /**
     * Edita uma loja selecionada
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/stores/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
    	checkUser();
    	
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
    	
        model.addAttribute("store", storeService.get(id));
        
        return "stores/form";

    }

    /**
     * Salva uma nova loja
     * @param store
     * @param ra
     * @return
     */
    @RequestMapping(value = "/stores/save", method = RequestMethod.POST)
    public String save(Store store, final RedirectAttributes ra) {
    	
        Store save = storeService.save(store);
        ra.addFlashAttribute("successFlash", "Loja foi salva com sucesso.");
        
        return "redirect:/stores";

    }
    
    /**
     * Remove uma loja selecionada
     * @param id
     * @return
     */
    @RequestMapping("/stores/delete/{id}")
    public String delete(@PathVariable("id") Long id) {
        storeService.delete(id);
        return "redirect:/stores";
    }
    
    //mostrar um formulário para criar uma nova loja do usuário
    /**
     * Mostra o Formulário de nova loja do lojista 
     * @param model
     * @return
     */
    @RequestMapping("/stores/users/add")
    public String showFormNewUsersStore(Model model) {
    	checkUser();
    	
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
        model.addAttribute("store", new Store());
        
        return "stores/formMyStore";
    }
    
    //cria e salva uma nova loja de um usuário
    @RequestMapping(value="/stores/users/save", method = RequestMethod.POST)
    public String saveNewUsersStore(Store store, final RedirectAttributes ra) {
    	checkUser();
    	
    	//criar uma nova loja
        Store save = storeService.save(store);
    	
    	//Checa se já existe MyStores          
        MyStores myStore = this.myStoresService.getMyStoresByUser(loginUser);
        
        //se myStore nao existe cria um novo
        if (myStore == null) {
        	myStore = new MyStores();
        }
        myStore.setUser(loginUser);    
        myStore.addStore(store);
        
    	//salva a nova relação minhaLoja
        this.myStoresService.save(myStore);
    	ra.addFlashAttribute("successFlash", "Loja do lojista foi salva com sucesso.");
    	
    	String servico = "/stores/users/"+loginUser.getId();
    	
    	return "redirect:"+servico;
    }
    
    @RequestMapping(value = "/stores/users/{idUser}")
    public String StoresOfUser(Model model, @PathVariable("idUser") Long idUser) {
    	checkUser();    	    	
    	List<Store> myStoresList = new LinkedList<Store>();
    	MyStores myStore = new MyStores();
    	
    	Users user = this.userService.get(idUser);
		myStore = this.myStoresService.getMyStoresByUser(user); 
    	
		if (myStore != null) {
			myStoresList = myStore.getStoreList();
		}
		
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());
    	model.addAttribute("list", myStoresList);
    	
        return "stores/listStoresOfUser";
    }

    /**
     * Edita uma loja selecionada de um usuário
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/stores/users/{idUser}/edit/{idStore}")
    public String editUserStore(@PathVariable Long idUser, @PathVariable Long idStore, Model model) {
    	checkUser();
    	
    	model.addAttribute("loginusername", loginUser.getUsername());
    	model.addAttribute("loginemailuser", loginUser.getEmail());
    	model.addAttribute("loginuserid", loginUser.getId());    	
        model.addAttribute("store", storeService.get(idStore));
        
        return "stores/formStoreOfUser";

    }

    //cria e salva uma nova loja de um usuário
    @RequestMapping(value="/stores/users/save/edited", method = RequestMethod.POST)
    public String saveEditedUsersStore(Store store, final RedirectAttributes ra) {
    	checkUser();
    	
        Store save = storeService.save(store);
    	
        ra.addFlashAttribute("successFlash", "Loja do lojista foi salva com sucesso.");
    	
    	String servico = "/stores/users/"+loginUser.getId();
    	
    	return "redirect:"+servico;
    }

    /**
     * Remove uma loja selecionada do usuário
     * @param id
     * @return
     */
    @RequestMapping("/stores/users/{idUser}/delete/{idStore}")
    public String deleteStoreOfUser(@PathVariable("idUser") Long idUser, @PathVariable("idStore") Long idStore) {
        storeService.delete(idStore);
    	String servico = "/stores/users/"+idUser;
    	
    	return "redirect:"+servico;

    }
    
}