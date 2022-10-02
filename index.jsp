<html>
	<head>
		<link rel="stylesheet" href="./css/index.css" >
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
				<input type="submit" value="Insert" name="submit" onclick="return validateAdd()" class="btn" >
			  </div>
    <p id="error" style="display: none;">All fields are mandatory</p>

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
							<td>
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
			<form action="deleteSelected.jsp" method="get" onsubmit="return validate();">	
			      <input type="text" style="display:none;" name="selectedIDs">
			      <input type="submit" class="btn delete-btn" value="Delete" /> 			
		     </form>
			</table>
		</div>



<script>
 //function definaions

    let inputBox=document.querySelector(".inputBox");
	let isAnySingleCheckBoxChecked=false,isEveryElementChecked=true;
	let allCheckBox=document.querySelectorAll(".check_box");
	let selectAllCheckBox=document.querySelector(".selectAllCheckBox");
	let deleteBtn=document.querySelector(".delete-btn");

    let searchPara=document.querySelector(".inputWrapDiv p");
	
    inputBox.addEventListener("focus",()=>{
		searchPara.classList.add("active");
	})
	inputBox.addEventListener("focusout",()=>{
		searchPara.classList.remove("active");
		inputBox.value="";
		search();
	})
	
   let allRowsDiv=document.querySelectorAll(".row");

   const search=()=>{
	 
         allRowsDiv.forEach(row => {
			console.log(row.innerText);
			if(row.innerText.toLowerCase().includes(inputBox.value.toLowerCase()))
			{
				row.classList.remove("notactive");
			}
			else{
				row.classList.add("notactive");
			}
		 });
   }
inputBox.addEventListener("input",search);


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
				isAnySingleCheckBoxChecked=true;
	        else
				isEveryElementChecked=false;
		});
		deleteBtn.value= isEveryElementChecked ? "Delete All" : "Delete" ;
		deleteBtn.style.backgroundColor= isAnySingleCheckBoxChecked ? "red": "rgba(255,0,0,0.8)";
		selectAllCheckBox.checked= isEveryElementChecked ? true:false;
	}

    let selectedIDs=document.getElementsByName("selectedIDs");
    const validate=()=>
	{
	    let values="";	
		allCheckBox.forEach(checkBox => {
			if(checkBox.checked)
				values+=checkBox.value+":";
		});
	

		values=(values.substring(0,values.length-1));
		selectedIDs[0].value=values;
		return isAnySingleCheckBoxChecked;
	}

     let  roll_no=document.getElementsByName("add_roll_no");
     let fname=document.getElementsByName("add_fname")[0];
    let lname=document.getElementsByName("add_lname")[0];
    let error=document.getElementById("error");

	const validateAdd=()=>
    {
		    if(fname.value=="" || lname.value=="" || roll_no=="")
            {
                error.style.display="block";
                setTimeout(() => {
                    error.style.display="none";
                }, 5000);
                return false;
            }
            fname.value=fname.value.substring(0,1).toUpperCase()+fname.value.substring(1,fname.length).toLowerCase();
            lname.value=lname.value.substring(0,1).toUpperCase()+lname.value.substring(1,lname.length).toLowerCase();
		
            return true;

	}
	let addForm=document.querySelector(".addForm");
	let container=document.querySelector(".container");
    const addIsClicked=()=>
	{
		container.style.opacity="0.5";
		addForm.style.visibility="visible";
		
	}

   let closeBtn=document.querySelector(".close");
   closeBtn.addEventListener("click",()=>{
		addForm.style.visibility="hidden";
		container.style.opacity="1";
   })
</script>

    </body>

</html>

