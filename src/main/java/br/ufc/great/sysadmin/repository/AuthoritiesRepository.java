package br.ufc.great.sysadmin.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.ufc.great.sysadmin.model.Authorities;

@Repository
public interface AuthoritiesRepository extends JpaRepository<Authorities, Long>{

}
