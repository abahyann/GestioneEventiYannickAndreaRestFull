/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package it.cspnet.gestioneeventi.RestFul;

/**
 *
 * @author corsojava
 */
class JsonRespost {
    private Object object;
    private String messaggio;

    public JsonRespost(Object object, String messaggio) {
        this.object = object;
        this.messaggio = messaggio;
    }

    public JsonRespost() {
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public String getMessaggio() {
        return messaggio;
    }

    public void setMessaggio(String messaggio) {
        this.messaggio = messaggio;
    }
    
}
