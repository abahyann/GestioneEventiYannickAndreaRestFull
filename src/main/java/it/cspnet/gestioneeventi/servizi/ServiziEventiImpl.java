package it.cspnet.gestioneeventi.servizi;

import it.cspnet.gestioneeventi.exception.IscrizioneGiaEffettuataException;
import it.cspnet.gestioneeventi.data.EventoDao;
import it.cspnet.gestioneeventi.data.RelatoreDao;
import it.cspnet.gestioneeventi.data.UtenteDao;
import it.cspnet.gestioneeventi.exception.ExistingUserException;
import it.cspnet.gestioneeventi.exception.UserNotFoundException;
import it.cspnet.gestioneeventi.exception.WrongPasswordException;
import it.cspnet.gestioneeventi.model.Evento;
import it.cspnet.gestioneeventi.model.Relatore;
import it.cspnet.gestioneeventi.model.Utente;
import java.util.Collection;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("servizi")
@Transactional
public class ServiziEventiImpl implements ServiziEventi {

    @Autowired
    private EventoDao eventoDao;

    @Autowired
    private UtenteDao utenteDao;

    @Autowired
    private RelatoreDao relatoreDao;

    public void setRelatoreDao(RelatoreDao relatoreDao) {
        this.relatoreDao = relatoreDao;
    }

    public void setEventoDao(EventoDao eventoDao) {
        this.eventoDao = eventoDao;
    }

    public void setUtenteDao(UtenteDao utenteDao) {
        this.utenteDao = utenteDao;
    }

    @Override
    public Collection<Evento> getListaEventiFuturi() throws Exception {
        return eventoDao.findByDataInizioAfter(new Date());
    }

    @Override
    public Collection<Evento> getEventiPassati() throws Exception {
        return eventoDao.findByDataInizioBefore(new Date());
    }

    @Override
    public void iscrizioneAdEvento(long idEvento, Utente utente) throws IscrizioneGiaEffettuataException {
        Evento eventoDaPrenotare = eventoDao.findOne(idEvento);
        if (eventoDaPrenotare.getUtentiPartecipanti().contains(utente)) {
            throw new IscrizioneGiaEffettuataException();
        } else {
            eventoDaPrenotare.getUtentiPartecipanti().add(utenteDao.findOne(utente.getUsername()));
            eventoDao.save(eventoDaPrenotare);
        }
    }

    @Override
    public void creaUtente(Utente utente) throws ExistingUserException, 
            Exception {
        if (utenteDao.exists(utente.getUsername()))
            throw new ExistingUserException();
        else 
            utenteDao.save(utente);
    }

    @Override
    public Utente verificaUtente(Utente utente) {
        Utente utenteDb = this.utenteDao.findOne(utente.getUsername());
        if (utenteDb == null)
            return null;
        
        return utenteDb;
    }

    public Relatore verificaRelatore(Relatore relatore) {
        Relatore relatoreDb = this.relatoreDao.findOne(relatore.getIdRelatore());
        if (relatoreDb == null) {
            return null;
        }
        return relatoreDb;
    }

    @Override
    public void creaRelatore(Relatore relatore) {
        this.relatoreDao.save(relatore);
    }

    public Evento verificaEvento(Evento evento) {
        Evento eventoDb = this.eventoDao.findOne(evento.getIdEvento());
        if (eventoDb == null) {
            return null;
        }
        return eventoDb;
    }

    @Override
    public Collection<Evento> listaPrenotazioni(String username) {
        Utente utente = utenteDao.findOne(username);
        return eventoDao.findByutentiPartecipantiAndDataInizioAfter(utente, new Date());
    }

    @Override
    public void annullaIscrizione(long idEvento, Utente utente) {
        Evento evento = eventoDao.findOne(idEvento);
        Utente u = utenteDao.findOne(utente.getUsername());
        evento.getUtentiPartecipanti().remove(u);
        eventoDao.save(evento);
    }

    @Override
    public Evento listaPartecipanti(long idEvento) {
        return eventoDao.findOne(idEvento);
    }

    public void creaEvento(Evento evento) {
        long idRelatore = evento.getRelatore().getIdRelatore();
        evento.setRelatore(relatoreDao.findOne(idRelatore));
        eventoDao.save(evento);
    }

    public Collection<Relatore> listaRelatori() {
        return this.relatoreDao.findAll();
    }

    public Relatore cercaRelatore(long parseLong) {
        return this.relatoreDao.findOne(parseLong);
    }

    @Override
    public Utente login(String userName, String password) throws
            UserNotFoundException, WrongPasswordException, Exception {
        Utente user = utenteDao.findOne(userName);
        if (user != null) {
            if (password.equals(user.getPassword())) {
                return user;
            } else {
                throw new WrongPasswordException();
            }
        } else {
            throw new UserNotFoundException();
        }
    }

}
