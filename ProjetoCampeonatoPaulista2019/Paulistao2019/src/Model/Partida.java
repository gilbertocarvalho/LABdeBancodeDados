package Model;

import java.time.LocalDate;

public class Partida {
    
    private String timeA;

    private String timeB;

    private LocalDate data;

    public String getTimeA() {
        return timeA;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public String getTimeB() {
        return timeB;
    }

    public void setTimeB(String timeB) {
        this.timeB = timeB;
    }

    public void setTimeA(String timeA) {
        this.timeA = timeA;
    }



}
