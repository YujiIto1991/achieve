class PoemsController < ApplicationController
  def index
    #ActiveRecord
    #@poems = Poem.all
    
    #ActiveResource
    @poems = Poem.find(:all)
  end
  
  def show
      #ActiveRecord
      #@poems = Poem.find(params[:id]) 
      
      #ActiveResource
      #TODO ボタンを押したid以外のデータも取得してしまう
      #@poems = Poem.find(:all, :params => {:poem_id => params[:id]})
      @poems = Poem.find(params[:id])
  end
end
