class BooksController < ApplicationController

  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      puts @book.errors.full_messages
      @user = current_user
      @books = Book.all
      render 'index'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "本当に消しますか？."
    redirect_to books_path
  end

  def correct_user
    post = Post.find(params[:id])
    if post.user != current_user
      redirect_to root_path, alert: "他のユーザの投稿は編集できません"
    end
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :body)
  end

end