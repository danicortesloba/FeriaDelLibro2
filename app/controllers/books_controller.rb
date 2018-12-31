class BooksController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]
before_action :set_book, only: [:show, :edit, :update, :destroy, :add_genre, :remove_genre, :add_comment, :remove_comment]

  # GET /books
  # GET /books.json
  def index
    if params[:query].present?
      @books = Book.where("lower(title) LIKE ?", "%#{params[:query].downcase}%" )
    else
      @books = Book.all
    end
  end


  def add_genre
    @book.genres << Genre.new(name:params[:name])
    redirect_to books_path
  end

  def remove_genre
    genre = @book.genres.find(params[:genre_id])
    @book.genres.delete(genre)
    redirect_to book_path
  end

  def add_comment
    comment = Comment.new
    comment.content = params[:content]
    comment.user_id = current_user.id
    comment.publisher_id = @book.publisher.id
    comment.book_id = @book.id
    comment.save
    @book.comments << comment
    redirect_to books_path
  end

  def remove_comment
    genre = @book.comments.find(params[:comments_id])
    @book.comments.delete(comment)
    redirect_to book_path
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @comment = Comment.all
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:comments_attributes, :genres_attributes, :id, :title, :author_first_name, :author_last_name, :publisher_id, :cover, :price, :isbn, :synopsis)
    end

    def genre_params
      params.require(:genre).permit(:id)
    end

    def comment_params
      params.require(:comment).permit(:id, :content, :publisher_id, :user_id, :book_id)
    end
end
