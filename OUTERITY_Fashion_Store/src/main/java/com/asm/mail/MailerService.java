package com.asm.mail;


import com.asm.model.MailInfor;

import jakarta.mail.MessagingException;

public interface MailerService {
	 // Gửi email
	void send(MailInfor mail) throws MessagingException;
	void send(String to, String subject, String body) throws MessagingException;
	 // Xếp mail vào hàng đợi 
	void queue(MailInfor mail); 
	void queue(String to, String subject, String body);
}
