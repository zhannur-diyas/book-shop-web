package zd.validator;

import zd.exception.ValidatorException;

/**
 * Zhannur Diyas
 * 3/26/2017 | 1:30 PM
 */
public interface Validator {
    public void validate(String username) throws ValidatorException;
}
