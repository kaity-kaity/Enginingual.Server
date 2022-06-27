class WordsController < ApplicationController

  def word_post
    word = Word.find(params[:id])
          render json: { data: { id: word.id, text: word.word_name, translation: word.word_detail}}
  end
end
