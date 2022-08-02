package com.RxSystem.RxSys.Entities;


import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

@Entity
@Table(name = "Pharmacy")
@EntityListeners(AuditingEntityListener.class)
public class Pharmacy {

    @Id
    @Column(name = "id", nullable = false)
    private String id;

    @Column(name = "loc", nullable = false)
    private String loc;

    @Column(name = "name", nullable = false)
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLoc() {
        return loc;
    }

    public void setLoc(String loc) {
        this.loc = loc;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
