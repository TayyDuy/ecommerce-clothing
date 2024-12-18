package com.asm.mail;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.asm.model.MailInfor;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailerServiceImpl implements MailerService {

	@Autowired
	JavaMailSender mailSender;

	List<MailInfor> list = new ArrayList();

	@Override
	public void send(MailInfor mail) throws MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

		helper.setFrom(mail.getFrom());
		helper.setTo(mail.getTo());
		helper.setSubject(mail.getSubject());
		helper.setText(mail.getBody(), true);

		if (mail.getCc() != null) {
			helper.setCc(mail.getCc());
		}
		if (mail.getBcc() != null) {
			helper.setBcc(mail.getBcc());
		}

		// Xử lý các tệp đính kèm
		if (mail.getAttachments() != null) {
			for (MultipartFile attachment : mail.getAttachments()) {
				helper.addAttachment(attachment.getOriginalFilename(), attachment);
			}
		}

		mailSender.send(message);

	}

	@Override
	public void send(String to, String subject, String body) throws MessagingException {
		this.send(new MailInfor(to, subject, body));
	}

	@Override
	public void queue(MailInfor mail) {
		list.add(mail);
	}

	@Override
	public void queue(String to, String subject, String body) {
		queue(new MailInfor(to, subject, body));
	}

	@Scheduled(fixedDelay = 5000)
	public void run() {
		while (!list.isEmpty()) {
			MailInfor mail = list.remove(0);
			try {
				this.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
