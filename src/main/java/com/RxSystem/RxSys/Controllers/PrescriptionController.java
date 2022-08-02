package com.RxSystem.RxSys.Controllers;

import com.RxSystem.RxSys.Entities.Drug;
import com.RxSystem.RxSys.Entities.Patient;
import com.RxSystem.RxSys.Entities.Prescriber;
import com.RxSystem.RxSys.Entities.Prescription;
import com.RxSystem.RxSys.RepositoryLayer.PatientRepository;
import com.RxSystem.RxSys.RepositoryLayer.PrescriberRepository;
import com.RxSystem.RxSys.RepositoryLayer.PrescriptionRepository;
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
@RequestMapping(path = "/RXapp/prescriptions")
public class PrescriptionController {

    @Autowired
    private JdbcTemplate jdbctemplate;
    private PrescriptionRepository prescriptionRepository;


    public PrescriptionController(PrescriptionRepository repository){
        this.prescriptionRepository = repository;
    }

    @GetMapping(path = "/{healthcarenum}")
    public @ResponseBody
    List<Prescription> getPatientPrescriptions(@PathVariable(value = "healthcarenum") String healthcarenum){
        return jdbctemplate.query("select* from PRESCRIPTION WHERE patientID = " + healthcarenum, (resultSet,i) -> {
            return toPrescription(resultSet);
        });
    }

    private Prescription toPrescription(ResultSet r) throws SQLException{
        Prescription p = new Prescription();

        p.setRxNum(r.getString(1));
        p.setPtID(r.getString(2));
        p.setPrescriberID(r.getString(3));
        p.setPharmID(r.getString(4));
        p.setDIN(r.getString(5));

        return p;

    }

    //Writing the create method

    @PostMapping("/create")
    public void addPrescription(@RequestBody Prescription p) {
        if(PrescriberController.loggedInP == 2) {
            jdbctemplate.execute("INSERT INTO `RXDatabase`.`PRESCRIPTION` (`rxnum`, `patientID`, `prescriberID`, `pharmID`, `din`) VALUES ("
                    + p.getRxNum() + "," + p.getPtID() + "," + p.getPrescriberID() + "," + p.getPharmID() + "," + p.getDIN() + ");");
        }else{
            System.out.println("Not Authorized");
        }
    }

    /*//Update method
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
    }*/
}
