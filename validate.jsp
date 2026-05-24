<!DOCTYPE html>
<html lang="en">
<head>
    <title>Document</title>
</head>
<body>
    <%
    String username=request.getParameter("uname");
    String password=request.getParameter("pass");

    session.setAttribute("user",username);

    String sessionUser=(String)session.getAttribute("user");
    
    if(sessionUser.equals("password")){
        %>
        <h2 style="color:green;">Password and user matches</h2>

        <%
    }else{
        %>

        <h3 style="color:red;">password and user not matches</h3>
    <%
        }
    %>

</body>
</html>