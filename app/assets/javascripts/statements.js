$(document).on("ready", function(){
	$(".js-brief-description-content").slideUp();

	$(".js-brief-description").on("click", function(){
		console.log("Wired");
		$(".js-brief-description-content").slideToggle(400);

		if($(".js-description-gly").hasClass('glyphicon-chevron-down') === true){
			$(".js-description-gly").removeClass('glyphicon-chevron-down')
			$(".js-description-gly").addClass('glyphicon-chevron-up')
		} else {
			$(".js-description-gly").removeClass('glyphicon-chevron-up')
			$(".js-description-gly").addClass('glyphicon-chevron-down')
		}
	})

	$(".js-comment-box").hide();
	$(".js-progress").hide();

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
	var percentage = parseInt((agree/totalReactions) * 100)

	var html = `You + ${percentage}% agree`

	var htmlProgress = `<div class="progress-bar" role="progressbar" aria-valuenow="70"
  		aria-valuemin="0" aria-valuemax="100" style="width: ${percentage}%">
  		</div>`


	$(".js-results").text(html)
	$(".js-progress").show();
	$(".js-progress").append(htmlProgress)
}

function showPercentageDisagree(theObject){
	var disagree = theObject.dislikes
	var totalReactions = theObject.total
	var percentage = parseInt((disagree/totalReactions) * 100)

	var html = `You + ${percentage}% disagree`
	var htmlProgress = `<div class="progress-bar" role="progressbar" aria-valuenow="70"
  		aria-valuemin="0" aria-valuemax="100" style="width: ${percentage}%">
  		</div>`

	$(".js-results").text(html)
	$(".js-progress").show();
	$(".js-progress").append(htmlProgress)
}

function hideButtons(){
	$(".js-agree").hide();
	$(".js-disagree").hide();
}

function showCommentSection(){
	$(".js-comment-box").show();
}

function displayComments(theObject){
	theObject.comments.forEach(function(oneComment){
	var html = `<li>
                <div class="commenterImage">
                  <img src="${oneComment.user.avatar.url}" />
                </div>
                <div class="commentText">
                    <p class=""><strong>${oneComment.user.name}</strong>: ${oneComment.body}</p> <p class="date sub-text">on ${oneComment.created_at}</p>
                </div>
            </li>`

	$(".js-all-comments").append(html)
	})
}

function addComment(theObject){
	var array = theObject.comments
	var comment = array[array.length - 1]
	var user = theObject.user
	var html = `
		            <li>
                <div class="commenterImage">
                  <img src="${comment.user.avatar.url}" />
                </div>
                <div class="commentText">
                    <p class="comment-text"><strong>${user}</strong>: ${comment.body}</p> <p class="date sub-text">on ${comment.created_at}</p>

                </div>
            </li>
    `

	$(".js-all-comments").append(html)
	$(".js-input").val(' ')
}

})









