class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id]) #create.js.erbで利用するための準備
    favorite = current_user.favorites.new(book_id: params[:book_id]) #current_userの持っているbook_idをfavoritesのbook_idへ
    favorite.save
    #redirect_back fallback_location: root_path
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: params[:book_id])
    favorite.destroy
    #redirect_back fallback_location: root_path
  end
  
end
