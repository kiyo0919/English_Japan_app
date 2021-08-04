class WordsController < ApplicationController
  
  def create
    @word = Word.new(word_params)
    if @word.user_id = current_user.id
      @word.save
      redirect_to posts_path
    else
      @posts = Post.all.order(created_at: :desc)
      @user = current_user
      render :index
    end
  end
  
  
  private
  
  def word_params
    params.require(:word).permit(:english, :japanese)
  end
end
