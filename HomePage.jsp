<%@ include file="AuthorizedLogin.jsp"%>

<%@ page import = "java.util.*"%>

<br><br>
<center>
<fieldset style = "width:500px; height:500px">
<center><h4>Halo ~~<h4><center>

<%
String username = request.getParameter("username");
        out.println("Welcome to this page, " + String.valueOf(username) + "!");
%>
<br><Br>
<%
String ipAddress = request.getRemoteAddr();
        out.println("you are from : " + ipAddress);

%>

<br><br>
<Button><a href="AddInformations.jsp">Courses Management</a></Button>
<Button><a href="Email.jsp">Send Mail</a></Button>
<br><br>
<center><Button><a href="Logout.jsp">Logout</a></Button></center>
<br><br><br><br><br>

<%
java.util.Date today = new java.util.Date();
out.println("Today's date is: "+today);
%>

</fieldset>
</center>
