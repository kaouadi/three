jQuery(function($) {



	$('#page_status_form a').live('click', function() {
		var hidden_field = $(this).parent('form').find('input[name=status]')[0];
		if(hidden_field) {
			hidden_field.value = $(this).data("status");
		}
		$(this).parent('form').submit() 
		return false;	
	});

});