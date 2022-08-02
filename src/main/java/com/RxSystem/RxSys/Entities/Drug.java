package com.RxSystem.RxSys.Entities;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.*;

@Entity
@Table(name = "DRUG")
@EntityListeners(AuditingEntityListener.class)
@CrossOrigin(origins = "http://localhost:3000")
public class Drug {

    @Id
    @Column(name = "DIN", nullable = false)
    private String DIN;

    @Column(name = "price", nullable = false)
    private double price;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "schednum", nullable = false)
    private int scheduleNum;

    @Column(name = "manufacturer", nullable = false)
    private String manufacturer;

    @Column(name = "pharmID", nullable = false)
    private int pharmID;

    public String getDIN() {
        return DIN;
    }

    public void setDIN(String DIN) {
        this.DIN = DIN;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getScheduleNum() {
        return scheduleNum;
    }

    public void setScheduleNum(int scheduleNum) {
        this.scheduleNum = scheduleNum;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getPharmID() {
        return pharmID;
    }

    public void setPharmID(int pharmID) {
        this.pharmID = pharmID;
    }

}
