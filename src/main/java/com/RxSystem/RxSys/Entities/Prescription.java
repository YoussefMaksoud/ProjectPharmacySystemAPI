package com.RxSystem.RxSys.Entities;


import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name = "PATIENT")
@EntityListeners(AuditingEntityListener.class)
public class Prescription {

    @Id
    @Column(name = "rxnum", nullable = false)
    private String rxNum;

    @Column(name = "patientID", nullable = false)
    private String ptID;

    @Column(name = "prescriberID", nullable = false)
    private String prescriberID;

    @Column(name = "pharmID", nullable = false)
    private String pharmID;

    @Column(name = "din", nullable = false)
    private String DIN;

    public String getRxNum() {
        return rxNum;
    }

    public void setRxNum(String rxNum) {
        this.rxNum = rxNum;
    }

    public String getPtID() {
        return ptID;
    }

    public void setPtID(String ptID) {
        this.ptID = ptID;
    }

    public String getPrescriberID() {
        return prescriberID;
    }

    public void setPrescriberID(String prescriberID) {
        this.prescriberID = prescriberID;
    }

    public String getPharmID() {
        return pharmID;
    }

    public void setPharmID(String pharmID) {
        this.pharmID = pharmID;
    }

    public String getDIN() {
        return DIN;
    }

    public void setDIN(String DIN) {
        this.DIN = DIN;
    }



}
