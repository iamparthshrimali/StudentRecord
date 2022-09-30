<%@ page import="java.sql.*"%>
<%
    int roll=Integer.parseInt((request.getParameter("id")));
    String fname="",lname="";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
    PreparedStatement st=con.prepareStatement("SELECT * FROM student WHERE roll_no=?");
    st.setInt(1,roll);
   ResultSet set=st.executeQuery();
   while(set.next())
   {
      fname=set.getString("fname");
      lname=set.getString("lname");
   }
%>
<html>
    <head>
        <link rel="stylesheet" href="css/add.css">
    </head>
</html>
<body>
   <div class="container" style="padding: 30px;">
        <h1> Modifying <%=fname%> <%=lname%> </h1>
        <div>
            <div>
               <form action="./modifyingIntoDatabase.jsp">
                  <label for="roll_no">Roll No: </label> <input type="number" id="roll_no" name="roll_no" >
                  <label for="fname">First Name: </label> <input type="text" id="fname" name="fname" >
                  <label for="lname">Last Name: </label> <input type="text" id="lname" name="lname" >
                  <input type="text" value="<%=roll%>" name="id">
                  <input type="submit" value="Modify" name="submit">
                  <input type="submit" value="Back" name="submit">
               </form>
            </div>
        </div>    
   </div>
</body>