$(document).on("ready", function(){
	$(".js-brief-description-content").slideUp();

	$(".js-brief-description").on("click", function(){
		console.log("Wired");
		$(".js-brief-description-content").slideToggle();
	})

	$(".js-submit").hide();

	$(".js-agree").on("click", function(){
		var selectedStatement = $(".js-agree").prop("id");

		console.log(selectedStatement)

		$.ajax({
			type: "post",
			url: `/api/statements/${selectedStatement}/agree`,
			success: function (data){
				console.log(data)
				showPercentageAgree(data);
				displayComments(data)
				hideButtons();
				showCommentSection();

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
				displayComments(data)
				hideButtons();
				showCommentSection();

			},
			error: function(error){
				console.log("Error");
				console.log(error.responseJSON)
			}
		})
	})

  $(".js-submit").on("submit", function(event){

    event.preventDefault();

	var selectedStatement = $(".js-disagree").prop("id");
    var theContent = $("#comment").val();
    console.log(theContent)


	var theComment = {
      content: theContent,
    };

    $.ajax({
      type: "POST",
      url: `/api/statements/${selectedStatement}/comment`,
      data: theComment,
      success: function(data){
      	console.log("SUCCESS");
      	console.log(data)
      	addComment(data)

      },
      error: function(error){
        console.log("FAIL");
        console.log("error.responseJSON");
    }
    });

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

function showCommentSection(){
	$(".js-submit").show();
}

function displayComments(theObject){
	theObject.comments.forEach(function(oneComment){
	var html = `
	<li>
		<p>${oneComment.body}<p>
	</li>`
	$(".js-all-comments").append(html)
	})
}

function addComment(theObject){
	var array = theObject.comments
	var comment = array[array.length - 1].body
	console.log(comment)
	var html = `<li> ${comment}</li>`
	$(".js-all-comments").append(html)
}

})











