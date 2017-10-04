class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :fetch_post, only: [:show, :edit, :update, :destroy, :like, :dislike]

	def index
		@posts = Post.of_followed_users(current_user.following).order('created_at DESC')
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = 'Your post has been created!'
			redirect_to root_path
		else
			flash.now[:alert] = 'Your new post couldn\'t be created!  Please check the form.'
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:success] = 'Post updated.'
	  	redirect_to @post
	  else
	  	flash.now[:alert] = 'Update failed.  Please check the form.'
	  	render 'edit'
	  end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def like
	  if @post.liked_by current_user
	     redirect_to root_path
	  end
	end

	def dislike
		if @post.unliked_by current_user
			redirect_to root_path
		end
	end

	def browse
	  @posts = Post.all.order('created_at DESC')
	end


	private
	
	def fetch_post
	  @post = Post.find(params[:id])
	end

	def post_params
  	params.require(:post).permit(:image, :caption, :user_id)
	end

end
