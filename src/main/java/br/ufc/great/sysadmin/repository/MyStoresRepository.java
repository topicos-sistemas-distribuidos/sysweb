package br.ufc.great.sysadmin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.ufc.great.sysadmin.model.MyStores;
import br.ufc.great.sysadmin.model.Users;

@Repository
public interface MyStoresRepository extends JpaRepository<MyStores, Long> {
	MyStores findByUser(Users user);
}
