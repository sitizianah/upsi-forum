//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require activestorage
// require turbolinks
//= require_tree .


$(document).ready(function (){
	setTimeout(function(){
		$('#notice_wrapper').fadeOut("fast",function(){
			$(this).remove();
		})
	},2500);
});

document.addEventListener("turbolinks:load", function() {
	tinymce.remove();
	tinymce.init({
	  height: '250',
	  selector:'textarea#answer_body',
	  plugins: "codesample image media link code",
	  branding: false,
	  toolbar: "undo redo | styleselect | bold italic link | codesample image media | code"
	});
 })