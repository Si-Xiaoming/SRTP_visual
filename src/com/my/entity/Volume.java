package com.my.entity;

import java.util.Date;

public class Volume {
    private String date;
    private Double change;
    private Double sumvolume;

    public Volume(String date, Double change, Double sumvolume) {
        this.date = date;
        this.change = change;
        this.sumvolume = sumvolume;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Double getChange() {
        return change;
    }

    public void setChange(Double change) {
        this.change = change;
    }

    public Double getSumvolume() {
        return sumvolume;
    }

    public void setSumvolume(Double sumvolume) {
        this.sumvolume = sumvolume;
    }
}
