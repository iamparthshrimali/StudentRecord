<%@ page import="java.sql.*"%>

<%

    String selectedIDs[]=request.getParameter("selectedIDs").split(":");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
  
    for(String ID:selectedIDs)
    {
      String query="DELETE FROM STUDENT WHERE roll_no=?";
      PreparedStatement st=con.prepareStatement(query);
      st.setInt(1,Integer.parseInt(ID));
      st.executeUpdate();
    }

   

    
%>

<script>
  location.replace("./index.jsp")
</script>