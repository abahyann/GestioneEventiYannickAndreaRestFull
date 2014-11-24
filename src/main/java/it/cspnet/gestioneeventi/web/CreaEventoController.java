package it.cspnet.gestioneeventi.web;

import it.cspnet.gestioneeventi.model.Evento;
import it.cspnet.gestioneeventi.model.Relatore;
import it.cspnet.gestioneeventi.servizi.ServiziEventi;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.Map;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
@Controller
public class CreaEventoController {

    @Autowired
    private ServiziEventi servizi;

    public void setServizi(ServiziEventi servizi) {
        this.servizi = servizi;
    }
    
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");
    binder.registerCustomEditor(Date.class, new CustomDateEditor(
            dateFormat, false));
    }

    @RequestMapping(value = "/vaiEvento")
    public String enterEvento(@ModelAttribute("registraEvento") Evento 
            eventoDaCreare, HttpServletRequest req) {
        Collection<Relatore> relatori = servizi.listaRelatori();
        if (relatori.isEmpty()) 
            req.setAttribute("msgCreaEventoError", "Non ci sono relatori!");
        else {
            Map<Long,String>  relatoriMap = new HashMap<Long, String>();
            for (Relatore r : relatori) 
                relatoriMap.put(r.getIdRelatore(), r.getNome() + " " 
                        + r.getCognome());
            req.setAttribute("listaRelatori",relatoriMap);
        }
        return "creaEvento";
    }
    
    @RequestMapping(value = "/creaEvento", method = RequestMethod.POST)
    public String registrazioneEvento(@ModelAttribute("registraEvento") Evento 
            eventoDaCreare, HttpServletRequest req) {
        System.out.println(eventoDaCreare.toString());
        servizi.creaEvento(eventoDaCreare);
        return "home";
    }
}
