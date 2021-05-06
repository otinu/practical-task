class PostCommentsController < ApplicationController
  
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.post_comments.new(post_comment_params)
    @comment.book_id = @book.id
    @comment.user_id = current_user.id
    @new_comment = PostComment.new
    @comment.save
  end

=begin  
    if comment.save
     redirect_to book_path(book)
    else
     flash[:notice] = "can't be blank"
     redirect_to book_path(book)
    end
=end

  def destroy
    @comment = PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    @book = Book.find_by(id: params[:book_id]) #対象のコメントを削除した後にrenderするために対象コメントのBOOKを再度取り出す必要がある
    #redirect_to book_path(params[:book_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
