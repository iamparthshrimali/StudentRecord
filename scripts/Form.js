
 closeBtn.addEventListener("click",()=>{
      form.style.visibility="hidden";
      container.style.opacity="1";
 })

	const validateAdd=()=>
    {
		    if(fname.value=="" || lname.value=="" || roll_no.value=="")
            {
                error.style.display="block";
				error.innerText="All fields are mandatory";
                setTimeout(() => {
                    error.style.display="none";
                }, 5000);
                return false;
            }
			let isIDExist=false;
            allRollNumbers.forEach(no=> {
				// console.log(no.innerText,roll_no.value);

				if(no.innerText==roll_no.value)
				{
					error.style.display="block";
					error.innerText="ID already exist";
					setTimeout(() => {
						error.style.display="none";
					}, 5000);
					isIDExist=true;
				}
			});
			if(!isIDExist)
			{
				fname.value=fname.value.substring(0,1).toUpperCase()+fname.value.substring(1,fname.length).toLowerCase();
				lname.value=lname.value.substring(0,1).toUpperCase()+lname.value.substring(1,lname.length).toLowerCase();
		        return true;
			}
			return false;

	}