package com.RxSystem.RxSys.RepositoryLayer;

import com.RxSystem.RxSys.Entities.Patient;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PatientRepository extends CrudRepository<Patient, String> {}
