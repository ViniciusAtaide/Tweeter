class PostsController < InheritedResources::Base
	before_filter :authenticate_user!

  def new
    @post
  end
  def user
    @user = @post.user
  end
  def create
		@post = Post.new(title: params[:post][:title], content: params[:post][:content], user_id: current_user.id)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
	end
end