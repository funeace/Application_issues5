class SearchController < ApplicationController
  def result
    # binding.pry
    @search_text = params[:search_text]

    # モデルを取得し、Viewを部分テンプレートにすることでうまくいった
    if params[:search_model] == "User"
      @search_model = User
      @column = 'name'
    else
      @search_model = Book
      @column = 'title'
    end

    @search_match = params[:search_match]

    # シングルクォーテーションだと#{}の中も文字列と判定してしまう
    case params[:search_match]
    when "1" then
      @results = @search_model.where(["#{@column} LIKE?","#{@search_text}"])
    when "2" then
      @results = @search_model.where(["#{@column} LIKE?","#{@search_text}%"])
    when "3" then
      @results = @search_model.where(["#{@column} LIKE?","%#{@search_text}"])
    when "4" then
      @results = @search_model.where(["#{@column} LIKE?","%#{@search_text}%"])
    end
  end
end
