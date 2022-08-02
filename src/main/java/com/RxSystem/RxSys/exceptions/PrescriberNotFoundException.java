package com.RxSystem.RxSys.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class PrescriberNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    public PrescriberNotFoundException() {
        super("Prescriber does not exist");
    }

}