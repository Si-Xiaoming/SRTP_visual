package com.my.entity;

public class ChangeStruct {
    private String axis;
    private Double change;
    private Double sumchange;

    public ChangeStruct(String axis, Double change, Double sumchange) {
        this.axis = axis;
        this.change = change;
        this.sumchange = sumchange;
    }

    public String getAxis() {
        return axis;
    }

    public void setAxis(String axis) {
        this.axis = axis;
    }

    public Double getChange() {
        return change;
    }

    public void setChange(Double change) {
        this.change = change;
    }

    public Double getSumchange() {
        return sumchange;
    }

    public void setSumchange(Double sumchange) {
        this.sumchange = sumchange;
    }
}
