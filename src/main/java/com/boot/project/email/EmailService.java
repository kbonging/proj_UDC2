package com.boot.project.email;

import javax.mail.MessagingException;
import java.io.UnsupportedEncodingException;

public interface EmailService {
    public void sendEmail(String to, String subject, String text) throws MessagingException, UnsupportedEncodingException;
    public String createKey();
}
