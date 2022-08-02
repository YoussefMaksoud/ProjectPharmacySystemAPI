package com.RxSystem.RxSys.RepositoryLayer;

import com.RxSystem.RxSys.Entities.Prescriber;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PrescriberRepository extends CrudRepository<Prescriber, String> {}
