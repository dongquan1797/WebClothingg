/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tin.model;

/**
 *
 * @author Tin
 */
public class Manufacturer {
    private int manufacturerId;
    private String manufacturerName;
    private int nationId;
    Nation nation;

    public Manufacturer() {
    }

    public Manufacturer(int manufacturerId, String manufacturerName, int nationId, Nation nation) {
        this.manufacturerId = manufacturerId;
        this.manufacturerName = manufacturerName;
        this.nationId = nationId;
        this.nation = nation;
    }

    public int getManufacturerId() {
        return manufacturerId;
    }

    public void setManufacturerId(int manufacturerId) {
        this.manufacturerId = manufacturerId;
    }

    public String getManufacturerName() {
        return manufacturerName;
    }

    public void setManufacturerName(String manufacturerName) {
        this.manufacturerName = manufacturerName;
    }

    public int getNationId() {
        return nationId;
    }

    public void setNationId(int nationId) {
        this.nationId = nationId;
    }

    public Nation getNation() {
        return nation;
    }

    public void setNation(Nation nation) {
        this.nation = nation;
    }
    
}
