package it.cspnet.gestioneeventi.data;

import it.cspnet.gestioneeventi.model.Utente;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;
import it.cspnet.gestioneeventi.model.Evento;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository("eventoDao")
public interface EventoDao extends JpaRepository<Evento, Long> {

    public List<Evento> findByDataInizioBefore(Date data);

    public List<Evento> findByDataInizioAfter(Date oggi);

    List<Evento> findByutentiPartecipantiAndDataInizioAfter(Utente utente, Date dataDiConfronto);

}
