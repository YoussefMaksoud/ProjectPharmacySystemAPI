package com.RxSystem.RxSys.Controllers;

import com.RxSystem.RxSys.Entities.Drug;
import com.RxSystem.RxSys.Entities.Patient;
import com.RxSystem.RxSys.Entities.Pharmacy;
import com.RxSystem.RxSys.Entities.Prescriber;
import com.RxSystem.RxSys.RepositoryLayer.DrugRepository;
import com.RxSystem.RxSys.RepositoryLayer.PharmacyRepository;
import com.RxSystem.RxSys.exceptions.DrugNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/RXapp/pharm")
public class PharmacyController {



    @Autowired
    private JdbcTemplate jdbctemplate;

    private PharmacyRepository pharmacyRepository;

    public PharmacyController(PharmacyRepository repository){
        this.pharmacyRepository = repository;
    }

    /**
     * get all patients list
     *
     * @return the list
     */
    @GetMapping(path = "/all") // functions
    public List<Pharmacy> getAllPharms(){
        return (List<Pharmacy>) pharmacyRepository.findAll();
    }

    @GetMapping(path = "/{id}") // functions
    public @ResponseBody Pharmacy getPharm(@PathVariable String id){

        Optional<Pharmacy> pharm = pharmacyRepository.findById(id);

        if(!pharm.isPresent()){
            throw new DrugNotFoundException();
        }

        return pharm.get();
    }

    //Writing the create method

    @PostMapping("/create")
    public void  createPharm(@RequestBody Pharmacy pharm) {
        Pharmacy savedPharm = pharmacyRepository.save(pharm);
    }

}
