<!-- 5)
Create a JSP page to accept a number from an user and display it in words: Example: 123 – One Two Three. The output should be in red color.  -->
<html>
<head>
    <title>Number In Words</title>
</head>
<body>

<h2>Convert Number Into Words</h2>

<form method="post">

    Enter Number: <input type="text" name="num" required>
    <input type="submit" value="Convert">
</form>

<%
    String number = request.getParameter("num");
    if(number != null)
    {
        String result = "";

        for(int i = 0; i < number.length(); i++)
        {
            char ch = number.charAt(i);

            switch(ch)
            {
                case '0':
                    result += " Zero ";
                    break;

                case '1':
                    result += " One ";
                    break;

                case '2':
                    result += " Two ";
                    break;

                case '3':
                    result += " Three ";
                    break;

                case '4':
                    result += " Four ";
                    break;

                case '5':
                    result += " Five ";
                    break;

                case '6':
                    result += " Six ";
                    break;

                case '7':
                    result += " Seven ";
                    break;

                case '8':
                    result += " Eight ";
                    break;

                case '9':
                    result += " Nine ";
                    break;

                default:
                    result += " Invalid ";
            }
        }
%>

<h3 style="color:red;">
    <%= result %>
</h3>
<%
    }
%>

</body>
</html>