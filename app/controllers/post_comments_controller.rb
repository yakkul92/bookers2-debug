class PostCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_commemnts.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

private
  
  def book_comment_params
    params.require(:book).permit(:comment)
  end


end
