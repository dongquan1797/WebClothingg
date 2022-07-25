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
public class Nation {
    private int nationId;
    private String nationName;

    public Nation() {
    }

    public Nation(int nationId, String nationName) {
        this.nationId = nationId;
        this.nationName = nationName;
    }

    public int getNationId() {
        return nationId;
    }

    public void setNationId(int nationId) {
        this.nationId = nationId;
    }

    public String getNationName() {
        return nationName;
    }

    public void setNationName(String nationName) {
        this.nationName = nationName;
    }
    
}
