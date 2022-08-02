package com.RxSystem.RxSys.Entities;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@EntityListeners(AuditingEntityListener.class)
public class InventoryList {

    @Id
    @Column(name = "sched", nullable = false)
    private int sched;

    @Column(name = "type", nullable = false)
    private String price;

    @Column(name = "pharmid", nullable = false)
    private int pharmid;

    @Column(name = "name")
    private String drugName;

    @Column(name = "din")
    private String din;

    public int getSched() {
        return sched;
    }

    public void setSched(int sched) {
        this.sched = sched;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getPharmid() {
        return pharmid;
    }

    public void setPharmid(int pharmid) {
        this.pharmid = pharmid;
    }

    public String getDrugName() {
        return drugName;
    }

    public void setDrugName(String drugName) {
        this.drugName = drugName;
    }

    public String getDin() {
        return din;
    }

    public void setDin(String din) {
        this.din = din;
    }
}
