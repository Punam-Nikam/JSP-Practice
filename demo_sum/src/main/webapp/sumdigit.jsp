<html>
    <title>
        Sum of Digits
    </title>
    <body>
        <h2>Sum of Digits</h2>
        <form method="get">
            Enter a number:
            <input type="text" name="number" required>
            <input type="submit" value="Calculate Sum of Digits">
        </form>
        <%
            String numberStr = request.getParameter("number");
            if (numberStr != null) {
                // Validate that the input is a valid integer
                int fdigit = Character.getNumericValue(numberStr.charAt(0));
                int ldigit = Character.getNumericValue(numberStr.charAt(numberStr.length() - 1));
                int sum = fdigit + ldigit;
        %>
            <h3 style="color: blue;">Sum of First and Last Digits: <%= sum %></h3>
            <%
            }
            %>
    </body>
</html>