<%@ include file="AuthorizedLogin.jsp"%>

<html>
<head><title></title></head>
<body>
        <center><fieldset style = "width:700px"><legend>Course Management</legend>
        <form action='AddInformations.jsp'>
        <table align='center' border='0'>
             <br><tr><th colspan='2'>Add Course Informations</th></tr>
                <br>
                <table align='center' border='1'>
                    <tr>
                        <td>Name :</td>
                        <td><input type='text' name='name' required></td>
                    </tr>
                    <tr>
                        <td>Course :</td>
                        <td><input type='text' name='course' required></td>
                    </tr>
                    <tr>
                        <td>Email :</td>
                        <td><input type='text' name='email' required></td>
                    </tr>
        </table>
        <br></br><center><tr>
             <td><input type='submit' value='Add'/></td>
             <td><input type='reset' value='Clear'/></td>
        </center></tr>
        <br></br>


<%@ page import = "java.util.*"%>
<%@ page import = "java.io.*"%>
<%@ page import = "org.json.JSONObject"%>
<%@ page import = "org.json.JSONArray"%>
<table align='center' border = "1">
<%
        String name = request.getParameter("name");
        String course = request.getParameter("course");
        String email = request.getParameter("email");

        if (name != null && course != null && email != null) {
                if (course.equals(course)) {
                        String filePath = "/opt/tomcat/webapps/myproject/courses/" + String.valueOf(course) + ".json";
                        File file = new File(filePath);

                        if (!file.exists()) {
                           JSONObject jsonObj = new JSONObject();
                           Map<String, String> map = new HashMap<String, String>();
                           map.put("name", name);
                           map.put("email", email);
//                         map.put("course", course);

                           JSONArray jsonArray = new JSONArray();
                           jsonArray.put(map);
                           jsonObj.put(course, jsonArray);

                           FileWriter fileWriter = new FileWriter(filePath);
                           fileWriter.write(String.valueOf(jsonObj) + "\n");
                           fileWriter.close();
                           response.sendRedirect("/myproject/AddInformations.jsp");
                        } else {
	 BufferedReader br = new BufferedReader(new FileReader(file));
                                String jsonStr = br.readLine();
                                JSONObject jsonObj = new JSONObject(jsonStr);
                                JSONArray ja = new JSONArray();
                                ja = jsonObj.getJSONArray(course);
//                              out.println(ja);

                                Map<String, String> map = new HashMap<String, String>();
                                map.put("name", name);
                                map.put("email", email);
                                ja.put(map);
                                jsonObj = new JSONObject();
                                jsonObj.put(course, ja);

                                FileWriter fileWriter = new FileWriter(filePath);
                                fileWriter.write(String.valueOf(jsonObj) + "\n");
                                fileWriter.close();
                                response.sendRedirect("/myproject/AddInformations.jsp");
                        }

                }
        }
%>

<tr>
        <th width='200'>Name</th>
        <th width='200'>Course Name</th>
        <th width='200'>Email</th>
</tr>

<%
        String filePath = "/opt/tomcat/webapps/myproject/courses/" + String.valueOf(course) + ".json";
        File file = new File (filePath);
        if (file.exists()) {
                BufferedReader br = new BufferedReader(new FileReader(file));
                String jsonStr = br.readLine();
                JSONObject jsonObj = new JSONObject(jsonStr);

                if (String.valueOf(course).equals(jsonObj.get(course.replace(".json", "")))) {
                        session.setAttribute("ok", "1");
                        session.setAttribute("name", jsonObj.get("name"));
                        session.setAttribute("course", jsonObj.get("course"));
                        session.setAttribute("email", jsonObj.get("email"));
//                      response.sendRedirect("./AddInformations.jsp");
                } else {
                        session.setAttribute("ok", "0");
//                      response.sendRedirect("./AddInformations.jsp");
                        out.println("Input data failed, please try again!");
                }
        }

%>

<%

        String coursePath= "/opt/tomcat/webapps/myproject/courses/";
        File courseFile = new File(coursePath);
        String[] courseList;
        courseList = courseFile.list();

        for (String s: courseList) {
                file = new File(coursePath + "/" + s);
                BufferedReader br = new BufferedReader(new FileReader(file));
                String jsonStr = br.readLine();
                JSONObject jsonObj = new JSONObject(jsonStr);
                JSONArray ja = new JSONArray();
                ja = jsonObj.getJSONArray(s.replace(".json", ""));
                int jaLen = ja.length();
                for(int i = 0 ;i < jaLen; i++) {
                        jsonObj = ja.getJSONObject(i);
//                      out.println(jsonObj.getString("name"));
                        out.println("<tr>");
                        out.println("<td>" + jsonObj.getString("name") + "</td>");
                        out.println("<td>" + s.replace(".json", "") + "</td>");
                        out.println("<td>" + jsonObj.getString("email") + "</td>");
                        out.println("</tr>");
                }
        }
%>


        </form>
        </fieldset></center>
</body>
</html>

		
