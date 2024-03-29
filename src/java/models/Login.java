/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Arrays;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

/**
 *
 * @author rilah
 */
public class Login {
    
    public byte[] generateSalt() throws NoSuchAlgorithmException  {
  
        SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
 
        byte[] salt = new byte[8];
        random.nextBytes(salt);
 
        return salt;
    }
    
    public byte[] getEncryptedPassword(String password, byte[] salt)
      throws NoSuchAlgorithmException, InvalidKeySpecException {
 
        String algorithm = "PBKDF2WithHmacSHA1";
  
        int derivedKeyLength = 160; 
        int iterations = 20000;
 
        KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, iterations, derivedKeyLength);
        SecretKeyFactory f = SecretKeyFactory.getInstance(algorithm);
 
        return f.generateSecret(spec).getEncoded();
    }
    
    public boolean authenticate(String attemptedPassword, byte[] encryptedPassword, byte[] salt)
      throws NoSuchAlgorithmException, InvalidKeySpecException {
     
        byte[] encryptedAttemptedPassword = getEncryptedPassword(attemptedPassword, salt);
 
        return Arrays.equals(encryptedPassword, encryptedAttemptedPassword);
    }
    
}
