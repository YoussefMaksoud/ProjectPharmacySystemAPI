package com.RxSystem.RxSys.RepositoryLayer;

import com.RxSystem.RxSys.Entities.Pharmacy;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PharmacyRepository extends CrudRepository<Pharmacy, String> {

}
