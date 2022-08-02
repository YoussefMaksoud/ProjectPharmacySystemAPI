package com.RxSystem.RxSys.Entities;


import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name = "Manufacturer")
@EntityListeners(AuditingEntityListener.class)
public class Manufacturer {

    @Id
    @Column(name = "name")
    String name;

    @Column(name = "location")
    String location;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
