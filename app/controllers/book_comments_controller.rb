class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comments = @book.book_comments
    if @book_comment.save
      # redirect_to request.referer
    else
      @book_new = Book.new

    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @book_comments = @book.book_comments
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    # redirect_to request.referer
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
