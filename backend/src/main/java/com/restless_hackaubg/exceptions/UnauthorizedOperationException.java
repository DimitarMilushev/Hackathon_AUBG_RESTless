package com.restless_hackaubg.exceptions;

public class UnauthorizedOperationException extends RuntimeException{
    public UnauthorizedOperationException(String message) {
        super(message);
    }
}
