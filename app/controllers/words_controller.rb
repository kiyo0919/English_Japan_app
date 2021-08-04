class WordsController < ApplicationController
  
  def index
    @word = Word.new
    @user = current_user
    @words = Word.all
  end
  
  def create
    @word = Word.new(word_params)
    if @word.user_id = current_user.id
      @word.save
      redirect_to words_path
    else
      @words = Word.all
      @user = current_user
      render :index
    end
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
