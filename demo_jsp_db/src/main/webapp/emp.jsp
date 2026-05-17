<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Employee Database</title>
</head>
<body>
<form method="post">

    Employee ID :
    <input type="text" name="id" required />
    <br><br>
    Employee Name :
    <input type="text" name="ename" required />
    <br><br>

    <input type="submit" value="SAVE" />
</form>
<%
try
{
    Class.forName("org.postgresql.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:postgresql://127.0.0.1:5432/employee","postgres","Password");

    String id = request.getParameter("id");
    String empname = request.getParameter("ename");

    if(id != null && empname != null)
    {
        PreparedStatement ps = con.prepareStatement("insert into emp(emp_id, emp_name) values(?,?)");

        ps.setInt(1, Integer.parseInt(id));
        ps.setString(2, empname);

        ps.executeUpdate();

        out.println("Record inserted");
    }
    con.close();
}
catch(Exception e)
{
    out.println(e);
}

%>

</body>
</html>