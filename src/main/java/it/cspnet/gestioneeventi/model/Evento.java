package it.cspnet.gestioneeventi.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "EVENTI")
public class Evento implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID_EVENTO")
    private long idEvento;
    @Column(name = "TITOLO", length = 100, nullable = false)
    private String titolo;
    @Column(name = "DESCRIZIONE", length = 100, nullable = false)
    private String descrizione;
    @Column(name = "LOCATION", length = 30, nullable = false)
    private String location;
    @Column(name = "DATA_INIZIO", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataInizio;
    @Column(name = "DATA_FINE", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataFine;

    @ManyToOne
    @JoinColumn(name = "ID_RELATORE", nullable = false)
    private Relatore relatore;
    @ManyToMany
    @JoinTable(name = "PARTECIPANTI",
            joinColumns = @JoinColumn(name = "EVENTO"),
            inverseJoinColumns = @JoinColumn(name = "PARTECIPANTE"))
    private Set<Utente> utentiPartecipanti = new HashSet<Utente>();

    public Evento() {
    }

    public Evento(String titolo, String descrizione, String location, Date dataInizio, Date dataFine, Relatore relatore) {
        this.titolo = titolo;
        this.descrizione = descrizione;
        this.location = location;
        this.dataInizio = dataInizio;
        this.dataFine = dataFine;
        this.relatore = relatore;
    }

    public long getIdEvento() {
        return idEvento;
    }

    public void setIdEvento(long idEvento) {
        this.idEvento = idEvento;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getDataInizio() {
        return dataInizio;
    }

    public void setDataInizio(Date dataInizio) {
        this.dataInizio = dataInizio;
    }

    public Date getDataFine() {
        return dataFine;
    }

    public void setDataFine(Date dataFine) {
        this.dataFine = dataFine;
    }

    public Relatore getRelatore() {
        return relatore;
    }

    public void setRelatore(Relatore relatore) {
        this.relatore = relatore;
    }

    public Set<Utente> getUtentiPartecipanti() {
        return utentiPartecipanti;
    }

    public void setUtentiPartecipanti(Set<Utente> utentiPartecipanti) {
        this.utentiPartecipanti = utentiPartecipanti;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 13 * hash + (int) (this.idEvento ^ (this.idEvento >>> 32));
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Evento other = (Evento) obj;
        if (this.idEvento != other.idEvento) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Evento{" + "idEvento=" + idEvento + ", titolo=" + titolo + ", descrizione=" + descrizione + ", location=" + location + ", dataInizio=" + dataInizio + ", dataFine=" + dataFine + ", relatore=" + relatore + ", utentiPartecipanti=" + utentiPartecipanti + '}';
    }

}
