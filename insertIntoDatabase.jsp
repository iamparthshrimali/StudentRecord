 <%@ page import="java.sql.*" %>

 
<%  

        String submit=request.getParameter("submit");
        boolean isIDExist=false;
    
            String roll_no=(request.getParameter("roll_no"));
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
         
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
                  isIDExist=true;
                }
%>
<%
     if(!isIDExist)
     {
      %>
      <script>
          
           alert("Data inserted successfully");
           
      </script>
  <%
     }
%>
  <%
    if(isIDExist)
    {
  %><script>alert("ID already exist")</script>
   <% }%>

 <script>
    location.replace("./index.jsp");
 </script>
