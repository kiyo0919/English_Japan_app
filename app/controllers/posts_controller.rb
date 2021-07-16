class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @new_post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      @post = Post.all
      render :index
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
    def post_params
      params.require(:post).permit(:body, :image)
    end
end
