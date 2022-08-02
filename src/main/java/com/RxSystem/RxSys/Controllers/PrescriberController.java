package com.RxSystem.RxSys.Controllers;

import com.RxSystem.RxSys.Entities.Drug;
import com.RxSystem.RxSys.Entities.Patient;
import com.RxSystem.RxSys.Entities.Prescriber;
import com.RxSystem.RxSys.RepositoryLayer.PatientRepository;
import com.RxSystem.RxSys.RepositoryLayer.PrescriberRepository;
import com.RxSystem.RxSys.exceptions.PatientNotFoundException;
import com.RxSystem.RxSys.exceptions.PrescriberNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/RXapp/prescribers")
public class PrescriberController {



    @Autowired
    private JdbcTemplate jdbctemplate;

    private PrescriberRepository prescriberRepository;
    public PrescriberController(PrescriberRepository repository){
        this.prescriberRepository = repository;
    }
    public static int loggedInP = 0;

    /**
     * get all patients list
     *
     * @return the list
     */
    @GetMapping(path = "/all")
    List<Prescriber> getAllPrescribers(){
        return (List<Prescriber>) prescriberRepository.findAll();
    }

    @GetMapping(path = "/{serviceNum}")
    public Prescriber getPrescriber(@PathVariable String serviceNum){
        Optional<Prescriber> prescriber = prescriberRepository.findById(serviceNum);

        if(!prescriber.isPresent()){
            throw new PatientNotFoundException();
        }

        return prescriber.get();
    }

    @GetMapping(path = "/login/{serviceNum}")
    public Prescriber loginPrescriber(@PathVariable String serviceNum){
        Optional<Prescriber> prescriber = prescriberRepository.findById(serviceNum);

        if(!prescriber.isPresent()){
            throw new PatientNotFoundException();
        }


        if (prescriber.get().getType().compareTo("PHARM") == 0) {
            loggedInP = 2;
        } else if (prescriber.get().getType().compareTo("PA") == 0) {
            loggedInP = 1;
        } else {
            loggedInP = 0;
        }

        System.out.println(loggedInP);
        System.out.println(prescriber.get().getType());

        return prescriber.get();
    }

    private Prescriber toPrescriber(ResultSet r) throws SQLException {
        Prescriber p = new Prescriber();

        p.setServiceNum(r.getString(1));
        p.setName(r.getString(2));
        p.setType(r.getString(3));

        return p;

    }

    //Writing the create method

    @PostMapping("/create")
    public void addPrescriber(@RequestBody Prescriber prescriber) { prescriberRepository.save(prescriber);
    }

    //Update method
    @PutMapping("/update/{id}")
    public void updatePrescriber(@RequestBody Prescriber prescriber, @PathVariable String id) {

        Optional<Prescriber> prescriberOptional = prescriberRepository.findById(id);

        if (!prescriberOptional.isPresent())
            throw new PrescriberNotFoundException();

        prescriber.setServiceNum(id);

        prescriberRepository.save(prescriber);
    }

    //Delete method
    @DeleteMapping("/delete/{ServiceNum}")
    public void deletePrescriber(@PathVariable String ServiceNum) {
        prescriberRepository.findById(ServiceNum).orElseThrow(PrescriberNotFoundException::new);
        prescriberRepository.deleteById(ServiceNum);
    }
}
