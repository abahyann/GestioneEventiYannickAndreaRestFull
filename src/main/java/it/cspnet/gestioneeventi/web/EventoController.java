package it.cspnet.gestioneeventi.web;

import it.cspnet.gestioneeventi.exception.IscrizioneGiaEffettuataException;
import it.cspnet.gestioneeventi.model.Evento;
import it.cspnet.gestioneeventi.model.Utente;
import it.cspnet.gestioneeventi.servizi.ServiziEventi;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.RequestContext;

@Controller
public class EventoController {

    @Autowired
    private ServiziEventi servizi;

    public void setServizi(ServiziEventi servizi) {
        this.servizi = servizi;
    }

    @RequestMapping(value = "/eventiPassati", method = RequestMethod.GET)
    public String getEventiPassati(HttpServletRequest req) {
        try {
            req.setAttribute("listaEventiPassati", servizi.getEventiPassati());
        } catch (Exception ex) {
            RequestContext ctx = new RequestContext(req);
            String messageFromBundle = ctx.getMessage("sitomanutenzione");
            req.setAttribute("msgEventiError", messageFromBundle);
        }
        return "listaeventi";
    }

    @RequestMapping(value = "/eventiFuturi", method = RequestMethod.GET)
    public String getEventifuturi(HttpServletRequest req) {

        try {
            req.setAttribute("listaEventiFuturi",
                    servizi.getListaEventiFuturi());
        } catch (Exception ex) {
            RequestContext ctx = new RequestContext(req);
            String messageFromBundle = ctx.getMessage("sitomanutenzione");
            req.setAttribute("msgEventiError", messageFromBundle);
        }
        return "listaeventi";
    }

    @RequestMapping(value = "/iscrizione", method = RequestMethod.GET)
    public String iscrizioneAdEvento(HttpServletRequest req) {
        long idEvento = Long.parseLong(req.getParameter("idEvento"));
        Utente utente = (Utente) req.getSession().getAttribute("user");
        try {
            servizi.iscrizioneAdEvento(idEvento, utente);
            RequestContext ctx = new RequestContext(req);
            String messageFromBundle = ctx.getMessage("iscrizione.successo");
            req.setAttribute("messaggioIscrizione", messageFromBundle);
        } catch (IscrizioneGiaEffettuataException ex) {
            RequestContext ctx = new RequestContext(req);
            String messageFromBundle = ctx.getMessage("iscrizione.giaiscritto");
            req.setAttribute("messaggioIscrizione", messageFromBundle);
        }
        return "forward:eventiFuturi.do";
    }

    @RequestMapping(value = "/visualizzaPartecipanti", method = RequestMethod.GET)
    public String listaPartecipanti(HttpServletRequest req) {
        long idEvento = Long.parseLong(req.getParameter("idEvento"));
        req.setAttribute("utentiPartecipanti", servizi.listaPartecipanti(idEvento).getUtentiPartecipanti());
        return "partecipanti";
    }

    @RequestMapping(value = "/listaPrenotazioni", method = RequestMethod.GET)
    public String listaPrenotazioni(HttpServletRequest req) {
        Utente utentiInDB = (Utente) req.getSession().getAttribute("user");
        Collection<Evento> eventiPrenotati = servizi.listaPrenotazioni(utentiInDB.getUsername());
        req.setAttribute("eventi", eventiPrenotati);
        return "listaprenotazioni";
    }

    @RequestMapping(value = "/annullaIscrizione", method = RequestMethod.GET)
    public String annullaIscrizione(HttpServletRequest req) {
        Utente utentiInDB = (Utente) req.getSession().getAttribute("user");
        long idEvento = Long.parseLong(req.getParameter("idEvento"));
        try {
            servizi.annullaIscrizione(idEvento, utentiInDB);
            RequestContext ctx = new RequestContext(req);
            String messageFromBundle = ctx.getMessage("iscrizione.cancellata");
            req.setAttribute("msgAnnullaIscrizione", messageFromBundle);
        } catch (Exception ex) {
            req.setAttribute("msgEventiError", "Sito in manutenzione: riprovare più tardi");
        }
        return "forward:listaPrenotazioni.do";
    }

}
