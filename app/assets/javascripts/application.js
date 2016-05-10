$(document).on("ready", function(){
	$(".js-brief-description-content").slideUp();
	$(".js-results").slideUp();
	$(".js-comment-section").slideUp();

	$(".js-brief-description").on("click", function(){
		console.log("Wired");
		$(".js-brief-description-content").slideToggle();
	})

	$(".js-agree").on("click", function(){
		console.log("Wired");
		$(".js-results").slideToggle();
		$(".js-comment-section").slideToggle();
	})
})




























// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

