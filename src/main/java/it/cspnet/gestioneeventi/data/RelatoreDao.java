package it.cspnet.gestioneeventi.data;

import it.cspnet.gestioneeventi.model.Relatore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("relatoreDao")
public interface RelatoreDao extends JpaRepository<Relatore, Long> {

}
