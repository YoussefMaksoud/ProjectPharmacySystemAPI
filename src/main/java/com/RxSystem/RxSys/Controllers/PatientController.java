package com.RxSystem.RxSys.Controllers;

import com.RxSystem.RxSys.Entities.Patient;
import com.RxSystem.RxSys.Entities.Prescriber;
import com.RxSystem.RxSys.Entities.Prescription;
import com.RxSystem.RxSys.RepositoryLayer.PatientRepository;
import com.RxSystem.RxSys.RepositoryLayer.PrescriptionRepository;
import com.RxSystem.RxSys.exceptions.PatientNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/RXapp/patients")
@CrossOrigin(origins = "http://localhost:3000")
public class PatientController {



    @Autowired
    private PatientRepository patientRepository;
    private PrescriptionRepository rxRepository;
    private JdbcTemplate jdbcTemplate;


    public PatientController(PatientRepository repository, PrescriptionRepository p)
    {
        this.patientRepository = repository;
        this.rxRepository = p;
    }


    @GetMapping(path = "/all")
    public List<Patient> getAllPatients(){
        return (List<Patient>) patientRepository.findAll();
    }

    @GetMapping(path = "/{healthcarenum}")
    public @ResponseBody
    List<Prescription> getPatientPrescriptions(@PathVariable(value = "healthcarenum") String healthcarenum){
        return jdbcTemplate.query("select* from PRESCRIPTION WHERE patientID = " + healthcarenum, (resultSet,i) -> {
            return toPrescription(resultSet);
        });
    }

    private Patient toPatient(ResultSet r) throws SQLException{
        Patient p = new Patient();

        p.setName(r.getString(1));
        p.setDOB(r.getString(2));
        p.setHealthcareNum(r.getString(3));

        return p;

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

    //Create method

    @PostMapping("/create")
    @CrossOrigin(origins = "http://localhost:3000/NewPatient")
    public Patient addPatient(@RequestBody Patient patient) {
        return patientRepository.save(patient);
    }

    //Update method
    @PutMapping("/update/{id}")
    public void  updatePatient(@RequestBody Patient patient, @PathVariable String id) {

        Optional<Patient> patientOptional = patientRepository.findById(id);

        if (!patientOptional.isPresent())
            throw new PatientNotFoundException();

        patient.setHealthcareNum(id);

        patientRepository.save(patient);
    }

    //Delete method
    @DeleteMapping("/patients/delete/{HealthcareNum}")
    public void deletePatient(@PathVariable String HealthcareNum) {
        patientRepository.findById(HealthcareNum).orElseThrow(PatientNotFoundException::new);
        patientRepository.deleteById(HealthcareNum);
    }
}
