class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
    @user = current_user
    @word = Word.new
  end
  
  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
    @new_post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post was successfully posted."
      redirect_to post_path(@post)
    else
      @posts = Post.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
      @user = current_user
      render :index
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :edit
    else
      redirect_to posts_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated."
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post was successfully deleted."
    redirect_to posts_path
  end
  
  private
  
    def post_params
      params.require(:post).permit(:body, :image)
    end
end
