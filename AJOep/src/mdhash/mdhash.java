package mdhash;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class mdhash {
	private String hashpass ="";
	
	public String getHashPass(String passWord) throws NoSuchAlgorithmException{
		 String plainText = passWord;
	        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
	        mdAlgorithm.update(plainText.getBytes());

	        byte[] digest = mdAlgorithm.digest();
	        StringBuffer hexString = new StringBuffer();

	        for (int i = 0; i < digest.length; i++) {
	            plainText = Integer.toHexString(0xFF & digest[i]);

	            if (plainText.length() < 2) {
	                plainText = "0" + plainText;
	            }

	            hexString.append(plainText);
	        }
	        hashpass = hexString.toString();

	        return hashpass;
	}
	
	
}