class WordsController < ApplicationController
  
  def index
    @post = Post.new
    @word = Word.new
    @user = current_user
    @words = Word.where(user_id: current_user.id)
  end
  
  def create
    @word = Word.new(word_params)
    @word.user_id = current_user.id
    if @word.save
      flash[:notice] = "Word was successfully created."
      redirect_to words_path
    else
      @words = Word.where(user_id: current_user.id)
      @user = current_user
      @post = Post.new
      render :index
    end
  end
  
  def destroy
    word = Word.find(params[:id])
    word.destroy
    flash[:notice] = "Word was successfully deleted."
    redirect_to words_path
  end
  
  def search
    @words = Word.search(params[:keyword])
    @user = current_user
  end
  
  
  private
  
    def word_params
      params.require(:word).permit(:english, :japanese)
    end
end
