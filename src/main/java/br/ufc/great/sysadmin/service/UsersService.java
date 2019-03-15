package br.ufc.great.sysadmin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.ufc.great.sysadmin.model.Person;
import br.ufc.great.sysadmin.model.Users;
import br.ufc.great.sysadmin.repository.IUsersRepository;

/**
 * Classe de serviço para consumir o repositório de dados de Usuário
 * @author armandosoaressousa
 *
 */
@Service
public class UsersService extends AbstractService<Users, Long> implements UserDetailsService {

	@Autowired
	private IUsersRepository usersRepository;
	
	@Override
	protected JpaRepository<Users, Long> getRepository(){
		return usersRepository;
	}
	
	/**
	 * Busca um usuario pelo seu username
	 * @param username do usuario
	 * @return usuario
	 */
	public Users getUserByUserName(String username) {
		return usersRepository.findByUsername(username);
	}
	
	/**
	 * Busca um usuario pelo seu email
	 * @param email do usuario
	 * @return usuario 
	 */
	public Users getUserByEmail(String email) {
		return usersRepository.findByEmail(email);
	}
	
	/**
	 * Find a user by Person
	 * @param person Person
	 * @return User
	 */
	public Users getUserByPerson(Person person) {
		return usersRepository.findByPerson(person);
	}

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		Users usuario = usersRepository.findByUsername(userName);
		
		if (usuario == null) {
			throw new UsernameNotFoundException("O usuário " + userName + " não foi encontrado");
		}
		
		return (UserDetails) usuario;
	}
	
}