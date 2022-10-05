<html>
	<head>
		<link rel="stylesheet" href="./css/search.css">
		<link rel="stylesheet" href="./css/container.css" >
		<link rel="stylesheet" href="./css/form.css">
	</head>
	<body>
        
		 <form action="insertIntoDatabase.jsp" method="get" onsubmit="return validateAdd()" class="form">
		      <p class="close">X</p>
			  <p id="error"></p>
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
		 <form action="modify.jsp" method="get" onsubmit="return validateModify()" class="form modify-form">
	          <input type="text" name="modifyID" style="display:none">
			  <h3 class="modifyingWhom"></h2>
		      <p class="close close-modify">X</p>
			  <p class="error"></p>
	   		  <div style="display:flex;flex-direction:column;align-items:center;">
				<label for="roll_no">Roll No </label> <input type="number" id="roll_no" name="modify_roll_no"  class="addInput" >
			  </div>
			  <div style="display:flex;flex-direction:column;align-items:center;">
				<label for="fname">First Name </label> <input type="text" id="fname" name="modify_fname"  class="addInput">
			  </div>
			  <div style="display:flex;flex-direction:column;align-items:center;">

				<label for="lname">Last Name </label>
				   <input type="text" id="lname" name="modify_lname" class="addInput" >
			  </div>
			  <div>
				<input type="submit" value="Modify" name="submit"  class="btn" style="font-size:20px" >
			  </div>
    

			    <%-- <input type="submit" value="Back" name="submit" onclick="return validate(this)" class="btn"> --%>
		 </form>

		<h1>Student Record</h1> 
		<%!
			int count=0;
			String fname="";
			String lname="";
			
		%>	
	  <div class="inputWrapDiv">
			<div>
			<input type="text" class="inputBox"   />
				<p>Search<p>
			</div>
	  </div>
		<div class="container">
			<table >
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
								fname=set.getString("fname");
								lname=set.getString("lname");
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
									<%-- <form action="modify.jsp" method="post"> --%>
										<%-- <input type="text" name="id" style="display:none;" value=<%=count %> > --%>
										<input type = "submit" class="btn modify-btn" value="MODIFY" onclick="modify(<%=count%>,'<%=fname%>','<%=lname%>')">
									<%-- </form> --%>
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
	<script src="./scripts/Form.js"></script>
	<script>
	     const modify=(id,fname,lname)=>{
			 let roll_no=document.getElementsByName("modify_roll_no")[0];
			 let fnameForm=document.getElementsByName("modify_fname")[0];
			 let lnameForm=document.getElementsByName("modify_lname")[0];
			document.querySelector(".modify-form").style.visibility="visible";
			container.style.opacity="0.5";
			document.getElementsByName("modifyID")[0].value=id;
			document.querySelector(".modifyingWhom").innerText="Modifying "+fname+" "+lname;
            roll_no.value=id;
			fnameForm.value=fname;
			lnameForm.value=lname;

		 }
		 closeModify.addEventListener("click",()=>{
			document.querySelector(".modify-form").style.visibility="hidden";
			container.style.opacity="1";
		 })

		 const validateModify=()=>{
			 let id=document.getElementsByName("modifyID")[0].value;
			 let roll_no=document.getElementsByName("modify_roll_no")[0];
			 let fnameForm=document.getElementsByName("modify_fname")[0];
			 let lnameForm=document.getElementsByName("modify_lname")[0];
               if(fnameForm.value=="" || lnameForm.value=="" || roll_no.value=="")
				{
					modifyError.innerText="All fields are mandatory";
					modifyError.style.display="block";
					setTimeout(() => {
		               modifyError.style.display="none";
					}, 5000);
					return false;
				}
				let isIDExist=false;
				allRollNumbers.forEach(no=> {
					console.log(no.innerText,roll_no.value);
					if(no.innerText==roll_no.value && no.innerText!=id) 
					{
						modifyError.innerText="ID Exist with other student";
				     	modifyError.style.display="block";
						setTimeout(() => {
		                   modifyError.style.display="none";
					    }, 5000);
						isIDExist=true;
					}
				});
				if(!isIDExist)
				{
					fnameForm.value=fnameForm.value.substring(0,1).toUpperCase()+fnameForm.value.substring(1,fnameForm.length).toLowerCase();
					lnameForm.value=lnameForm.value.substring(0,1).toUpperCase()+lnameForm.value.substring(1,lnameForm.length).toLowerCase();
					return true;
				}
				return false;
		 }
	</script>
    </body>
	

</html>

