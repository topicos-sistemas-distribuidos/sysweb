package br.ufc.great.sysadmin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Service;

import br.ufc.great.sysadmin.model.Store;
import br.ufc.great.sysadmin.repository.IStoresRepository;

/**
 * Class the manipulate the repository of Stores
 * @author armandosoaressousa
 *
 */
@Service
public class StoresService extends AbstractService<Store, Long>{
	@Autowired
	IStoresRepository storesRepository;
	
	//public PromotionArea globalPromotionArea = PromotionArea.getInstance();

	@Override
	protected JpaRepository<Store, Long> getRepository() {
		return storesRepository;
	}
	
}