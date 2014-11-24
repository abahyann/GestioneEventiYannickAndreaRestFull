package it.cspnet.gestioneeventi.exception;

public class IscrizioneGiaEffettuataException extends Exception {

    public IscrizioneGiaEffettuataException() {
    }

    public IscrizioneGiaEffettuataException(String message) {
        super(message);
    }

    public IscrizioneGiaEffettuataException(String message, Throwable cause) {
        super(message, cause);
    }

    public IscrizioneGiaEffettuataException(Throwable cause) {
        super(cause);
    }

    public IscrizioneGiaEffettuataException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
