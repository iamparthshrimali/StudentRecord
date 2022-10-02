
    inputBox.addEventListener("focus",()=>{
		searchPara.classList.add("active");
	})
	inputBox.addEventListener("focusout",()=>{
		searchPara.classList.remove("active");
		inputBox.value="";
		search();
	})
	

var search=()=>{
	 
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
