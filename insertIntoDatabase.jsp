 <%@ page import="java.sql.*" %>

 
<%  
 
    String roll_no=(request.getParameter("add_roll_no"));
    String fname=request.getParameter("add_fname");
    String lname=request.getParameter("add_lname");
  
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");

    String query = "INSERT INTO student(roll_no, fname, lname) VALUES (?, ?, ?)";
    PreparedStatement pstmt = con.prepareStatement(query);
    
    pstmt.setInt(1, Integer.parseInt(roll_no));
    pstmt.setString(2, fname);
    pstmt.setString(3, lname);
    try{
        pstmt.executeUpdate();
    }
    catch(Exception e)
    {
        out.print("An error occured, please try again");
    }
%>



 <script>
    location.replace("./index.jsp");
 </script>
