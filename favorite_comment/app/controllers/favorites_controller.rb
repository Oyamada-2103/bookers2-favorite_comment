class FavoritesController < ApplicationController
  before_action :authenticate_user!, :book_params

  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.new(user_id: current_user.id)
    favorite.save
    # redirect_to request.referer
    # 非同期通信機能実装のため削除
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    # redirect_to request.referer
    # 非同期通信機能実装のため削除
  end

  private
  def book_params
    @book = Book.find(params[:book_id])
  end
end
