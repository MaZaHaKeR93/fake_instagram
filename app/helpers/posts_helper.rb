module PostsHelper
	def alert_for(flash_type)
	  { success: 'alert-success',
	    error: 'alert-danger',
	    alert: 'alert-warning',
	    notice: 'alert-info'
	  }[flash_type.to_sym] || flash_type.to_s
	end

	def liked_post(post)
    return 'glyphicon-heart' if current_user.voted_for? post
    'glyphicon-heart-empty'
  end
end
