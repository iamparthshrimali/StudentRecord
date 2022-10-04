<%@ page import="java.sql.*"%>
<%
    String id=request.getParameter("modifyID");
    out.print(id);
    String roll_no=request.getParameter("modify_roll_no");
    String fname=request.getParameter("modify_fname");
    String lname=request.getParameter("modify_lname");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
    PreparedStatement st=con.prepareStatement("UPDATE student SET roll_no=? WHERE roll_no=?");
    st.setString(1,roll_no);
    st.setString(2,id);

    st.executeUpdate();
    st=con.prepareStatement("UPDATE   student SET fname=? WHERE roll_no=?");
    st.setString(1,fname);
    st.setString(2,id);

    st.executeUpdate();
    st=con.prepareStatement("UPDATE   student SET lname=? WHERE roll_no=?");
    st.setString(1,lname);
    st.setString(2,id);

    st.executeUpdate();
  
%>


<script>
   location.replace("./index.jsp");
</script>