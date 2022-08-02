package com.RxSystem.RxSys.RepositoryLayer;

import com.RxSystem.RxSys.Entities.Drug;
import com.RxSystem.RxSys.Entities.Manufacturer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ManRepository extends CrudRepository<Manufacturer, String> {}
