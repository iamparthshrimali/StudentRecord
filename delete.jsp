<%@ page import="java.sql.*"%>
<%
    String id=request.getParameter("id");
    out.print(id);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
    Statement st=con.createStatement();
    String query="DELETE FROM STUDENT WHERE roll_no="+id;
    st.executeUpdate(query);

    
%>

<script>
  location.replace("./index.jsp")
</script>