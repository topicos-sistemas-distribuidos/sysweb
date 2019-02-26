package br.ufc.great.sysadmin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import br.ufc.great.sysadmin.model.Users;
import br.ufc.great.sysadmin.repository.IUsersRepository;

/**
 * Classe de serviço para consumir o repositório de dados de Usuário
 * @author armandosoaressousa
 *
 */
@Service
public class UsersService extends AbstractService<Users, Long>{

	@Autowired
	private IUsersRepository usersRepository;
	
	@Override
	protected JpaRepository<Users, Long> getRepository(){
		return usersRepository;
	}
	
	public Users getUserByUserName(String username) {
		return usersRepository.findByUsername(username);
	}
}
