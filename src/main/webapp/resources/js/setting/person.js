function showPerson() {
	
            closeAllHrContent();
            $("#person").show();
            $("#manageContent").show();
           
            $("button.group").removeClass("btn-success");
            $("button.group").addClass("btn-primary");
            
           person();
	}
