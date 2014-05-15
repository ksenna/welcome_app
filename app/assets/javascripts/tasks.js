$(function(){
	
	$(':checkbox').on('click', function(){
		
		var row 			= $(this).parents('tr'),
				task_id 	= $(this).attr('data-task-id');
		
		// $(row).hide("slow");			Moved to ajax so a row only hides if it updates

		// console.log(task_id)
	
		$.ajax({
			
			url: "/tasks/" + task_id,
			type: 'PUT',
			data: {
				task: {
					"completed": true
				}
			},
			success: function(data){
				console.log(data);
				if (data == "1") {
					// return true
					// console.log("true");
					$(row).hide( "slow" );
				}
				else {
					// return false
					console.log("false");
					$(row).addClass("failed");
				}
			}

	});

});

});