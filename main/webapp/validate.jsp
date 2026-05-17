<%@ page language="java" contentType="text/html" %>
<html>
<head>
    <title>Validation Page</title>
</head>
<body>
<%
    String username = request.getParameter("uname");
    String password = request.getParameter("pass");
    // Store username in session
    session.setAttribute("user", username);
    // Retrieve username from session
    String sessionUser = (String)session.getAttribute("user");
    if(sessionUser.equals(password)) { %>

    <h2 style="color:green;">
        Username matches with Password
    </h2>

    <% } else { %>

        <h2 style="color:red;">
            Username and Password do not match
        </h2>

    <% } %>

</body>

</html>