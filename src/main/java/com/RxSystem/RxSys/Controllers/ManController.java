package com.RxSystem.RxSys.Controllers;

import com.RxSystem.RxSys.Entities.Drug;
import com.RxSystem.RxSys.Entities.Manufacturer;
import com.RxSystem.RxSys.RepositoryLayer.ManRepository;
import com.RxSystem.RxSys.exceptions.DrugNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "/RXapp/man")
public class ManController {



    @Autowired
    private JdbcTemplate jdbctemplate;

    private ManRepository manRepository;

    public ManController(ManRepository repository){
        this.manRepository = repository;
    }

    /**
     * get all patients list
     *
     * @return the list
     */
    @GetMapping(path = "/all") // functions
    public List<Manufacturer> getAllMan(){
        return (List<Manufacturer>) manRepository.findAll();
    }

    @GetMapping(path = "/{name}") // functions
    public @ResponseBody Manufacturer getDrug(@PathVariable String name){

        Optional<Manufacturer> drug = manRepository.findById(name);

        if(!drug.isPresent()){
            throw new DrugNotFoundException();
        }

        return drug.get();
    }

    //Writing the create method

    @PostMapping("/create")
    public void  createDrug(@RequestBody Manufacturer drug) {
        Manufacturer savedMan = manRepository.save(drug);
    }

}
