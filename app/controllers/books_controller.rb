class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.all
    @user = current_user
    if @book.save
       redirect_to book_path(@book) , notice:"You have creatad book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @book_comment = BookComment.new
    # @book_comments = @book.book_comments
    #新着順で表示
    @book_comments = @book.book_comments.order(created_at: :desc)
  end

  def edit
    @book =Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
   @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book) , notice:"You have updated book successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
