<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");   
    String password = request.getParameter("password");
    System.out.println(userName + "---"+password);
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    Connection con = DriverManager.getConnection("jdbc:sqlserver://ravindar-pc:1433;databaseName=INDEXCES_DB77",
            "sa", "goanalytix@1");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from TEST_USER where userName='" + userName + "' and password='" +password + "'");
    System.out.println("select * from TEST_USER where userName='" + userName + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>