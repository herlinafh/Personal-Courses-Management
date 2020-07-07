<%@ page import = "java.util.Properties"%>
<%@ page import = "javax.mail.*"%>
<%@ page import = "javax.mail.internet.*"%>
<%@ page import = "javax.activation.DataHandler"%>
<%@ page import = "javax.mail.Session"%>
<%@ page import = "java.util.Base64"%>

<%
        Object receiver = request.getParameter("receiver");
        Object subject = request.getParameter("subject");
        Object content = request.getParameter("content");

        if (receiver != null) {
                final String userName = "enter your email";
                final String password = "enter your password";

                Properties props = new Properties();

                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                props.put("mail.smtp.socketFactory.port", "465");

                Session se = Session.getInstance(props, new Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication () {
                                return new PasswordAuthentication (userName, password);
                                }
                });


                try {

                        MimeMessage message = new MimeMessage(se);
                        message.setReplyTo(InternetAddress.parse(receiver.toString()));
                        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver.toString(), false));
                        message.setSubject(subject.toString());
                        out.println(content.toString());

                        Multipart multipart = new MimeMultipart();

                        MimeBodyPart messageBodyPart = new MimeBodyPart ();
                        messageBodyPart.setContent(content.toString(), "text/html; charset=utf-8");
                        multipart.addBodyPart(messageBodyPart);

                        message.setContent(multipart);

                        Transport.send(message);
                } catch (MessagingException e) {
                        out.println(e.toString());
                }
                // response.sendRedirect("Newsletter.jsp;
                out.println("Mail has been sent");
        } else {
                out.println("Sender and Receiver columns should be filled.<BR>");
                }
%>
