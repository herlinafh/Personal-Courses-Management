<%@ include file="AuthorizedLogin.jsp"%>

<html>
<head><title></title></head>
<form action = "mailProcess.jsp">
<center><fieldset style = "width:700">
   <legend>Send Mail</legend>
   <table>
        <tr>
          <td> Receiver </td>
          <td><input type="email" name="receiver"/></td>
        </tr>
        <tr>
          <td> Subject </td>
          <td><input type="text" name="subject"/></td>
        </tr>
        <tr>
          <td> Content </td>
          <td><textarea rows="5" cols="60" name="content"/></textarea></td>
        </tr>
        <tr>
          <td> Attachment </td>
          <td><input type="file"  name="attachment"/></textarea></td>
        </tr>

        <tr>
          <td> </td>
          <td> <input type="submit"/></td>
        </tr>
   </table>
</fieldset></center>
</form>
