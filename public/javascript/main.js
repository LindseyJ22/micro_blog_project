$(function(){

	$('#edit_button').on('click', function(){
		$('#edit_background_container').show();
  });

  $('#edit_submit_button').on('click', function(){
  	$('#edit_background_container').hide();
  });
  $('#edit_post_button').on('click', function(){
  	$('#edit_post_container').show();
  });
});