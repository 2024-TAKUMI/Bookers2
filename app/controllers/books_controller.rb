class BooksController < ApplicationController

  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      redirect_to book_path(@book)
    else
      puts @book.errors.full_messages
      render 'new'
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def update
  end

  def correct_user
    post = Post.find(params[:id])
    if post.user != current_user
      redirect_to root_path, alert: "他のユーザの投稿は編集できません"
    end
  end

  private

  def book_params
    params.require(:book).permit(:image, :title, :caption)
  end

end