<%@ page import="java.sql.*" %>
<%@ page import="com.student.web.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Students</title>
</head>
<body>

<h2>Student Records</h2>

<table border="1">

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Course</th>
<th>Update</th>
<th>Delete</th>
</tr>

<%

try {

    Connection con = DBConnection.getConnection();

    PreparedStatement ps =
            con.prepareStatement("select * from student");

    ResultSet rs = ps.executeQuery();

    while(rs.next()) {

%>

<tr>

<td><%= rs.getInt(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>

<td>
<a href="update.jsp">Update</a>
</td>

<td>
<a href="delete?id=<%= rs.getInt(1) %>">
Delete
</a>
</td>

</tr>

<%

    }

} catch(Exception e) {
    out.println(e);
}

%>

</table>

<br><br>

<a href="index.jsp">Add New Student</a>

</body>
</html>