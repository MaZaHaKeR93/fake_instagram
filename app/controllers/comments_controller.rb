class CommentsController < ApplicationController
	before_action :fetch_post
	# before_action :authenticate_user!
	#before_action :fetch_comment, only: [:show, :edit, :update, :destroy]

	# def index
	# 	@comment = Comment.all
	# end

	# def show
	# end

	# def new
	# 	@comment = Comment.new
	# end

	def create
	  @comment = @post.comments.build(comment_params)
	  @comment.user_id = current_user.id

	  if @comment.save
	    flash[:success] = "You commented the hell out of that post!"
	    redirect_to :back
	  else
	    flash[:alert] = "Check the comment form, something went horribly wrong."
	    render root_path
	  end
	end

	# def edit
	# end

	# def update
	# 	if @comment.update(comment_params)
	# 		flash[:success] = 'Comment updated.'
	#   	redirect_to @comment
	#   else
	#   	flash.now[:alert] = 'Update failed.  Please check the form.'
	#   	render 'edit'
	#   end
	# end

	def destroy
	  @comment = @post.comments.find(params[:id])

	  @comment.destroy
	  flash[:success] = "Comment deleted"
	  redirect_to root_path
	end

	private
	
	def fetch_post
  	@post = Post.find(params[:post_id])
	end

	def comment_params
  	params.require(:comment).permit(:content)
	end

end