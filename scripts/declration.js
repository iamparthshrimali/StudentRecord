let container=document.querySelector(".container");
let  roll_no=document.getElementsByName("add_roll_no")[0];
let fname=document.getElementsByName("add_fname")[0];
let lname=document.getElementsByName("add_lname")[0];
let error=document.getElementById("error");
let allRollNumbers=document.querySelectorAll(".unique");
let addForm=document.querySelector(".addForm");
let inputBox=document.querySelector(".inputBox");
let isAnySingleCheckBoxChecked=false,isEveryElementChecked=true;
let allCheckBox=document.querySelectorAll(".check_box");
let selectAllCheckBox=document.querySelector(".selectAllCheckBox");
let deleteBtn=document.querySelector(".delete-btn");
let searchPara=document.querySelector(".inputWrapDiv p");
let selectedIDs=document.getElementsByName("selectedIDs");
let allRowsDiv=document.querySelectorAll(".row");
let closeBtn=document.querySelector(".close");

