package web.gruppo16.tum4world;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;



public class Postino {
    public static boolean invia(String destinatario){
        final String mittente = "turn4world@gruppo16.it";
        final String password = "gruppo16";
        boolean successo = false;

        Properties properties = new Properties();
        properties.put("mail.smtp.host","localhost");
        properties.put("mail.smtp.auth", true);
        
        Session session = Session.getDefaultInstance(properties,new javax.mail.Authenticator(){
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mittente,password);
            }
        });

        try{
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(mittente));
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(destinatario));
            message.setSubject("Turn4World - Ricevuta richiesta");
            message.setText("Abbiamo ricevuto la sua richiesta, a breve la contatteremo per soddisfarla. -Turn4World");

            Transport.send(message);
            successo = true;
        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return successo;
    }
}
