///Login page(Data) validateion page

<%@ page language="java" contentType="text/html" %>
<html>
<head>
    <title>Validation Page</title>
</head>
<body>
<%
    String username = request.getParameter("uname");
    String password = request.getParameter("pass");

    session.setAttribute("user", username);

    String sessionUser = (String)session.getAttribute("user");
    if(sessionUser != null && sessionUser.equals(password))
    {
%>
<h2 style="color:green;">
    Username matches with Password
</h2>

<%
    }
    else
    {
%>
<h2 style="color:red;">
    Username and Password do not match
</h2>
<%
    }
%>
</body>
</html>
