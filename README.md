specifications:

checkbox:
   select all checkbox is given
   the thing is also consired that if you select all the checkboxes one by one then automatically select all checkbox should be selected
   and vice versa if any of the checkbox is not selected then select all checkbox should not be live selected

Runtime search functionality is given
	(like you are pressing key on keyboard and seeing results as you want)


Delete button
  ->Delete button will be look disable unless and until you select atleast one  of the checkbox
  ->Delete button won't redirect the page to delete page until atleast one checkbox is selected
  ->Delete button's innertext will be changed to delete all when select all is checked or every checkbox is checked

Addform(Tried to make it as most similar to modal)
  ->validations are given like
        ->none of the field should be empty
        ->the id which is entered in AddForm is checked by javascript , so user will unable to add 
          the data with the same id
        ->The already id exist error shown within the form only instead redirecting to other page or alerting it
   ->when this addForm is displayed the scrolling is disable in body
   ->to focus only on the addForm while inserting data, the opacity of background(i.e container) is set to lower than addForm
   ->close button is given in addForm

modifying form
  all features of addForm + below things are considered like
  -->if you try to modify id 36 then all the details with id 36 will already be there in modify form and you can change them
     while changing the the data if user entered the id which belongs to other student then it will show the message like "id exist with other student"
  -->suppose there is too many data in the student table then there will be scroll bar in body, so modify form should be appear on that particular body section 
    where exactly you are at right now


       
