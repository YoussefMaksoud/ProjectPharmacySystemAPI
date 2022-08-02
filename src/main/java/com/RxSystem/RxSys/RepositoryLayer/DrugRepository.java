package com.RxSystem.RxSys.RepositoryLayer;

import com.RxSystem.RxSys.Entities.Drug;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DrugRepository extends CrudRepository<Drug, String> {}
