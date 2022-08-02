package com.RxSystem.RxSys.RepositoryLayer;

import com.RxSystem.RxSys.Entities.Prescription;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PrescriptionRepository extends CrudRepository <Prescription, String> {
}
