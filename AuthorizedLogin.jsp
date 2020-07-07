<%
        Object  verify = session.getAttribute("verify");
        if (verify != "true") {
                response.sendRedirect("LoginPage.jsp?check=false");
        }
%>