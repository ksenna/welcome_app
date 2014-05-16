$(function(){

	$('.shit').on('click', function() {
		var task_id = $(this).attr("task-id"),
		temp = "#edit-task-" + task_id
		$(temp).modal('toggle');
	});

	$('#new-task-btn').on('click', function() {
		$('#new-task-modal').modal('toggle');
		$("#new_task").bind("ajax:beforeSend", function(event,xhr,status) {
			$('.new-input').val('');
		});
	});

	$('#save').on('click', function() {

		$()

	})


	$(':checkbox').on('click', function(){
		
		var row 			= $(this).parents('tr'),
				task_id 	= $(this).attr('data-task-id');
		
		// $(row).hide("slow");			Moved to ajax so a row only hides if it updates

		// console.log(task_id)
	

		// try toggleClass when checked, instead of addClass
		$.ajax({
			
			url: "/tasks/" + task_id,
			type: 'PUT',
			data: {
				task: {
					"completed": true,
				}
			},
			success: function(data){
				console.log(data);
				if (data == "1") {
					// return true
					// console.log("true");
					// $(row).hide( "slow" );
					$(row).toggleClass("completed");
				}
				else {
					// return false
					console.log("false");
					$(row).toggleClass("failed");
				}
			}

	});

});

});