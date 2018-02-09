<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con = DriverManager.getConnection("jdbc:sqlserver://ravindar-pc:1433;databaseName=INDEXCES_DB77",
    		"sa", "goanalytix@1");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into TEST_USER(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','"
    + lastName + "','" + email + "','" + userName + "','" + password + "', getdate())");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
        
    } else {
        response.sendRedirect("index.jsp");
    }
%>