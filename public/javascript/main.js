$(function(){

	$('#edit_button').on('click', function(){
		$('#edit_background_container').show();
  });

  $('#edit_submit_button').on('click', function(){
  	$('#edit_background_container').hide();
  });

  $('#user_search').keyup(function(e){
  	let search_term = $(this).val();
  	if (search_term.length > 0){
			$.post('/search_for_user', {search_term: search_term},
				function(results){
					$('.results').html(results)
					console.log(results);
			});
  	}else{
  		$('.results').empty();
  	}
 });

});