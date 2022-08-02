package com.RxSystem.RxSys.Controllers;

import com.RxSystem.RxSys.Entities.Drug;
import com.RxSystem.RxSys.Entities.InventoryList;
import com.RxSystem.RxSys.Entities.Prescription;
import com.RxSystem.RxSys.RepositoryLayer.DrugRepository;
import com.RxSystem.RxSys.exceptions.DrugNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/RXapp/Inv")
public class InvController {


    @Autowired
    private JdbcTemplate jdbctemplate;

    public InvController() {

    }

    @GetMapping(path = "/{sched}")
    public @ResponseBody
    List<InventoryList> getInvList(@PathVariable(value = "sched") String sched){
        return jdbctemplate.query("select d.din, d.name, i.pharmid, i.type, i.sched from Inventory AS i, Drug AS d WHERE d.schednum = i.sched AND i.sched = " + sched, (resultSet,i) -> {
            return toInvList(resultSet);
        });
    }

    private InventoryList toInvList(ResultSet r) throws SQLException{
        InventoryList l = new InventoryList();

        l.setDin(r.getString(1));
        l.setDrugName(r.getString(2));
        l.setPharmid(r.getInt(3));
        l.setPrice(r.getString(4));
        l.setSched(r.getInt(5));
        return l;

    }

}