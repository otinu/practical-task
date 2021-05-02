class BooksController < ApplicationController

  def show
    @book = Book.joins(:user).find(params[:id])
    @book_new = Book.new
    @post_comment = PostComment.new
  end
  

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id # joinsを使わなくとも、current_userが活用できる場合はこのような方法も可
    if book.save
      flash[:notice] = "successfully!"
      redirect_to book_path(book.id)
    else
      flash[:alert] = "error / can't be blank or over 200words"
      flash[:notice] = "can't be blank"
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
    unless current_user.id == @book.user_id
      redirect_to books_path
    end
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit", notice: "error / can't be blank or over 200words"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
