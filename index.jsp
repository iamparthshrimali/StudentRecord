<html>
	<head>
		<link rel="stylesheet" href="./css/search.css">
		<link rel="stylesheet" href="./css/container.css" >
		<link rel="stylesheet" href="./css/addForm.css">
	</head>
	<body>
        
		 <form action="insertIntoDatabase.jsp" method="get" onsubmit="return validateAdd()" class="addForm">
		      <p class="close">X</p>
			  <p id="error">All fileds are mamdatory</p>
	   		  <div style="display:flex;flex-direction:column;align-items:center;">
				<label for="roll_no">Roll No </label> <input type="number" id="roll_no" name="add_roll_no"  class="addInput" >
			  </div>
			  <div style="display:flex;flex-direction:column;align-items:center;">
				<label for="fname">First Name </label> <input type="text" id="fname" name="add_fname"  class="addInput">
			  </div>
			  <div style="display:flex;flex-direction:column;align-items:center;">

				<label for="lname">Last Name </label>
				   <input type="text" id="lname" name="add_lname" class="addInput" >
			  </div>
			  <div>
				<input type="submit" value="Add" name="submit"  class="btn" style="font-size:20px" >
			  </div>
    

			    <%-- <input type="submit" value="Back" name="submit" onclick="return validate(this)" class="btn"> --%>
		 </form>

		<h1>Student Record</h1> 
		<%!
			int count=0;
			
		%>	
	  <div class="inputWrapDiv">
			<div>
			<input type="text" class="inputBox"   />
				<p>Search<p>
			</div>
	  </div>
		<div class="container">
			<table border="1">
				<tr class="heading"> 
					<td>Roll NO</td>	<td>First Name</td>		<td>Last Name</td>
					      <td>
								<div style="display:flex;justify-content:center;">
									<%-- <form action="./add.html" method="post"> --%>
										<button  value="ADD" class="btn add-btn" onclick="addIsClicked()">ADD</button>
									<%-- </form> --%>
								</div>
							</td>
							<td> Select all<br> 
							      <input type="checkbox" name="checkAll" class="selectAllCheckBox"  onclick="selectAll()" value=<%=count %>>
							 </td>
				</tr>
		
					
				<%@ page import="java.sql.*"%>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students","root","");
					Statement st=con.createStatement();
					String query="SELECT * FROM student";
					ResultSet set=st.executeQuery(query);
					int initial=0;
                    
					while(set.next())
					{%>
					
					  <div>
						<tr class="row">
							<% 
								count= set.getInt("roll_no");
								initial++;
							%>
							<td class="unique">
								<%= set.getInt("roll_no") %>
							</td>
							<td >
								<%= set.getString("fname")%>
							</td>	
							 <td >
							 	<%= set.getString("lname")%>
							</td> 
							<td>
								<div style="display:flex;justify-content:center;">
									<form action="modify.jsp" method="post">
										<input type="text" name="id" style="display:none;" value=<%=count %> >
										<input type = "submit" class="btn modify-btn" value="MODIFY">
									</form>
								</div>
							</td>
							<td>		
									<input type="checkbox" name="checkBox"  class="check_box" onchange="showDelete(this)" value=<%= count %>>
								</div>					
							</td>
							
						</tr>
					 </div>
						
					<%   
					  }
					%>	
			<form action="deleteSelected.jsp" method="get" onsubmit="return validateDelete();">	
			      <input type="text" style="display:none;" name="selectedIDs">
			      <input type="submit" class="btn delete-btn" value="Delete" /> 			
		     </form>
			</table>
		</div>

    <script src="./scripts/declration.js"></script> <%-- DOM --%>
    <script src="./scripts/searchBox.js" ></script>
    <script src="./scripts/index.js"></script>
    <script src="./scripts/deleteForm.js"></script>
	<script src="./scripts/addForm.js"></script>
    </body>

</html>

