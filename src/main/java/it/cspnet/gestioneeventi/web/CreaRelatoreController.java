package it.cspnet.gestioneeventi.web;

import it.cspnet.gestioneeventi.model.Relatore;
import it.cspnet.gestioneeventi.servizi.ServiziEventi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CreaRelatoreController {

    @Autowired
    private ServiziEventi servizi;

    public void setServizi(ServiziEventi servizi) {
        this.servizi = servizi;
    }

    @RequestMapping(value = "/creaRelatore")
    public String enterRegistrazione(@ModelAttribute("relatoreRegistrati") Relatore relatore) {
        return "creaRelatore";
    }

    @RequestMapping(value = "/crea", method = RequestMethod.POST)
    public String registrazioneRelatore(@ModelAttribute("relatoreRegistrati") Relatore relatore) {
        if (servizi.verificaRelatore(relatore) == null) {
            servizi.creaRelatore(relatore);
        }
        return "home";
    }
}
