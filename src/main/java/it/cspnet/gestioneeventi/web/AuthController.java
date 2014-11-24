package it.cspnet.gestioneeventi.web;

import it.cspnet.gestioneeventi.exception.ExistingUserException;
import it.cspnet.gestioneeventi.exception.UserNotFoundException;
import it.cspnet.gestioneeventi.exception.WrongPasswordException;
import it.cspnet.gestioneeventi.model.Utente;
import it.cspnet.gestioneeventi.servizi.ServiziEventi;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.RequestContext;

@Controller
public class AuthController {

    @Autowired
    private ServiziEventi servizi;

    public void setServizi(ServiziEventi servizi) {
        this.servizi = servizi;
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(@ModelAttribute("logInUtente") Utente logInUtente) {
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(@ModelAttribute("logInUtente") Utente logInUtente) {
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("logInUtente") Utente logInUtente,
            HttpServletRequest req) {
        try {
            req.getSession().setAttribute("user", servizi.login(
                    logInUtente.getUsername(), logInUtente.getPassword()));
            return "home";
        } catch (UserNotFoundException ex) {
            req.setAttribute("loginerrormsg", "Utente '" + logInUtente.getUsername() + "' non trovato!");
            return "index";
        } catch (WrongPasswordException ex) {
            req.setAttribute("loginerrormsg", "Nome utente o password errata!");
            return "index";
        } catch (Exception ex) {
            req.setAttribute("loginerrormsg", "Sito in manutenzione: riprovare più tardi");
            System.out.println(ex);
            return "index";
        }
    }

    @RequestMapping(value = "/registrazione", method = RequestMethod.GET)
    public String enterRegistrazione(@ModelAttribute("utenteRegistrati") Utente utente) {
        return "registrazione";
    }

    @RequestMapping(value = "/registrati", method = RequestMethod.POST)
    public String registrazioneUtente(@ModelAttribute("utenteRegistrati") Utente utente,
            HttpServletRequest req) {
        try {
            servizi.creaUtente(utente);
            return "redirect:index.do";
        } catch (ExistingUserException ex) {
            RequestContext ctx = new RequestContext(req);
            String messageFromBundle = ctx.getMessage("giaregistrato");
            req.setAttribute("registrazioneErrorMsg", utente.getUsername() + " " + messageFromBundle);
            return "registrazione";
        } catch (Exception ex) {
            RequestContext ctx = new RequestContext(req);
            String messageFromBundle = ctx.getMessage("sitomanutenzione");
            req.setAttribute("registrazioneErrorMsg", messageFromBundle);
            System.out.println(ex);
            return "registrazione";
        }

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest req) {
        req.getSession().invalidate();
        return "forward:index.do";
    }
}
