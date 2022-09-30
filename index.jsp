<html>
	<head>
		<link rel="stylesheet" href="./css/index.css" >
	</head>
	<body>

		<h1>Student Record</h1> 
		<%!
			int count=0;
			
		%>	
		<div class="container">
			<table border="1">
				<tr class="heading"> 
					<td>Roll NO</td>	<td>First Name</td>		<td>Last Name</td>
					      <td>
								<div style="display:flex;justify-content:center;">
									<form action="./add.html" method="post">
										<input type = "submit" value="ADD" class="btn add-btn">
									</form>
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
						<tr>
							<% 
								count= set.getInt("roll_no");
								initial++;
							%>
							<td>
								<%= set.getInt("roll_no") %>
							</td>
							<td>
								<%= set.getString("fname")%>
							</td>	
							 <td>
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
						
					<%   
					  }
					%>	
			<form action="deleteSelected.jsp" method="get" onsubmit="return validate();">	
			      <input type="text" style="display:none;" name="selectedIDs">
			      <input type="submit" class="btn delete-btn" value="Delete" /> 			
		     </form>
			</table>
		</div>



<script>
 //function definaions

	let isAnySingleCheckBoxChecked=false,isEveryElementChecked=true;
	let allCheckBox=document.querySelectorAll(".check_box");
	let selectAllCheckBox=document.querySelector(".selectAllCheckBox");
	let deleteBtn=document.querySelector(".delete-btn");
	const selectAll= ()=>{	
		Array.from(allCheckBox).forEach((checkBox)=>{
			checkBox.checked=selectAllCheckBox.checked ;
			isAnySingleCheckBoxChecked=selectAllCheckBox.checked;
		});
		if(!selectAllCheckBox.checked)
		{
			deleteBtn.style.backgroundColor="rgba(255,0,0,0.8)";
			deleteBtn.value="Delete";
		}
		else{
			deleteBtn.style.backgroundColor="red";
			deleteBtn.value="Delete all";
		}
	}
	const showDelete=(e)=>{
		  isAnySingleCheckBoxChecked=false;
          isEveryElementChecked=true;
		  allCheckBox.forEach((checkBox)=>{		
			if(checkBox.checked)
			{
				isAnySingleCheckBoxChecked=true;
			}
	        else{
				isEveryElementChecked=false;
			}
		});
		deleteBtn.value= isEveryElementChecked ? "Delete All" : "Delete" ;
		deleteBtn.style.backgroundColor= isAnySingleCheckBoxChecked ? "red": "rgba(255,0,0,0.8)";
		selectAllCheckBox.checked= isEveryElementChecked ? true:false;
	}

    let selectedIDs=document.getElementsByName("selectedIDs");
    const validate=()=>
	{
	    let values="";
		// let checkBoxArray=Array.form(allCheckBox);
		allCheckBox.forEach(checkBox => {
			if(checkBox.checked)
			{
				values+=checkBox.value+":";
			}
		});
	
		// isAnySingleCheckBoxChecked=false;
		values=(values.substring(0,values.length-1));
		selectedIDs[0].value=values;
		return isAnySingleCheckBoxChecked;
	}
  
</script>

    </body>

</html>

