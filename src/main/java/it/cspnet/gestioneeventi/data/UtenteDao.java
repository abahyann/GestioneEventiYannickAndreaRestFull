package it.cspnet.gestioneeventi.data;

import it.cspnet.gestioneeventi.model.Utente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("utenteDao")
public interface UtenteDao extends JpaRepository<Utente, String> {

}
