class ProfilesController < ApplicationController
  before_action :fetch_user, only: [:show, :edit]
  
  def show
  	@posts = @user.posts.order('created_at DESC')
  end

	def edit
	end

	private

	def fetch_user
		@user = User.find_by(username: params[:username])
	end
end
