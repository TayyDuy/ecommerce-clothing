package com.asm.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailInfor {
	String from;
	String to;
	String[] cc;
	String[] bcc;
	String subject;
	String body;
	MultipartFile[] attachments;
	
	public MailInfor(String to, String subject, String body) {
		this.from = "thanhtamngoc0944@gmail.com";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
}
