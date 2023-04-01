package com.restless_hackaubg.exceptions;

public class UserUnauthorizedOperationException extends RuntimeException{
    public UserUnauthorizedOperationException() {
        super("You cannot change other users content");
    }
}
