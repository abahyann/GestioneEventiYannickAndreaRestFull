package it.cspnet.gestioneeventi.RestFul;

import it.cspnet.gestioneeventi.web.*;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.RequestContext;

@Controller
public class Login {

    @Autowired
    private ServiziEventi servizi;

    public void setServizi(ServiziEventi servizi) {
        this.servizi = servizi;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public @ResponseBody JsonRespost login(@RequestBody Utente logInUtente ,HttpServletRequest req) {
        JsonRespost jsr = new JsonRespost();
        try {
            req.getSession().setAttribute("user", servizi.login(
            logInUtente.getUsername(), logInUtente.getPassword()));
             jsr.setMessaggio("ok");
             return jsr;
        } catch (UserNotFoundException ex) {
            jsr.setMessaggio( logInUtente.getUsername() + " non trovato!");
            return jsr;
        } catch (WrongPasswordException ex) {
            jsr.setMessaggio("nome utente o password errata");
            return jsr;
        } catch (Exception ex) {
            jsr.setMessaggio("sito in manutenzione");
            return jsr;
        }
    }

   

   
}
