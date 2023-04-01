package com.restless_hackaubg.exceptions;

public class AuthenticationFailureException extends RuntimeException {

    public AuthenticationFailureException(String message){
        super(message);
    }
}
