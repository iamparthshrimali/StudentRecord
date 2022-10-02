const validateDelete=()=>
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