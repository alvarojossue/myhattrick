$(document).on("ready", function(){
	$(".js-brief-description-content").slideUp();

	$(".js-brief-description").on("click", function(){
		console.log("Wired");
		$(".js-brief-description-content").slideToggle();
	})

	$(".js-agree").on("click", function(){
		var selectedStatement = $(".js-agree").prop("id");

		console.log(selectedStatement)

		$.ajax({
			type: "post",
			url: `/api/statements/${selectedStatement}/agree`,
			success: function (data){
				console.log(data)
				showPercentageAgree(data);
				hideButtons();

			},
			error: function(error){
				console.log("Error");
				console.log(error.responseJSON)
			}
		})
	})

		$(".js-disagree").on("click", function(){
		var selectedStatement = $(".js-disagree").prop("id");

		console.log(selectedStatement)

		$.ajax({
			type: "post",
			url: `/api/statements/${selectedStatement}/disagree`,
			success: function (data){
				console.log(data)
				showPercentageDisagree(data);
				hideButtons();

			},
			error: function(error){
				console.log("Error");
				console.log(error.responseJSON)
			}
		})
	})

function showPercentageAgree(theObject){
	var agree = theObject.likes
	var totalReactions = theObject.total
	var percentage = (agree/totalReactions) * 100

	var html = `You + ${percentage}% agree`
	$(".js-results").text(html)
}

function showPercentageDisagree(theObject){
	var disagree = theObject.dislikes
	var totalReactions = theObject.total
	var percentage = (disagree/totalReactions) * 100

	var html = `You + ${percentage}% disagree`
	$(".js-results").text(html)
}

function hideButtons(){
	$(".js-agree").hide();
	$(".js-disagree").hide();
}



})

