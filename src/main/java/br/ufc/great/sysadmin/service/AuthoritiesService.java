package br.ufc.great.sysadmin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import br.ufc.great.sysadmin.model.Authorities;
import br.ufc.great.sysadmin.repository.AuthoritiesRepository;

@Service
public class AuthoritiesService extends AbstractService<Authorities, Long>{
	@Autowired
	private AuthoritiesRepository authoritiesRepository; 
	
	@Override
	protected JpaRepository<Authorities, Long> getRepository(){
		return authoritiesRepository;
	}

	/**
	 * Lista todas as permissões registradas
	 * @return List<Authorities> 
	 */
	public List<Authorities> getListAll() {
		return authoritiesRepository.findAll();
	}

}
