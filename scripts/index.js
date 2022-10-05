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

const addIsClicked=()=>
{
    container.style.opacity="0.5";
    form.style.visibility="visible";
    
}