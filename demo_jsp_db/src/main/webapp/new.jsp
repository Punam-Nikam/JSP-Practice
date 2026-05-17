<!-- 4)
Write a JSP program to accept user name in a TextBox and greet the user according to the time on server machine.  -->

<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Greeting Program</title>
</head>
<body>
<h2>Greeting Application</h2>
<form method="post">
    Enter User Name:  <input type="text" name="uname" required>
    <input type="submit" value="Greet">
</form>
<%
    String name = request.getParameter("uname");
    if(name != null)
    {
        Calendar cal = Calendar.getInstance();
        int hour =cal.get(Calendar.HOUR_OF_DAY);
        String msg = "";
        if(hour < 12)
        {
            msg = "Good Morning";
        }
        else if(hour < 17)
        {
            msg = "Good Afternoon";
        }
        else if(hour < 21)
        {
            msg = "Good Evening";
        }

        else
        {
            msg = "Good Night";
        }

%>
<h3 style="color:blue;">
    <%= msg %>,
    <%= name %>
</h3>
<%
    }
%>
</body>
</html>
