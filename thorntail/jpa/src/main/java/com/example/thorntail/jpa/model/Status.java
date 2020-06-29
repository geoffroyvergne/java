package com.example.thorntail.base.model;

public class Status {

    public Status(String value, int code) {
        this.value = value;
        this.code = code;
    }

    private String value;

    private int code;

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }
}
