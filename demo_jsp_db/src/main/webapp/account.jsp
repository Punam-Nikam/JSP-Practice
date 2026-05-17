<!-- 3)Write a JSP program to accept the details of Account (ANo, Type, Bal) and store it into database and display it in tabular form 
Create Database Table: Open pgAdmin Query Tool and run:
CREATE TABLE account
(
ano INT PRIMARY KEY,
type VARCHAR(50),
bal DOUBLE PRECISION
); -->

<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Details</title>

    <style>
        table
        {
            border-collapse: collapse;
            width: 70%;
        }
        th, td
        {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th
        {
            background-color: lightgray;
        }
    </style>
</head>
<body>
<h2>Account Form</h2>
<form method="post">
    Account No: <input type="number" name="ano" required>
    <br><br>

    Account Type:<input type="text" name="type" required>
    <br><br>

    Balance:
    <input type="number" step="0.01" name="bal" required>
    <br><br>

    <input type="submit" value="Save">

</form>

<hr>

<%

Connection con = null;
PreparedStatement ps = null;
Statement stmt = null;
ResultSet rs = null;

try
{
    Class.forName("org.postgresql.Driver");

    con = DriverManager.getConnection(
    "jdbc:postgresql://localhost:5432/postgres",
    "postgres",
    "password");

    String ano = request.getParameter("ano");
    String type = request.getParameter("type");
    String bal = request.getParameter("bal");

    if(ano != null && type != null && bal != null)
    {
        String query = "INSERT INTO account VALUES(?,?,?)";
        ps = con.prepareStatement(query);
        ps.setInt(1, Integer.parseInt(ano));
        ps.setString(2, type);
        ps.setDouble(3, Double.parseDouble(bal));
        ps.executeUpdate();
        out.println("<h3 style='color:green'>");
        out.println("Record Inserted Successfully");
        out.println("</h3>");
    }
    stmt = con.createStatement();
    rs = stmt.executeQuery( "SELECT * FROM account");
%>
<h2>Account Details</h2>
<table>
<tr>
    <th>ANo</th>
    <th>Type</th>
    <th>Balance</th>
</tr>
<%
    while(rs.next())
    {
%>
<tr>
    <td><%= rs.getInt("ano") %></td>
    <td><%= rs.getString("type") %></td>
    <td><%= rs.getDouble("bal") %></td>
</tr>
<%
    }
%>
</table>
<%
}
catch(Exception e)
{
    out.println(e);
}
finally
{
    if(rs != null) rs.close();
    if(stmt != null) stmt.close();
    if(ps != null) ps.close();
    if(con != null) con.close();
}
%>
</body>
</html>
