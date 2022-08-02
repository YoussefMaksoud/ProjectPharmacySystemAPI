package com.RxSystem.RxSys.Controllers;


import com.RxSystem.RxSys.Entities.Drug;
import com.RxSystem.RxSys.Entities.Patient;
import com.RxSystem.RxSys.Entities.Prescriber;
import com.RxSystem.RxSys.RepositoryLayer.DrugRepository;
import com.RxSystem.RxSys.exceptions.DrugNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.servlet.tags.Param;

import java.net.URI;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/RXapp/drugs")
public class DrugController {



    @Autowired
    private JdbcTemplate jdbctemplate;

    private DrugRepository drugRepository;
    public DrugController(DrugRepository repository){
        this.drugRepository = repository;
    }

    /**
     * get all patients list
     *
     * @return the list
     */
    @GetMapping(path = "/all") // functions
    public List<Drug> getAllMeds(){
        return (List<Drug>) drugRepository.findAll();
    }

    @GetMapping(path = "/{DIN}") // functions
    public @ResponseBody Drug getDrug(@PathVariable String DIN){

        Optional<Drug> drug = drugRepository.findById(DIN);

        if(!drug.isPresent()){
            throw new DrugNotFoundException();
        }

        return drug.get();
    }

    //Writing the create method

    @PostMapping("/create")
    public void  createDrug(@RequestBody Drug drug) {
        Drug savedDrug = drugRepository.save(drug);
    }

    //Update method
    @PutMapping("/update/{id}")
    public void updateDrug(@RequestBody Drug drug, @PathVariable String id) {

        Optional<Drug> drugOptional = drugRepository.findById(id);

        if (!drugOptional.isPresent())
            throw new DrugNotFoundException();

        drug.setDIN(id);

        drugRepository.save(drug);
    }

    //Delete method // functions
    @DeleteMapping("/delete/{DIN}")
    public void deleteDrug(@PathVariable String DIN) {
        drugRepository.findById(DIN).orElseThrow(DrugNotFoundException::new);
        drugRepository.deleteById(DIN);
    }

    @GetMapping(path = "/supp/{name}")
    public @ResponseBody
    List<Drug> getManDrugs(@PathVariable(value = "name") String name){
        return jdbctemplate.query("select * from Drug AS d HAVING d.manufacturer = " + "'" + name + "'", (resultSet,i) -> {
            return toDrug(resultSet);
        });
    }

    private Drug toDrug(ResultSet r) throws SQLException{
        Drug d = new Drug();

        d.setScheduleNum(r.getInt(4));
        d.setPrice(r.getDouble(2));
        d.setPharmID(r.getInt(6));
        d.setName(r.getString(3));
        d.setManufacturer(r.getString(5));
        d.setDIN(r.getString(1));

        return d;

    }
}
