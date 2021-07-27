class UsersController < ApplicationController
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.all
    @post = Post.new
    @user = current_user
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
    @post = Post.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your profile was successfully updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following
    @post = Post.new
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    @post = Post.new
    render 'show_follow'
  end
  
  
  def hide
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "successfully deleted."
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def admin_user
    redirect_to root_path unless current_user.admin?
  end
  
end
