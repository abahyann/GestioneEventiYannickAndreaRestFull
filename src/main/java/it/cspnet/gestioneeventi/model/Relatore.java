package it.cspnet.gestioneeventi.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "RELATORI")
public class Relatore implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID_RELATORE")
    private long idRelatore;
    @Column(name = "NOME", length = 20, nullable = false)
    private String nome;
    @Column(name = "COGNOME", length = 20, nullable = false)
    private String cognome;
    @Column(name = "TITOLO_STUDIO", length = 30, nullable = false)
    private String titoloStudio;
    @Column(name = "EMAIL", length = 50, nullable = false)
    private String email;
    @OneToMany(mappedBy = "relatore")
    private Set<Evento> eventi = new HashSet<Evento>();

    public Relatore() {
    }

    public long getIdRelatore() {
        return idRelatore;
    }

    public void setIdRelatore(long idRelatore) {
        this.idRelatore = idRelatore;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public String getTitoloStudio() {
        return titoloStudio;
    }

    public void setTitoloStudio(String titoloStudio) {
        this.titoloStudio = titoloStudio;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Set<Evento> getEventi() {
        return eventi;
    }

    public void setEventi(Set<Evento> eventi) {
        this.eventi = eventi;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 97 * hash + (int) (this.idRelatore ^ (this.idRelatore >>> 32));
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
        final Relatore other = (Relatore) obj;
        if (this.idRelatore != other.idRelatore) {
            return false;
        }
        return true;
    }

}
