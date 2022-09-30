 <%@ page import="java.sql.*" %>

 
<%  

        String submit=request.getParameter("submit");
        boolean isIDExist=false;
        if(submit.equals("Insert"))
        {
            String  id=(request.getParameter("id"));
            String roll_no=(request.getParameter("roll_no"));
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            if(roll_no!="" &&  fname!="" && lname!="")
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");

                String query = "UPDATE student SET roll_no=?,fname=?,lname=? where roll_no= ?";
                PreparedStatement pstmt = con.prepareStatement(query);
                

                pstmt.setInt(1, Integer.parseInt(roll_no));
                pstmt.setString(2, fname);
                pstmt.setString(3, lname);
                pstmt.setString(4,id); 
             
                try{
                   pstmt.executeUpdate();
                }
                catch(Exception e)
                {
                  isIDExist=true;
                }
              

            }
            else
            {
              %>
              <script>
                  alert("All fields are mandatory");
                  location.replace("./add.html");
              </script>
           <% }
        }
        else
        {
          %>
              <script>
                location.replace("./index.jsp");
              </script>
          <%
        }
        
%>
<%
     if(!isIDExist)
     {
      %>
      <script>
           alert("Data inserteed successfully");

      </script>
  <%
     }
%>
  <%
    if(isIDExist)
    {
  %><script>alert("ID already exist")</script>
   <% }%>
%>
 <script>
  
    location.replace("./index.jsp");
 </script>
