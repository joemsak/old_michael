j$ = jQuery.noConflict();
j$(document).ready(function(){
	j$('#image_path').click(function(){
		j$(this).select();
	});
});