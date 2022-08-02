package com.RxSystem.RxSys.Entities;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.*;

@Entity
@Table(name = "PATIENT")
@EntityListeners(AuditingEntityListener.class)
@CrossOrigin(origins = "http://localhost:3000")
public class Patient {

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "dob", nullable = false)
    private String DOB;

    @Id
    @Column(name = "healthcarenum", nullable = false)
    private String healthcareNum;

    public Patient(String name, String dob, String healthcareNum) {
        this.name = name;
        this.DOB = dob;
        this.healthcareNum = healthcareNum;
    }

    public Patient(){}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDOB() {
        return DOB;
    }

    public void setDOB(String DOB) {
        this.DOB = DOB;
    }

    public String getHealthcareNum() {
        return healthcareNum;
    }

    public void setHealthcareNum(String healthcareNum) {
        this.healthcareNum = healthcareNum;
    }
}
